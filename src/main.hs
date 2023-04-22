{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# OPTIONS_GHC -Wno-overlapping-patterns #-}
{-# HLINT ignore "Use guards" #-}
{-# HLINT ignore "Redundant if" #-}
{-# HLINT ignore "Redundant bracket" #-}

import Debug.Trace

debug = flip trace

matrizNumerosInicial :: [[Int]]
matrizNumerosInicial = [[0, 4, 3, 0, 2, 5, 0, 0, 0, 0],
                        [0, 2, 0, 0, 0, 4, 2, 0, 3, 0],
                        [0, 0, 0, 1, 4, 0, 0, 1, 0, 0],
                        [5, 6, 0, 2, 3, 0, 5, 0, 0, 0],
                        [0, 3, 5, 0, 0, 0, 3, 0, 0, 0],
                        [0, 0, 0, 7, 0, 7, 0, 5, 0, 4],
                        [0, 0, 5, 3, 0, 2, 0, 4, 0, 0],
                        [0, 0, 1, 5, 0, 0, 0, 5, 3, 0],
                        [1, 3, 7, 0, 0, 0, 6, 0, 0, 5],
                        [2, 1, 0, 0, 3, 0, 1, 0, 3, 4]]

matrizRegioes :: [[Int]]
matrizRegioes = [[0 , 1 , 1 , 1 , 1 , 1 , 2 , 3 , 4 , 4 ],
                 [0 , 0 , 1 , 1 , 2 , 2 , 2 , 3 , 3 , 5 ],
                 [0 , 0 , 6 , 6 , 6 , 7 , 8 , 3 , 3 , 5 ],
                 [6 , 6 , 6 , 12, 12, 7 , 8 , 9 , 10, 11],
                 [6 , 13, 13, 12, 14, 7 , 8 , 9 , 10, 11],
                 [13, 13, 14, 14, 14, 15, 8 , 10, 10, 10],
                 [13, 13, 14, 14, 15, 15, 8 , 8 , 8 , 16],
                 [17, 17, 14, 18, 15, 15, 15, 15, 16, 16],
                 [17, 17, 18, 18, 18, 18, 18, 16, 16, 16],
                 [19, 19, 19, 19, 18, 20, 20, 20, 20, 16]]

tamanhoMatriz :: Int
tamanhoMatriz = length matrizNumerosInicial

quantidadeRegioes :: Int
quantidadeRegioes = maximum (concat matrizRegioes) + 1

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

atualizarMatriz :: Int -> Int -> Int -> [[Int]] -> [[Int]]
atualizarMatriz num i j matriz =
    let linha = matriz !! i
        linhaAtualizada = (take j linha) ++ [num] ++ (drop (j + 1) linha)
    in (take i matriz) ++ [linhaAtualizada] ++ (drop (i+1) matriz)

-- Parametros: i, j, numeros_matriz, regioes_matriz, regioes
kojun :: Int -> Int -> [[Int]] -> [[Int]] -> [[(Int, Int)]] -> (Bool, [[Int]])
kojun i j numerosMatriz regioesMatriz regioes =

    -- Percorreu a matriz inteira sem achar erros
    if (i == tamanhoMatriz - 1) && (j == tamanhoMatriz) then
        (True, numerosMatriz)

    -- Terminou a linha
    else if (j == tamanhoMatriz) then
        kojun (i+1) 0 numerosMatriz regioesMatriz regioes

    else if ((numerosMatriz !! i !! j) > 0) then
        kojun i (j+1) numerosMatriz regioesMatriz regioes

    else
        let maxNum = tamanhoRegiao regioes (regioesMatriz !! i !! j)
        in avaliarNumeros 1 maxNum i j numerosMatriz regioesMatriz regioes
        
avaliarNumeros :: Int -> Int -> Int -> Int -> [[Int]] -> [[Int]] -> [[(Int, Int)]] -> (Bool, [[Int]])
avaliarNumeros num maxNum i j numerosMatriz regioesMatriz regioes =
    if (num > maxNum) then 
        (False, numerosMatriz)
    else 
        if (numeroEhPossivel num i j numerosMatriz regioesMatriz regioes) then 
            let matrizAtualizada = atualizarMatriz num i j numerosMatriz
                (resultado, matriz) = kojun i (j+1) (matrizAtualizada) regioesMatriz regioes
            in 
                if (resultado) then 
                    (resultado, matriz)
                else
                    avaliarNumeros (num + 1) maxNum i j numerosMatriz regioesMatriz regioes
        else
            avaliarNumeros (num + 1) maxNum i j numerosMatriz regioesMatriz regioes
            
tamanhoRegiao :: [[(Int, Int)]] -> Int -> Int
tamanhoRegiao regioes idRegiao =
    length (regioes !! idRegiao)

-- TO DO
numeroEhPossivel :: Int -> Int -> Int -> [[Int]] -> [[Int]] -> [[(Int,Int)]] -> Bool
numeroEhPossivel num i j numerosMatriz regioesMatriz regioes =
    let regiao = regioes !! (regioesMatriz !! i !! j)
    in (verificarRegiao num regiao numerosMatriz) && 
       (verificarAdjacentes num i j numerosMatriz) &&
       (verificarCima num (i-1) i j numerosMatriz regioesMatriz) &&
       (verificarBaixo num (i+1) i j numerosMatriz regioesMatriz)

verificarRegiao :: Int  -> [(Int, Int)] -> [[Int]] -> Bool
verificarRegiao num regiao numerosMatriz =
    not (any (\(i, j) -> (numerosMatriz !! i !! j) == num) regiao)

verificarAdjacentes :: Int -> Int -> Int -> [[Int]] -> Bool
verificarAdjacentes num i j numerosMatriz =
    (not ((i-1 >= 0) && (numerosMatriz !! (i-1) !! j == num))) &&
    (not ((i+1 < tamanhoMatriz) && (numerosMatriz !! (i+1) !! j == num))) &&
    (not ((j-1 >= 0) && (numerosMatriz !! i !! (j-1) == num))) &&
    (not ((j+1 < tamanhoMatriz) && (numerosMatriz !! i) !! (j+1) == num)) 

verificarCima :: Int -> Int -> Int -> Int -> [[Int]] -> [[Int]] -> Bool
verificarCima num it i j numerosMatriz regioesMatriz =
    if (it <= -1) then
        True
    else if (regioesMatriz !! it !! j) /= (regioesMatriz !! i !! j) then
        True
    else
        if (numerosMatriz !! it !! j) < num then
            False
        else
            verificarCima num (it-1) i j numerosMatriz regioesMatriz

verificarBaixo :: Int -> Int -> Int -> Int -> [[Int]] -> [[Int]] -> Bool
verificarBaixo num it i j numerosMatriz regioesMatriz =
    if (it >= tamanhoMatriz) then
        True
    else if (regioesMatriz !! it !! j) /= (regioesMatriz !! i !! j) then
        True
    else
        if (numerosMatriz !! it !! j) > num then
            False
        else
            verificarBaixo num (it+1) i j numerosMatriz regioesMatriz

main = do
    let (ehPossivel, matriz) = kojun 0 0 matrizNumerosInicial matrizRegioes (definirRegioes matrizRegioes quantidadeRegioes tamanhoMatriz)
    if ehPossivel then
        imprimirMatriz matriz
    else
        putStrLn "Nao ha solucao" >> return ""
