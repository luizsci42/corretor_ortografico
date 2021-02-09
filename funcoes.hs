module Funcoes (
    dicionario,
    buscaDicionario,
    adicionar
) where

-- Aqui temos um dicionário
dicionario :: [String]
dicionario = ["Panafricanismo", "Diop", "Clarke"]
-- e uma lista de entrada
demo :: [String]
demo = ["OI", "Panafricanismo", "Diop", "Malcolm", "Manimba", "Clarke", "Maninba"]
-- lista de termos ignorados
ignorados :: [String]
ignorados = []

-- mostra quais palavras não estão presentes no dicionário
comparar :: [String] -> [String]
comparar (x:xs)
    -- caso base. Quando todos os termos da lista estão no dicionário, retorne a própria lista
    | null xs = [x | x <- x:xs]-- quando o termo existir no dicionário, vá para o próximo termo
    | buscaDicionario x dicionario = comparar xs
    | not (buscaDicionario x dicionario) = adicionar x dicionario
    | otherwise = comparar xs

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

mostrarLista :: [String] -> String 
mostrarLista (x:xs)
    | null xs = x
    | otherwise = mostrarLista xs

-- vamos comparar as palavras na lista de entrada e
-- consultar o usuário para qual decisão deve ser
-- tomada quando encontrarmos uma palavra desconhecida.
teste :: [String]
teste = comparar demo