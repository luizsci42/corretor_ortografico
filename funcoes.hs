-- Aqui temos um dicionário
dicionario :: [String]
dicionario = ["Panafricanismo", "Diop", "Clarke"]
-- e uma lista de entrada
demo :: [String]
demo = ["Panafricanismo", "Diop", "Malcolm", "Clarke", "Manimba"]
-- lista de palavras que estão na lista de entrada, mas não no dicionário
nExistentes :: [String]
nExistentes = []
-- lista de palavras ignoradas
ignorados :: [String]
ignorados = []

-- mostra quais palavras não estão presentes no dicionário
comparar :: [String] -> [String]
comparar (x:xs)
    -- caso base. Quando todos os termos da lista estão no dicionário, retorne a própria lista
    | null xs = [x | x <- x:xs]
    -- caso base para quando há itens não existentes no dicionário, retorne esses itens
    -- outro caso base, para retornar toda a lista de palavras n existentes em dicio
    | not (buscaDicionario x dicionario) = do
        _ <- ignorar x
        comparar xs
    -- quando o termo existir no dicionário, vá para o próximo termo
    | buscaDicionario x dicionario = comparar xs

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
adicionar :: String -> [String]
adicionar termo = termo:dicionario

ignorar :: String -> [String]
ignorar termo = termo:ignorados

-- vamos comparar as palavras na lista de entrada e
-- consultar o usuário para qual decisão deve ser
-- tomada quando encontrarmos uma palavra desconhecida.
teste :: [String]
teste = comparar demo