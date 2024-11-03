# use-groff-docker

Dockerized groff writing environment with Japanese character support

## How to use

1. Place *.roff file into `docs/`.

2. If you placed `foo.roff` inside `docs/`:
    ```bash
    $ docker run -v ./docs:/work/docs --rm -it ghcr.io/yude/use-groff-docker:master foo.roff
    ```

## License

MIT
