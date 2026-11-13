# librespeed

A standalone-only LibreSpeed image derived from the upstream
[`ghcr.io/librespeed/speedtest`](https://github.com/librespeed/speedtest)
image. It assembles the static web root during the image build and starts
Apache directly as UID/GID `10001` on unprivileged port `8080`.

The runtime does not execute the upstream root entrypoint, change file
ownership, or modify application files. Serve it with a read-only root
filesystem and a writable `/tmp` (for example, an `emptyDir` mount); PHP upload
and session temporary paths are configured under `/tmp`. Telemetry is not
included in this standalone image contract.

Build and run the hardened behavior test locally:

```bash
./test.sh
```

The test starts the image with a read-only root filesystem, only `/tmp`
writable, all Linux capabilities dropped, and `no-new-privileges`. It verifies
the web page and LibreSpeed's download, upload, and client-IP endpoints.
