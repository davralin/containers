FROM python:3.14-slim-bookworm AS build
SHELL ["sh", "-exc"]

ARG COMICS_VERSION=main

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    libxml2-dev \
    libxslt1-dev \
    && rm -rf /var/lib/apt/lists/*

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

ENV UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy \
    UV_PROJECT_ENVIRONMENT=/app \
    UV_PYTHON=/usr/local/bin/python \
    UV_PYTHON_DOWNLOADS=never

# Clone comics source
RUN git clone --depth 1 --branch "${COMICS_VERSION}" https://github.com/jodal/comics.git /src

# Install dependencies
RUN --mount=type=cache,target=/root/.cache <<EOT
cd /src
uv sync \
    --locked \
    --no-dev \
    --all-extras \
    --no-install-project
EOT

# Install the app itself
RUN --mount=type=cache,target=/root/.cache <<EOT
cd /src
uv sync \
    --locked \
    --no-dev \
    --all-extras \
    --no-editable
EOT

# Collect static files
ENV DJANGO_STATIC_ROOT=/app/static
RUN /app/bin/comics collectstatic --noinput && /app/bin/comics compress

# ---

FROM python:3.14-slim-bookworm AS runtime
SHELL ["sh", "-exc"]

ENV PATH=/app/bin:${PATH} \
    DJANGO_STATIC_ROOT=/app/static \
    DJANGO_MEDIA_ROOT=/media

# Create non-root user
RUN groupadd -g 1000 app && \
    useradd -g 1000 -u 1000 -d /home/app -s /sbin/nologin app && \
    mkdir -p /home/app /app /media && \
    chown -R app:app /home/app /app /media

# Copy app from build stage
COPY --from=build --chown=app:app /app /app

# Entrypoint script
COPY --chown=app:app entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

STOPSIGNAL SIGINT
USER 1000
WORKDIR /app
EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["web"]
