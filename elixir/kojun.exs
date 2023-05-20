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



tamanhoMatriz = length(matrizNumerosInicial)

#Kj de KoJun
defmodule Kj do

  def quantidadeRegioes(matriz) do
    #flatten() converte a matriz para uma lista plana
    matriz |> List.flatten() |> Enum.max() |> Kernel.+(1)
  end

  def imprimirMatriz(matriz) do
    if matriz == [] do
      ""
    else
      [head | tail] = matriz
      IO.puts(Enum.join(head," "))
      imprimirMatriz(tail)
    end
  end


  #Dado um número "num" e uma posição da matriz "i j", retorna uma nova matriz com "num" na posicao "i j"
  def atualizarMatriz(num, i, j, matriz) do
    linha = Enum.at(matriz, i)      #Enum.at pega a linha atual
    linha_atualizada = List.replace_at(linha, j, num)
    List.replace_at(matriz, i, linha_atualizada)
  end


  # A partir da matriz de regiões cria uma lista de listas em que cada lista interna representa uma região.
  # Cada lista de região conterá as coordenadas, representadas por tuplas (i, j) das células que a compõe.
  # Por exemplo: considerando uma matriz 2x2 com 2 regiões, em que as células da esquerda são da região 0
  #e as células da direita são da região 1, esse método gerará a seguinte estrutura:
  #[ [(0,0), (1,0)], [(0,1), (1,1)] ]
  # Essa estrutura facilita a verificação das células pertencentes a uma determinada região
  # Inicialmente cria uma lista com "quantidadeRegioes" listas vazias. Depois a preenche com a função atualizarRegioes
  def definirRegioes(regioesMatriz, qtdadeRegioes, tamanhoMatriz) do
    regioes = List.duplicate([], qtdadeRegioes)
    atualizarRegioes(regioesMatriz, regioes, tamanhoMatriz)
  end

  # Cria uma lista com todas coordenadas (i, j) e, com a função Enum.reduce do Elixir, pega cada posição (i, j)
  #e aplica a função "atualizarRegiao", usando a lista de regioes como valor inicial.

  def atualizarRegioes(regioes_matriz, regioes, tamanho_matriz) do
    coordenadas = for i <- 0..(tamanho_matriz-1), j <- 0..(tamanho_matriz-1), do: {i, j}
    Enum.reduce(coordenadas, regioes, &atualizarRegiao(regioes_matriz, &1, &2))
  end

  # Adiciona uma posição (i, j) na lista de sua região. Depois adiciona a lista da região atualizada na lista de regioes.
  def atualizarRegiao(regioes_matriz, {i,j}, regioes) do
    idRegiao = Enum.at(Enum.at(regioes_matriz,i),j)
    regiao_atualizada = Enum.at(regioes, idRegiao) ++ [{i, j}]
    List.replace_at(regioes, idRegiao, regiao_atualizada)
  end

  def tamanhoRegiao(regioes, idRegiao), do: Enum.at(regioes, idRegiao) |> length()


  # Função principal da solução. Retorna uma tupla (resultado, matriz) em que resultado é um boolean que
  #indica se existe solução e matriz é a matriz dos números após a computação.
  # A função rececbe uma posição "i j" e, caso esteja vazia, procura um número válido para ocupá-la,
  #por meio da função "avaliarNumeros"
  def kojun(i, j, numerosMatriz, regioesMatriz, regioes, tamanhoMatriz) do
    cond do
      # Percorreu a matriz inteira sem achar erros
      (i == tamanhoMatriz - 1) and (j == tamanhoMatriz) ->
        {true, numerosMatriz}

      # Terminou a linha
      (j == tamanhoMatriz) ->
        kojun((i+1), 0, numerosMatriz, regioesMatriz, regioes, tamanhoMatriz)

      # Posição já está ocupada
      (Enum.at(Enum.at(numerosMatriz, i), j) > 0) ->
        kojun(i, (j+1), numerosMatriz, regioesMatriz, regioes, tamanhoMatriz)

      # Posição válida e vazia, procura um número para ocupá-la
      true ->
        maxNum = tamanhoRegiao(regioes, Enum.at(Enum.at(regioesMatriz, i), j))
        # Começa avaliando a partir do maior número possível da região (segundo parâmetro)
        avaliarNumeros(maxNum, i, j, numerosMatriz, regioesMatriz, regioes, tamanhoMatriz)
    end
  end


  # Essa função tenta ocupar a posição i j com o número passado de parâmetro. Caso não consiga, tenta o próximo
  #número. Utiliza a função "numeroEhPossivel" para verificar se o número é válido para aquela casa. Caso consiga
  #um número válido, atualiza a matriz e chama o método para a próxima posição da matriz. É aqui que acontece o
  #backtracking. Caso uma posição tenha tentado todos os números possíveis e nenhum foi válido, significa que
  #aconteceu pelo menos um erro nos números definidos anteriormente, então retornará false. Assim, mudará o número
  #da posição anterior, já que o algoritmo é recursivo. Se também não encontrar um número válido, também retornará
  #false e voltará para a posição anterior para procurar um novo número. O processo continua até que seja encontrada
  #uma solução em que todas as casas tenham números válidos.
  def avaliarNumeros(num, i, j, numerosMatriz, regioesMatriz, regioes, tamanhoMatriz) do
    # Tentou todos os números e não encontrou nenhum válido
    if (num <= 0) do
      {false, numerosMatriz}
    else
      # Número é válido para posição i j
      if numeroEhpossivel(num, i, j, numerosMatriz, regioesMatriz, regioes, tamanhoMatriz) do
        matrizAtualizada = atualizarMatriz(num, i, j, numerosMatriz)
        # Tenta preencher a próxima posição da matriz, chamando a função "kojun"
        {resultado, matriz} = kojun(i, (j+1), matrizAtualizada, regioesMatriz, regioes, tamanhoMatriz)

        # Se o resultado do teste da próxima posição é válido, a posição atual também é válida.
        if (resultado) do
          {resultado, matriz}
        #T este da próxima posição retornou inválido, tentar outro número para posição atual.
        else
          avaliarNumeros((num - 1), i, j, numerosMatriz, regioesMatriz, regioes, tamanhoMatriz)
        end
      # úmero não é válido, tentará o próximo número
      else
        avaliarNumeros((num - 1), i, j, numerosMatriz, regioesMatriz, regioes, tamanhoMatriz)
      end

    end
  end

  # Aplica as regras do kojun para verificar se "num" é válido na posição "i j". Caso todos os testes retornem
  #como True, a posição é válida, então realiza AND entre os resultados dos testes.
  def numeroEhpossivel(num, i, j, numerosMatriz, regioesMatriz, regioes, tamanhoMatriz) do
    regiao = Enum.at(regioes, Enum.at(Enum.at(regioesMatriz, i), j))

    verificarRegiao(num, regiao, numerosMatriz) and
    verificarAdjacentes(num, i, j, numerosMatriz, tamanhoMatriz) and
    verificarCimaBaixo(num, i, j, numerosMatriz, regioesMatriz, tamanhoMatriz)
  end

  # Regra 1: uma região precisa ter todos os números de 1 a N sem repetição, sendo N a quantidade de células na região.
  # A função verifica se todos os números na casa são diferentes. Como o algoritmo já preenche as casas com números de
  #1 a N, não é necessário verificcar se os números da casa estão nesse intervalo.
  def verificarRegiao(num, regiao, numerosMatriz) do
    anonima = fn({i,j}) -> (Enum.at(Enum.at(numerosMatriz,i),j) == num) end
    not (Enum.any?(regiao, anonima))
  end


  # Regra 2: Números em células ortogonalmente adjacentes devem ser diferentes.
  # Verifica se os números das células de cima, baixo, direita e esquerda são diferentes do número da célula i j.
  def verificarAdjacentes(num, i, j, numerosMatriz, tamanhoMatriz) do
    (not ((i-1 >= 0) and (Enum.at(Enum.at(numerosMatriz, (i-1)), j) == num))) and
    (not ((i+1 < tamanhoMatriz) and (Enum.at(Enum.at(numerosMatriz, (i+1)), j) == num))) and
    (not ((j-1 >= 0) and (Enum.at(Enum.at(numerosMatriz, i), (j-1)) == num))) and
    (not ((j+1 < tamanhoMatriz) and (Enum.at(Enum.at(numerosMatriz, i), (j+1)) == num)))
  end


  # Regra 3: Se duas células estiverem adjacentes verticalmente na mesma região, o número na célula superior deve ser
  #maior que o número na célula inferior.
  # Verifica se as células de cima e de baixo da célula i j seguem a regra 3, ou seja, são decrescentes de cima para baixo.
  def verificarCimaBaixo(num, i, j, numerosMatriz, regioesMatriz, tamanhoMatriz) do
    #Verifica se a casa de cima é da mesma região e é menor, que é inválido.
    not (
      ((i-1) >= 0) and
      ((Enum.at(Enum.at(regioesMatriz, (i-1)), j)) == (Enum.at(Enum.at(regioesMatriz, (i)), j))) and
      ((Enum.at(Enum.at(numerosMatriz, (i-1)), j)) < num)
    ) and
    #Verifica se a casa de baixo é da mesma região e é maior, que é inválido
    not (
      ((i+1) < tamanhoMatriz) and
      ((Enum.at(Enum.at(regioesMatriz, (i+1)), j)) == (Enum.at(Enum.at(regioesMatriz, (i)), j))) and
      (Enum.at(Enum.at(numerosMatriz, (i+1)), j) > num)
    )

  end

end

{ehPossivel, matriz} = Kj.kojun(0, 0, matrizNumerosInicial, matrizRegioes,
          Kj.definirRegioes(matrizRegioes,Kj.quantidadeRegioes(matrizRegioes), tamanhoMatriz), tamanhoMatriz)

if (ehPossivel) do
  Kj.imprimirMatriz(matriz)
else
  IO.puts "Não há solução!"
end
