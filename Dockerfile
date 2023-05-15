# Usa uma imagem base do Haskell
FROM haskell:latest
# Define o diretório de trabalho do container como o diretório atual
WORKDIR .
# Copia o arquivo do código fonte do projeto para o container
COPY . .
# Compila o código Haskell
RUN ghc -o main Main.hs
# Executa o comando no ENTRYPOINT quando o container é iniciado
ENTRYPOINT ["./main"]

# Executa os comandos no CMD quando o container é iniciado
# CMD ["ghci", ":l main", "main"]