# Usa uma imagem base do Haskell
FROM haskell:latest

# Cria um diretório para a aplicação
WORKDIR /app

# Copia os arquivos do código fonte do projeto para o container
COPY . .

# Compila a aplicação usando o GHC
RUN ghc -o app Main.hs

# Define o comando padrão para executar a aplicação
CMD ["./app"]