module Funcoes (
    dicionario,
    buscaDicionario,
    adicionar,
    ignorar,
    ignorados
) where

-- Aqui temos um dicionário
dicionario :: [String]
dicionario = ["Panafricanismo", "Diop", "Clarke"]
-- lista de termos ignorados
ignorados :: [String]
ignorados = [""]

-- pega um elemento da lista e procura no dicionário
-- retorna False quando a palavra não existe no dicionário
buscaDicionario :: String -> [String] -> Bool
buscaDicionario palavra (x:xs)
    -- caso em que o último item da lista é diferente da palavra
    | palavra /= x && null xs = False
    | palavra == x = True
    | otherwise = buscaDicionario palavra xs

-- função chamada quando o usuário resolve aceitar a nova palavra.
-- Adiciona o termo ao dicionário
adicionar :: String -> [String] -> [String]
adicionar termo dic = termo:dic

ignorar :: String -> [String]
ignorar termo = termo:ignorados