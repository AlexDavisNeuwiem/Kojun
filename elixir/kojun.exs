#Matriz com os números inicias do puzzle kojun
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

#Matriz que define as regiões do quebra-cabeça. As regiões devem ser representadas por inteiros de 0 até n,
#Sendo n a quantidade de regiões - 1. Esses inteiros podem ser considerados o id de cada região.
#matrizRegioes = [[0 , 1 , 1 , 1 , 1 , 2 , 3 , 4 , 4 , 5 , 6 , 6 , 7 , 7 , 8 , 9 , 9 ],
#                 [10, 11, 11, 12, 3 , 3 , 3 , 13, 13, 13, 6 , 6 , 6 , 7 , 7 , 9 , 9 ],
#                 [10, 10, 12, 12, 14, 14, 14, 13, 13, 13, 6 , 6 , 7 , 7 , 9 , 9 , 9 ],
#                 [15, 15, 16, 16, 16, 14, 14, 17, 17, 18, 18, 18, 18, 19, 19, 20, 20],
#                 [15, 15, 16, 16, 21, 22, 14, 17, 17, 18, 23, 24, 19, 19, 25, 26, 20],
#                 [27, 28, 16, 16, 21, 22, 22, 22, 18, 18, 23, 19, 19, 25, 25, 26, 26],
#                 [29, 28, 28, 29, 21, 30, 30, 22, 31, 23, 23, 32, 19, 25, 25, 33, 34],
#                 [29, 29, 29, 29, 29, 35, 30, 30, 31, 23, 23, 32, 32, 25, 33, 33, 36],
#                 [37, 38, 38, 38, 35, 35, 35, 30, 31, 39, 39, 39, 40, 40, 33, 36, 36],
#                 [37, 37, 38, 41, 41, 35, 35, 30, 43, 39, 39, 39, 44, 40, 36, 36, 36],
#                 [37, 37, 38, 41, 41, 41, 42, 43, 43, 43, 45, 39, 44, 44, 44, 44, 46],
#                 [37, 37, 38, 38, 47, 41, 42, 42, 48, 48, 45, 45, 45, 44, 49, 46, 46],
#                 [50, 51, 51, 52, 47, 41, 42, 42, 54, 48, 48, 45, 45, 49, 49, 49, 49],
#                 [50, 50, 51, 52, 47, 47, 53, 42, 55, 48, 48, 56, 57, 57, 49, 58, 58],
#                 [50, 50, 51, 52, 52, 53, 53, 59, 55, 55, 56, 56, 56, 57, 60, 58, 58],
#                 [50, 50, 61, 61, 52, 53, 53, 59, 55, 55, 56, 62, 62, 57, 60, 60, 63],
#                 [61, 61, 61, 61, 52, 52, 53, 53, 55, 55, 56, 56, 62, 60, 60, 60, 60]]
matrizRegioes = [[0,0,1,1,1,2],
                  [3,3,3,3,3,2],
                  [4,5,5,5,3,6],
                  [4,4,4,5,6,6],
                  [7,7,8,9,9,9],
                  [10,10,8,8,9,9]]



tamanhoMatriz = 6
#tamanhoMatriz = length(matrizNumerosInicial)

#Kj de KoJun
defmodule Kj do

  def quantidadeRegioes(matriz) do
    #flatten() converte a matriz para uma lista plana
    matriz |> List.flatten() |> Enum.max() |> Kernel.+(1)
  end

  def imprimirMatriz(matriz), do: IO.inspect matriz

  #Dado um número "num" e uma posição da matriz "i j", retorna uma nova matriz com "num" na posicao "i j"
  def atualizarMatriz(matriz, num, i, j) do
    linha = Enum.at(matriz, i)      #Enum.at pega a linha atual
    linha_atualizada = List.replace_at(linha, j, num)
    List.replace_at(matriz, i, linha_atualizada)
  end


  #A partir da matriz de regiões cria uma lista de listas em que cada lista interna representa uma região.
  #Cada lista de região conterá as coordenadas, representadas por tuplas (i, j) das células que a compõe.
  #Por exemplo: considerando uma matriz 2x2 com 2 regiões, em que as células da esquerda são da região 0
  #e as células da direita são da região 1, esse método gerará a seguinte estrutura:
  #[ [(0,0), (1,0)], [(0,1), (1,1)] ]
  #Essa estrutura facilita a verificação das células pertencentes a uma determinada região
  #Inicialmente cria uma lista com "quantidadeRegioes" listas vazias. Depois a preenche com a função atualizarRegioes
  def definirRegioes(regioesMatriz, qtdadeRegioes, tamanhoMatriz) do
    regioes = List.duplicate([], qtdadeRegioes)
    atualizarRegioes(regioesMatriz, regioes, tamanhoMatriz)
  end


  #Cria uma lista com todas coordenadas (i, j) e, com a função Enum.reduce do haskell, pega cada posição (i, j)
  #e aplica a função "atualizarRegiao", usando a lista de regioes como valor inicial.

  def atualizarRegioes(regioes_matriz, regioes, tamanho_matriz) do
    coordenadas = for i <- 0..(tamanho_matriz-1), j <- 0..(tamanho_matriz-1), do: {i, j}
    Enum.reduce(coordenadas, regioes, &atualizarRegiao(regioes_matriz, &1, &2))
  end

  #Adiciona uma posição (i, j) na lista de sua região. Depois adiciona a lista da região atualizada na lista de regioes.
  def atualizarRegiao(regioes_matriz, {i,j}, regioes) do

    idRegiao = Enum.at(Enum.at(regioes_matriz,i),j)
    regiao_atualizada = Enum.at(regioes, idRegiao) ++ [{i, j}]
    List.replace_at(regioes, idRegiao, regiao_atualizada)

  end

  def tamanhoRegiao(regioes, idRegiao), do: regioes[idRegiao] |> length()



end


IO.inspect Kj.definirRegioes(matrizRegioes, Kj.quantidadeRegioes(matrizRegioes), tamanhoMatriz)

#CONTINUAR A PARTIR DA LINHA 112 DO CÓDIGO .hs
