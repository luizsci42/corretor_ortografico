module ES (es, exec) where
import Funcoes

es :: [String] -> IO ()
es dic = do
    _ <- putStrLn "Digite algumas palavras. Para parar, entre com uma linha em branco"
    linha <- getLine
    -- se a linha não for nula, verifique se a palavra existe no dicionario
    if not (null linha) then
        -- se a palavra existe no dicionário
        if buscaDicionario linha dicionario then do
            print "Existe no dicionario"
        -- se a palavra não existe no dicionário
        else do
            -- pergunte ao usuário se ele quer adicionar ao dicionário, substituir ou ignorar
            putStr "Nao existe no dicionario. "
            putStrLn "Deseja adicionar ao dicionario (a), substituir (s) ou ignorar (i)?"
            decisao <- getLine
            if decisao == "a" then do
                let dicAtualizado = adicionar linha dic
                print "Adicionado!"
                es dicAtualizado
            else do
                return ()
            if decisao == "s" then do
                print "Substituir"
            else do
                return ()
            if decisao == "i" then do
                print "ignorar"
            else do
                return ()
            if decisao /= "a" && decisao /= "s" && decisao /= "i" then do
                print "Opcao invalida"
            else do
                return ()
    -- se a linha for vazia, mostre a lista de saída
    else do
       print dic

exec = es dicionario