module ES (es, exec) where
import Funcoes

listaSaida :: [String]
listaSaida = []

es :: [String] -> [String] -> [String] -> IO ()
es dic saida ign = do
    _ <- putStrLn "Digite algumas palavras. Para parar, entre com uma linha em branco"
    linha <- getLine
    -- se a linha não for nula, verifique se a palavra existe no dicionario
    if not (null linha) then
        -- se a palavra existe no dicionário
        if buscaDicionario linha dicionario then do
            print "Existe no dicionario"
            let saidaAtual = adicionar linha saida
            es dic saidaAtual ign
        -- se a palavra não existe no dicionário
        else do
            -- pergunte ao usuário se ele quer adicionar ao dicionário, substituir ou ignorar
            putStr "Nao existe no dicionario. "
            putStrLn "Deseja adicionar ao dicionario (a), substituir (s) ou ignorar (i)?"
            decisao <- getLine
            if decisao == "a" then do
                -- adicionar ao dicionário e atualizar a lista de saída
                let dicAtualizado = adicionar linha dic
                print "Adicionado!"
                let saidaAtual = adicionar linha saida
                es dicAtualizado saidaAtual ign
            else do
                return ()
            if decisao == "s" then do
                _ <- putStrLn "Digite uma nova palavra"
                es dic saida ign
            else do
                return ()
            if decisao == "i" then do
                -- Atualizar a saida e a lista de saida
                print "ignorar"
                let ignAtualizado = ignorar linha
                let saidaAtual = adicionar linha saida
                es dic saidaAtual ignAtualizado
            else do
                return ()
            if decisao /= "a" && decisao /= "s" && decisao /= "i" then do
                print "Opcao invalida"
            else do
                return ()
    -- se a linha for vazia, mostre a lista de saída
    else do
        _ <- putStr "Saida: "
        print saida
        _ <- putStr "Ignorados: "
        print ign

exec :: IO ()
exec = es dicionario listaSaida ignorados 