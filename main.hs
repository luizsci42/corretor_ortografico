module Main (main) where
import Funcoes
    
main :: IO ()
main = do
    _ <- putStrLn "Digite algumas palavras. Para parar, entre com uma linha em branco"
    linha <- getLine
    -- se a linha não for nula, verifique se a palavra existe no dicionario
    if not (null linha) then
        -- se a palavra existe no dicionário
        if buscaDicionario linha dicionario then do
            print "Existe no dic"
            main
        -- se a palavra não existe no dicionáriod            
        else do
            print "N existe no dic"
            main
    -- se a linha for vazia, mostre a lista de saída
    else do
       print dicionario