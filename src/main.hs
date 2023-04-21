{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use guards" #-}
{-# HLINT ignore "Redundant if" #-}
{-# HLINT ignore "Redundant bracket" #-}

matrizNumeros :: [[Int]]
matrizNumeros = [[2,0,0,0,1,0],
                 [0,0,0,3,0,0],
                 [0,3,0,0,5,3],
                 [0,0,0,0,0,0],
                 [0,0,3,0,4,2],
                 [0,0,0,0,0,0]]

matrizRegioes :: [[Int]]
matrizRegioes = [[0 ,0 ,1 ,1 ,1 ,2],
                 [3 ,3 ,3 ,3 ,3 ,2],
                 [4 ,5 ,5 ,5 ,3 ,6],
                 [4 ,4 ,4 ,5 ,6 ,6],
                 [7 ,7 ,8 ,9 ,9 ,9],
                 [10,10,8 ,8 ,9 ,9]]

tamanhoMatriz :: Int
tamanhoMatriz = 6

quantidadeRegioes :: Int
quantidadeRegioes = 11

imprimirMatriz :: [[Int]] -> IO String
imprimirMatriz [] = return ""
imprimirMatriz (a:b) = do
    print a
    imprimirMatriz b

definirRegioes :: [[Int]] -> Int -> Int -> [[(Int, Int)]]
definirRegioes regioesMatriz quantidadeRegioes tamanhoMatriz =
    let regioes = replicate quantidadeRegioes []
    in atualizarRegioes regioesMatriz regioes tamanhoMatriz

atualizarRegioes :: [[Int]] -> [[(Int, Int)]] -> Int -> [[(Int, Int)]]
atualizarRegioes regioesMatriz regioes tamanhoMatriz =
    let coordenadas = [(i, j) | i <- [0..tamanhoMatriz-1], j <- [0..tamanhoMatriz-1]]
    in foldr (atualizarRegiao regioesMatriz) regioes coordenadas

atualizarRegiao :: [[Int]] -> (Int, Int) -> [[(Int, Int)]] -> [[(Int, Int)]]
atualizarRegiao regioesMatriz (i, j) regioes =
    let idRegiao = regioesMatriz !! i !! j
        regiaoAtualizada = (i, j) : (regioes !! idRegiao)
    in take idRegiao regioes ++ [regiaoAtualizada] ++ drop (idRegiao + 1) regioes

-- Parametros: i, j, numeros_matriz, regioes_matriz, regioes
kojun :: Int -> Int -> [[Int]] -> [[Int]] -> [[(Int, Int)]] -> Bool
kojun i j numerosMatriz regioesMatriz regioes =

    -- Percorreu a matriz inteira sem achar erros
    if (i == tamanhoMatriz - 1) && (j == tamanhoMatriz) then
        True

    -- Terminou a linha
    else if (j == tamanhoMatriz) then
        kojun (i+1) 0 numerosMatriz regioesMatriz regioes

    else if ((numerosMatriz !! i !! j) > 0) then
        kojun i (j+1) numerosMatriz regioesMatriz regioes

    else
        -- TO DO
        False

tamanhoRegiao :: [[(Int, Int)]] -> Int -> Int
tamanhoRegiao regioes idRegiao =
    length (regioes !! idRegiao)


main = do
    -- imprimirMatriz matrizRegioes
    -- print (definirRegioes matrizRegioes quantidadeRegioes tamanhoMatriz)
    print (kojun 0 0 matrizNumeros matrizRegioes (definirRegioes matrizRegioes quantidadeRegioes tamanhoMatriz))
    -- print (tamanhoRegiao (definirRegioes matrizRegioes quantidadeRegioes tamanhoMatriz) 1)
