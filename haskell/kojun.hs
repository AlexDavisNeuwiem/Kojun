{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# OPTIONS_GHC -Wno-overlapping-patterns #-}
{-# HLINT ignore "Use guards" #-}
{-# HLINT ignore "Redundant if" #-}
{-# HLINT ignore "Redundant bracket" #-}


-- Definição da entrada:

-- Matriz com os números inicias do puzzle kojun
matrizNumerosInicial :: [[Int]]
matrizNumerosInicial = [[0, 0, 3, 0, 2, 0, 3, 0, 0, 0, 7, 0, 0, 5, 0, 3, 6], 
                        [0, 0, 0, 0, 0, 2, 0, 6, 0, 2, 0, 0, 3, 0, 0, 2, 0], 
                        [0, 2, 0, 0, 0, 0, 0, 0, 4, 0, 5, 1, 0, 2, 0, 0, 0], 
                        [3, 0, 7, 0, 0, 5, 0, 0, 0, 0, 0, 7, 4, 0, 2, 0, 0], 
                        [2, 1, 0, 2, 0, 0, 0, 3, 0, 5, 0, 0, 6, 0, 0, 0, 1], 
                        [0, 3, 4, 0, 0, 0, 3, 0, 0, 0, 3, 0, 5, 0, 0, 0, 3], 
                        [3, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
                        [0, 7, 0, 5, 2, 6, 0, 0, 0, 0, 1, 0, 1, 0, 2, 0, 6], 
                        [0, 0, 5, 0, 0, 2, 0, 5, 0, 5, 0, 7, 0, 3, 0, 4, 0], 
                        [0, 0, 0, 0, 7, 0, 3, 0, 2, 3, 0, 0, 4, 0, 0, 3, 1], 
                        [5, 0, 3, 0, 5, 0, 6, 0, 0, 4, 0, 4, 0, 3, 0, 0, 0], 
                        [0, 0, 0, 6, 0, 0, 0, 0, 4, 0, 5, 0, 0, 2, 0, 2, 0], 
                        [0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 1, 0, 0, 4, 0, 5], 
                        [0, 6, 3, 4, 0, 4, 5, 0, 6, 2, 0, 0, 1, 4, 0, 3, 0], 
                        [0, 2, 0, 0, 0, 0, 3, 0, 4, 0, 3, 0, 6, 0, 0, 0, 0], 
                        [0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0], 
                        [6, 2, 0, 0, 1, 3, 1, 7, 1, 2, 0, 4, 0, 4, 1, 0, 6]]

-- Matriz que define as regiões do quebra-cabeça. As regiões devem ser representadas por inteiros de 0 até n,
-- sendo n a quantidade de regiões - 1. Esses inteiros podem ser considerados o id de cada região.
matrizRegioes :: [[Int]]
matrizRegioes = [[0 , 1 , 1 , 1 , 1 , 2 , 3 , 4 , 4 , 5 , 6 , 6 , 7 , 7 , 8 , 9 , 9 ],
                 [10, 11, 11, 12, 3 , 3 , 3 , 13, 13, 13, 6 , 6 , 6 , 7 , 7 , 9 , 9 ],
                 [10, 10, 12, 12, 14, 14, 14, 13, 13, 13, 6 , 6 , 7 , 7 , 9 , 9 , 9 ],
                 [15, 15, 16, 16, 16, 14, 14, 17, 17, 18, 18, 18, 18, 19, 19, 20, 20],
                 [15, 15, 16, 16, 21, 22, 14, 17, 17, 18, 23, 24, 19, 19, 25, 26, 20],
                 [27, 28, 16, 16, 21, 22, 22, 22, 18, 18, 23, 19, 19, 25, 25, 26, 26],
                 [29, 28, 28, 29, 21, 30, 30, 22, 31, 23, 23, 32, 19, 25, 25, 33, 34],
                 [29, 29, 29, 29, 29, 35, 30, 30, 31, 23, 23, 32, 32, 25, 33, 33, 36],
                 [37, 38, 38, 38, 35, 35, 35, 30, 31, 39, 39, 39, 40, 40, 33, 36, 36],
                 [37, 37, 38, 41, 41, 35, 35, 30, 43, 39, 39, 39, 44, 40, 36, 36, 36],
                 [37, 37, 38, 41, 41, 41, 42, 43, 43, 43, 45, 39, 44, 44, 44, 44, 46],
                 [37, 37, 38, 38, 47, 41, 42, 42, 48, 48, 45, 45, 45, 44, 49, 46, 46],
                 [50, 51, 51, 52, 47, 41, 42, 42, 54, 48, 48, 45, 45, 49, 49, 49, 49],
                 [50, 50, 51, 52, 47, 47, 53, 42, 55, 48, 48, 56, 57, 57, 49, 58, 58],
                 [50, 50, 51, 52, 52, 53, 53, 59, 55, 55, 56, 56, 56, 57, 60, 58, 58],
                 [50, 50, 61, 61, 52, 53, 53, 59, 55, 55, 56, 62, 62, 57, 60, 60, 63],
                 [61, 61, 61, 61, 52, 52, 53, 53, 55, 55, 56, 56, 62, 60, 60, 60, 60]]





-- Resolução do problema:

-- Tamanho da matriz de números ou de regiões (têm sempre o mesmo tamanho)
tamanhoMatriz :: Int
tamanhoMatriz = length matrizNumerosInicial

-- Quantidade de regiões diferentes
quantidadeRegioes :: Int
quantidadeRegioes = maximum (concat matrizRegioes) + 1

-- Imprime as linhas da matriz separadamente para melhor visualização
imprimirMatriz :: [[Int]] -> IO String
imprimirMatriz [] = return ""
imprimirMatriz (a:b) = do
    putStrLn (listParaString a)
    imprimirMatriz b

-- Transforma uma lista em String
listParaString :: [Int] -> String
listParaString = unwords . map show

-- Dado um número "num" e uma posição da matriz "i j", retorna uma nova matriz com "num" na posicao "i j"
atualizarMatriz :: Int -> Int -> Int -> [[Int]] -> [[Int]]
atualizarMatriz num i j matriz =
    let linha = matriz !! i
        linhaAtualizada = (take j linha) ++ [num] ++ (drop (j + 1) linha)
    in (take i matriz) ++ [linhaAtualizada] ++ (drop (i+1) matriz)

-- A partir da matriz de regiões cria uma lista de listas em que cada lista interna representa uma região.
-- Cada lista de região conterá as coordenadas, representadas por tuplas (i, j) das células que a compõe.
-- Por exemplo: considerando uma matriz 2x2 com 2 regiões, em que as células da esquerda são da região 0
-- e as células da direita são da região 1, esse método gerará a seguinte estrutura:
-- [ [(0,0), (1,0)], [(0,1), (1,1)] ]
-- Essa estrutura facilita a verificação das células pertencentes a uma determinada região
-- Inicialmente cria uma lista com "quantidadeRegioes" listas vazias. Depois a preenche com a função 
-- "atualizarRegioes"
definirRegioes :: [[Int]] -> Int -> Int -> [[(Int, Int)]]
definirRegioes regioesMatriz quantidadeRegioes tamanhoMatriz =
    let regioes = replicate quantidadeRegioes []
    in atualizarRegioes regioesMatriz regioes tamanhoMatriz

-- Cria uma lista com todas coordenadas (i, j) e, com a função "foldr" do haskell, pega cada posição (i, j)
-- e aplica a função "atualizarRegiao", usando a lista de regioes como valor inicial.
atualizarRegioes :: [[Int]] -> [[(Int, Int)]] -> Int -> [[(Int, Int)]]
atualizarRegioes regioesMatriz regioes tamanhoMatriz =
    let coordenadas = [(i, j) | i <- [0..tamanhoMatriz-1], j <- [0..tamanhoMatriz-1]]
    in foldr (atualizarRegiao regioesMatriz) regioes coordenadas

-- Adiciona uma posição (i, j) na lista de sua região. Depois adiciona a lista da região atualizada na lista
-- de regioes.
atualizarRegiao :: [[Int]] -> (Int, Int) -> [[(Int, Int)]] -> [[(Int, Int)]]
atualizarRegiao regioesMatriz (i, j) regioes =
    let idRegiao = regioesMatriz !! i !! j
        regiaoAtualizada = (i, j) : (regioes !! idRegiao)
    in take idRegiao regioes ++ [regiaoAtualizada] ++ drop (idRegiao + 1) regioes

-- Tamanho de uma região a partir da lista de regiões e do id da região
tamanhoRegiao :: [[(Int, Int)]] -> Int -> Int
tamanhoRegiao regioes idRegiao =
    length (regioes !! idRegiao)

-- Função principal da solução. Retorna uma tupla (resultado, matriz) em que resultado é um boolean que 
-- indica se existe solução e matriz é a matriz dos números após a computação.
-- A função rececbe uma posição "i j" e, caso esteja vazia, procura um número válido para ocupá-la, por
-- meio da função "avaliarNumeros"
kojun :: Int -> Int -> [[Int]] -> [[Int]] -> [[(Int, Int)]] -> (Bool, [[Int]])
kojun i j numerosMatriz regioesMatriz regioes =

    -- Percorreu a matriz inteira sem achar erros
    if (i == tamanhoMatriz - 1) && (j == tamanhoMatriz) then
        (True, numerosMatriz)

    -- Terminou a linha
    else if (j == tamanhoMatriz) then
        kojun (i+1) 0 numerosMatriz regioesMatriz regioes

    -- Posição já está ocupada
    else if ((numerosMatriz !! i !! j) > 0) then
        kojun i (j+1) numerosMatriz regioesMatriz regioes

    -- Posição válida e vazia, procura um número para ocupá-la
    else
        let maxNum = tamanhoRegiao regioes (regioesMatriz !! i !! j)
        -- Começa avaliando a partir do maior número possível da região (segundo parâmetro)
        in avaliarNumeros maxNum i j numerosMatriz regioesMatriz regioes
    
-- Essa função tenta ocupar a posição i j com o número passado de parâmetro. Caso não consiga, tenta o próximo
-- número. Utiliza a função "numeroEhPossivel" para verificar se o número é válido para aquela casa. Caso consiga
-- um número válido, atualiza a matriz e chama o método para a próxima posição da matriz. É aqui que acontece o
-- backtracking. Caso uma posição tenha tentado todos os números possíveis e nenhum foi válido, significa que 
-- aconteceu pelo menos um erro nos números definidos anteriormente, então retornará false. Assim, mudará o número
-- da posição anterior, já que o algoritmo é recursivo. Se também não encontrar um número válido, também retornará
-- false e voltará para a posição anterior para procurar um novo número. O processo continua até que seja encontrada 
-- uma solução em que todas as casas tenham números válidos.
avaliarNumeros :: Int -> Int -> Int -> [[Int]] -> [[Int]] -> [[(Int, Int)]] -> (Bool, [[Int]])
avaliarNumeros num i j numerosMatriz regioesMatriz regioes =
    -- Tentou todos números e não encontrou número válido
    if (num <= 0) then 
        (False, numerosMatriz)
    -- Avaliará o número "num"
    else 
        -- Número é válido para posição i j
        if (numeroEhPossivel num i j numerosMatriz regioesMatriz regioes) then 
            let matrizAtualizada = atualizarMatriz num i j numerosMatriz
                -- Tenta preencher a próxima posição da matriz, chamando a função "kojun"
                (resultado, matriz) = kojun i (j+1) (matrizAtualizada) regioesMatriz regioes
            in
                -- Se o resultado do teste da próxima posição é válido, a posição atual também é válida
                if (resultado) then 
                    (resultado, matriz)
                -- Teste da próxima posição retornou inválido, tentar outro número para posição atual
                else
                    avaliarNumeros (num - 1) i j numerosMatriz regioesMatriz regioes
        -- Número não é válido, tentará o próximo número
        else
            avaliarNumeros (num - 1) i j numerosMatriz regioesMatriz regioes

-- Aplica as regras do kojun para verificar se "num" é válido na posição "i j". Caso todos os testes retornem
-- como True, a posição é válida, então realiza AND entre os resultados dos testes.
numeroEhPossivel :: Int -> Int -> Int -> [[Int]] -> [[Int]] -> [[(Int,Int)]] -> Bool
numeroEhPossivel num i j numerosMatriz regioesMatriz regioes =
    let regiao = regioes !! (regioesMatriz !! i !! j)
    in (verificarRegiao num regiao numerosMatriz) && 
       (verificarAdjacentes num i j numerosMatriz) &&
       (verificarCimaBaixo num i j numerosMatriz regioesMatriz)

-- Regra 1: uma região precisa ter todos os números de 1 a N sem repetição, sendo N a quantidade de células na região. 
-- A função verifica se todos os números na casa são diferentes. Como o algoritmo já preenche as casas com números de 
-- 1 a N, não é necessário verificcar se os números da casa estão nesse intervalo.
verificarRegiao :: Int  -> [(Int, Int)] -> [[Int]] -> Bool
verificarRegiao num regiao numerosMatriz =
    not (any (\(i, j) -> (numerosMatriz !! i !! j) == num) regiao)

-- Regra 2: Números em células ortogonalmente adjacentes devem ser diferentes.
-- Verifica se os números das células de cima, baixo, direita e esquerda são diferentes do número da célula i j.
verificarAdjacentes :: Int -> Int -> Int -> [[Int]] -> Bool
verificarAdjacentes num i j numerosMatriz =
    (not ((i-1 >= 0) && (numerosMatriz !! (i-1) !! j == num))) &&
    (not ((i+1 < tamanhoMatriz) && (numerosMatriz !! (i+1) !! j == num))) &&
    (not ((j-1 >= 0) && (numerosMatriz !! i !! (j-1) == num))) &&
    (not ((j+1 < tamanhoMatriz) && (numerosMatriz !! i) !! (j+1) == num)) 

-- Regra 3: Se duas células estiverem adjacentes verticalmente na mesma região, o número na célula superior deve ser 
-- maior que o número na célula inferior.
-- Verifica se as células de cima e de baixo da célula i j seguem a regra 3, ou seja, são decrescentes de cima para baixo.
verificarCimaBaixo :: Int -> Int -> Int -> [[Int]] -> [[Int]] -> Bool
verificarCimaBaixo num i j numerosMatriz regioesMatriz =
    -- Verifica se a casa de cima é da mesma região e é menor, que é inválido
    not (
            ((i-1) >= 0) && 
            ((regioesMatriz !! (i-1) !! j) == (regioesMatriz !! i !! j)) && 
            ((numerosMatriz !! (i-1) !! j) < num)
        )
    &&
    -- Verifica se a casa de baixo é da mesma região e é maior, que é inválido
    not (
            ((i+1) < tamanhoMatriz) && 
            ((regioesMatriz !! (i+1) !! j) == (regioesMatriz !! i !! j)) && 
            ((numerosMatriz !! (i+1) !! j) > num)
        )

-- Função main, chama a função kojun para a matriz de entrada determinada. Imprime na tela o resultado obtido.
main :: IO String
main = do
    
    let (ehPossivel, matriz) = kojun 0 0 matrizNumerosInicial matrizRegioes (definirRegioes matrizRegioes quantidadeRegioes tamanhoMatriz)
    if ehPossivel then
        imprimirMatriz matriz
    else
        putStrLn "Nao ha solucao" >> return ""
    