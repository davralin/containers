FROM python:3.14-slim-bookworm@sha256:f21c0d5a44c56805654c15abccc1b2fd576c8d93aca0a3f74b4aba2dc92510e2 AS build
SHELL ["sh", "-exc"]

ARG COMICS_VERSION=main

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Install uv
COPY --from=ghcr.io/astral-sh/uv:0.11.5@sha256:555ac94f9a22e656fc5f2ce5dfee13b04e94d099e46bb8dd3a73ec7263f2e484 /uv /usr/local/bin/uv

ENV UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy \
    UV_PROJECT_ENVIRONMENT=/app \
    UV_PYTHON=/usr/local/bin/python \
    UV_PYTHON_DOWNLOADS=never

# Clone comics source
RUN git clone --depth 1 --branch "${COMICS_VERSION}" https://github.com/jodal/comics.git /src

# Install dependencies
# Upstream lockfile pins httpcore 1.0.7 which crashes on Python 3.14
# (typing.Union.__module__ AttributeError, fixed in httpcore 1.0.8+).
# Delete the lockfile so uv sync re-resolves all dependencies.
# See: https://github.com/davralin/containers/issues/59
RUN rm -f /src/uv.lock

RUN --mount=type=cache,target=/root/.cache <<EOT
cd /src
uv sync \
    --no-dev \
    --all-extras \
    --no-install-project
EOT

# Install the app itself
RUN --mount=type=cache,target=/root/.cache <<EOT
cd /src
uv sync \
    --no-dev \
    --all-extras \
    --no-editable
EOT

# Collect static files
ENV DJANGO_STATIC_ROOT=/app/static
RUN /app/bin/comics collectstatic --noinput && /app/bin/comics compress

# ---

FROM python:3.14-slim-bookworm@sha256:f21c0d5a44c56805654c15abccc1b2fd576c8d93aca0a3f74b4aba2dc92510e2 AS runtime
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
