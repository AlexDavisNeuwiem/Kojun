/* Módulos usados na solução */
:- use_module(library(apply)).
:- use_module(library(lists)).

/* A Matriz a seguir contém todos os valores do puzzle, sendo 0 uma região vazia */
/* Toda matriz utilizada nesta solução é uma lista de listas */
/*
matrizNumerosInicial(  [[0, 0, 3, 0, 2, 0, 3, 0, 0, 0, 7, 0, 0, 5, 0, 3, 6], 
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
                        [6, 2, 0, 0, 1, 3, 1, 7, 1, 2, 0, 4, 0, 4, 1, 0, 6]] ).

matrizRegioes( [[0 , 1 , 1 , 1 , 1 , 2 , 3 , 4 , 4 , 5 , 6 , 6 , 7 , 7 , 8 , 9 , 9 ],
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
                [61, 61, 61, 61, 52, 52, 53, 53, 55, 55, 56, 56, 62, 60, 60, 60, 60]] ).

*/

matrizNumerosInicial(  [[2,0,0,0,1,0],
                        [0,0,0,3,0,0],
                        [0,3,0,0,5,3],
                        [0,0,0,0,0,0],
                        [0,0,3,0,4,2],
                        [0,0,0,0,0,0]] ).

matrizRegioes( [[0 ,0 ,1 ,1 ,1 ,2],
                [3 ,3 ,3 ,3 ,3 ,2],
                [4 ,5 ,5 ,5 ,3 ,6],
                [4 ,4 ,4 ,5 ,6 ,6],
                [7 ,7 ,8 ,9 ,9 ,9],
                [10,10,8 ,8 ,9 ,9]] ).


matrizTeste([[],[],[],[],[],[],[],[],[],[]]).

/* Utilizando a função "length" para obter o tamanho da matriz */
tamanhoMatriz(Tamanho) :- matrizNumerosInicial(Matriz), length(Matriz, Tamanho).

/* A função "maplist" aplica "max_list" para cada lista em uma lista da matriz */
/* A função "max_list" retorna o maior elemento de uma lista */
maximoMatriz(Matriz, Quantidade) :- maplist(max_list, Matriz, Maximo), max_list(Maximo, Quantidade).
quantidadeRegioes(Quantidade) :- matrizRegioes(Matriz), maximoMatriz(Matriz, Quantidade).

/* Usando recursividade para imprimir cada linha de uma matriz */
imprimirMatriz([]).
imprimirMatriz([H|T]) :- write(H), nl, imprimirMatriz(T).
testeImprimirMatriz() :- matrizNumerosInicial(Matriz), imprimirMatriz(Matriz).

/* A função "nth0" retorna o enésimo valor de uma lista  */
buscarMatriz(Matriz, Linha, Coluna, Valor) :- nth0(Linha, Matriz, Lista), nth0(Coluna, Lista, Valor).
testeBuscarMatriz(Linha, Coluna, Valor) :- matrizNumerosInicial(Matriz), buscarMatriz(Matriz, Linha, Coluna, Valor).

/* Percorre a lista até Posicao - 1 (length), atualiza o valor e armazena em Lista2 */
atualizarPosicao(Posicao, ValorAntigo, ValorNovo, Lista1, Lista2) :- 
    length(Pos, Posicao),
    append(Pos, [ValorAntigo|Resto], Lista1),
    append(Pos, [ValorNovo|Resto], Lista2).

/* Faz o mesmo que a função anterior, mas em uma lista de listas */
atualizarMatriz(Matriz, I, J, ValorNovo, NovaMatriz) :-
    atualizarPosicao(I, Antigo, Novo, Matriz, NovaMatriz),
    atualizarPosicao(J, _Antigo, ValorNovo, Antigo, Novo).
testeAtualizarMatriz(Linha, Coluna, Valor, NovaMatriz) :- matrizNumerosInicial(Matriz), atualizarMatriz(Matriz, Linha, Coluna, Valor, NovaMatriz).

/*  */
tamanhoRegiao(Regioes, IdRegiao, Tamanho) :- nth0(IdRegiao, Regioes, Lista), length(Lista, Tamanho), !.
testeTamanhoRegiao(IdRegiao, Tamanho) :- matrizNumerosInicial(Regioes), tamanhoRegiao(Regioes, IdRegiao, Tamanho).

/*  */
atualizarRegiao(RegioesMatriz, I, J, Regioes, NovaRegioes) :- 
    buscarMatriz(RegioesMatriz, I, J, IdRegiao), 
    nth0(IdRegiao, Regioes, Regiao),
    append(Regiao, [[I, J]], NovaRegiao),
    atualizarPosicao(IdRegiao, Regiao, NovaRegiao, Regioes, NovaRegioes).
testeAtualizarRegiao(I, J, NovaMatrizTeste) :- matrizTeste(MatrizTes), matrizRegioes(MatrizReg), atualizarRegiao(MatrizReg, I, J, MatrizTes, NovaMatrizTeste).

/*  */
atualizarRegioes(MatrizRegioes, QuantidadeRegioes, Regioes, I, J, Resultado) :-
    I =:= QuantidadeRegioes - 1 -> halt;
    J =:= QuantidadeRegioes - 1 -> I2 is I + 1, atualizarRegioes(MatrizRegioes, QuantidadeRegioes, Regioes, I2, 0, Resultado);
    atualizarRegiao(MatrizRegioes, I, J, Regioes, Resultado),
    J2 is J + 1,
    atualizarRegioes(MatrizRegioes, QuantidadeRegioes, Resultado, I, J2, Resultado).

/*  */
definirRegioes(Resultado) :- 
    matrizRegioes(MatrizRegioes), 
    quantidadeRegioes(QuantidadeRegioes), 
    length(Regioes, QuantidadeRegioes), 
    atualizarRegioes(MatrizRegioes, QuantidadeRegioes, Regioes, 0, 0, Resultado).
