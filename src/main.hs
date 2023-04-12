criarMatriz :: Int -> [[Int]]
criarMatriz n = [[0 | j <- [1..n]] | i <- [1..n]]

imprimirMatriz :: [[Int]] -> IO String
imprimirMatriz [] = return ""
imprimirMatriz (a:b) = do
    print a
    imprimirMatriz b

main = do
    strNumber <- getLine
    let number = (read strNumber :: Int)
    imprimirMatriz (criarMatriz number)
