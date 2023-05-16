# Projeto final da disciplina Programação Funcional 2020.1
Aplicação exemplo de corretor ortográfico, utilizando conceitos de programação funcional através da linguagem Haskell. 

## Execução
Para executar, abra o ghci no terminal, carrega o módulo main, através do comando :l Main, digite uma palavra e siga as instruções.

```shell
$ ghci

$ Prelude> :l Main

$ *Main> main
```

## Docker container
Para executar em um container do Docker, utilize a flag -it, por exemplo:

```shell
$ docker run -itp 3000:3000 luizsci42/corretor-ortografico-haskell
```

em que a flag: 

* `-i` ou `--interactive` mantém o stdin (entrada padrão) aberto mesmo que não esteja conectado a um terminal. Ela permite que você forneça entrada interativa para o container, como responder a prompts ou interagir com o programa em execução.

* `-t` ou `--tty` aloca um pseudo-TTY (terminal) para o container. Ela é usada para emular um terminal dentro do container, permitindo que você veja e interaja com a saída do programa em execução como se estivesse executando diretamente em um terminal.

* `-p` ou `--publish` é usada no comando docker run para publicar (expor) portas específicas do container para o host. Isso permite que os serviços em execução dentro do container sejam acessíveis do host ou de outros containers.