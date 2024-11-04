# use-groff-docker

Dockerized groff writing environment with Japanese character support
Some files are from [Linux でも日本語の man page を印刷したい！](https://zenn.dev/kusaremkn/articles/1b4bf13e0b938b).

## How to use

### Build the image
```bash
$ make
```

### Rendering your word

1. Place *.roff file into `docs/`.

2. If you placed `foo.roff` inside `docs/`:
    ```bash
    $ docker run -v ./docs:/work/docs --rm -it ghcr.io/yude/use-groff-docker:master foo.roff
    ```

### Rendering manual page

* Render the specific manual page
    ```bash
    $ docker run -v ./docs:/work/docs --entrypoint "do-man" --rm -it ghcr.io/yude/use-groff-docker:master cat.1
    ```
* Render all manual pages
    ```bash
    $ docker run -v ./docs:/work/docs --entrypoint "do-man-all" --rm -it ghcr.io/yude/use-groff-docker:master
    ```

## License

MIT
