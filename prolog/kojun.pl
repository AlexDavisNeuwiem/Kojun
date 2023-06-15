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

/*  */
matrizNumerosInicial([
    [2,0,0,0,1,0],
    [0,0,0,3,0,0],
    [0,3,0,0,5,3],
    [0,0,0,0,0,0],
    [0,0,3,0,4,2],
    [0,0,0,0,0,0]
]).

matrizRegioes([
    [0 ,0 ,1 ,1 ,1 ,2],
    [3 ,3 ,3 ,3 ,3 ,2],
    [4 ,5 ,5 ,5 ,3 ,6],
    [4 ,4 ,4 ,5 ,6 ,6],
    [7 ,7 ,8 ,9 ,9 ,9],
    [10,10,8 ,8 ,9 ,9]
]).

/* Usando recursividade para imprimir cada linha de uma matriz */
imprimirMatriz([]).
imprimirMatriz([H|T]) :- write(H), nl, imprimirMatriz(T).

/* A função "nth0" retorna o enésimo valor de uma lista */
buscarMatriz(Matriz, Linha, Coluna, Valor) :- nth0(Linha, Matriz, Lista), nth0(Coluna, Lista, Valor).

/* Percorre a lista até Posicao - 1 (length), atualiza o valor e armazena em Lista2 */
atualizarPosicao(Posicao, ValorAntigo, ValorNovo, Lista1, Lista2) :- 
    length(Pos, Posicao),
    append(Pos, [ValorAntigo|Resto], Lista1),
    append(Pos, [ValorNovo|Resto], Lista2).

/* Faz o mesmo que a função anterior, mas em uma lista de listas */
atualizarMatriz(Matriz, I, J, ValorNovo, NovaMatriz) :-
    atualizarPosicao(I, Antigo, Novo, Matriz, NovaMatriz),
    atualizarPosicao(J, _Antigo, ValorNovo, Antigo, Novo).

/*  */
buscarNumerosRegiao(Matriz, IdRegiao, Valor) :-
    matrizRegioes(MatrizRegioes),
    buscarMatriz(MatrizRegioes, I, J, IdRegiao),
    buscarMatriz(Matriz, I, J, Valor).

/*  */
listaNumerosRegiao(Matriz, IdRegiao, ListaNumerosRegiao) :- 
    findall(Valor, buscarNumerosRegiao(Matriz, IdRegiao, Valor), ListaNumerosRegiao).

/*  */
listaComplemento(Lista, ListaComplemento) :-
    length(Lista, Tamanho),
    numlist(1, Tamanho, ListaTotal),
    delete(Lista, 0, ListaResto),
    subtract(ListaTotal, ListaResto, ListaComplemento).

/*  */
buscarCoordenadasLivres(Matriz, IdRegiao, [I, J]) :-
    matrizRegioes(MatrizRegioes),
    buscarMatriz(MatrizRegioes, I, J, IdRegiao),
    buscarMatriz(Matriz, I, J, 0).

/*  */
listaCoordenadasLivres(Matriz, IdRegiao, ListaCoordenadasLivres) :- 
    findall([I, J], buscarCoordenadasLivres(Matriz, IdRegiao, [I, J]), ListaCoordenadasLivres).

/*  */
verificarValor(Valor1, Valor2) :-
    Valor2 =:= 0 -> true; Valor1 < Valor2.

/*  */
verificarMaiorRegiao(Matriz, I, J, Valor, Cima) :-
    matrizRegioes(MatrizRegioes),
    buscarMatriz(MatrizRegioes, I, J, IdRegiao),
    buscarMatriz(MatrizRegioes, Cima, J, IdRegiaoCima),
    IdRegiao =:= IdRegiaoCima -> buscarMatriz(Matriz, Cima, J, ValorCima), verificarValor(Valor, ValorCima);
    buscarMatriz(Matriz, Cima, J, ValorCima), Valor =\= ValorCima.

/*  */
verificarMenorRegiao(Matriz, I, J, Valor, Baixo) :-
    matrizRegioes(MatrizRegioes),
    buscarMatriz(MatrizRegioes, I, J, IdRegiao),
    buscarMatriz(MatrizRegioes, Baixo, J, IdRegiaoBaixo),
    IdRegiao =:= IdRegiaoBaixo -> buscarMatriz(Matriz, Baixo, J, ValorBaixo), Valor > ValorBaixo; 
    buscarMatriz(Matriz, Baixo, J, ValorBaixo), Valor =\= ValorBaixo.

/*  */
verificarCima(Matriz, I, J, Valor) :-
    Cima is (I - 1), Cima >= 0 -> verificarMaiorRegiao(Matriz, I, J, Valor, Cima); true.

/*  */
verificarBaixo(Matriz, I, J, Valor) :-
    length(Matriz, Tamanho),
    Baixo is (I + 1), Baixo < Tamanho -> verificarMenorRegiao(Matriz, I, J, Valor, Baixo); true.

/*  */
verificarEsquerda(Matriz, I, J, Valor) :-
    Esquerda is (J - 1), Esquerda >= 0 -> buscarMatriz(Matriz, I, Esquerda, ValorEsquerda), Valor =\= ValorEsquerda; true.

/*  */
verificarDireita(Matriz, I, J, Valor) :- 
    length(Matriz, Tamanho),
    Direita is (J + 1), Direita < Tamanho -> buscarMatriz(Matriz, I, Direita, ValorDireita), Valor =\= ValorDireita; true.

/*  */
verificarMembro(Matriz, I, J, Valor) :-
    matrizRegioes(MatrizRegioes),
    buscarMatriz(MatrizRegioes, I, J, IdRegiao),
    listaNumerosRegiao(Matriz, IdRegiao, ListaNumerosRegiao),
    listaComplemento(ListaNumerosRegiao, ListaValoresFaltantes),
    member(Valor, ListaValoresFaltantes).

verificarIdRegiao(Matriz, I, J) :-
    matrizRegioes(MatrizRegioes),
    buscarMatriz(MatrizRegioes, I, J, IdRegiao),
    listaCoordenadasLivres(Matriz, IdRegiao, ListaCoordenadasLivres),
    member([I, J], ListaCoordenadasLivres).

/*  */
numeroEhPossivel(Matriz, I, J, NovaMatriz) :-
    verificarIdRegiao(Matriz, I, J) ->
    verificarMembro(Matriz, I, J, Valor),
    verificarCima(Matriz, I, J, Valor),
    verificarBaixo(Matriz, I, J, Valor),
    verificarEsquerda(Matriz, I, J, Valor),
    verificarDireita(Matriz, I, J, Valor),
    atualizarMatriz(Matriz, I, J, Valor, NovaMatriz);
    NovaMatriz = Matriz.

/*  */
kojun(M55) :-
    matrizNumerosInicial(MNI),

    numeroEhPossivel(MNI, 0, 0, M00),
    numeroEhPossivel(M00, 0, 1, M01),
    numeroEhPossivel(M01, 0, 2, M02),
    numeroEhPossivel(M02, 0, 3, M03),
    numeroEhPossivel(M03, 0, 4, M04),
    numeroEhPossivel(M04, 0, 5, M05),

    numeroEhPossivel(M05, 1, 0, M10),
    numeroEhPossivel(M10, 1, 1, M11),
    numeroEhPossivel(M11, 1, 2, M12),
    numeroEhPossivel(M12, 1, 3, M13),
    numeroEhPossivel(M13, 1, 4, M14),
    numeroEhPossivel(M14, 1, 5, M15),

    numeroEhPossivel(M15, 2, 0, M20),
    numeroEhPossivel(M20, 2, 1, M21),
    numeroEhPossivel(M21, 2, 2, M22),
    numeroEhPossivel(M22, 2, 3, M23),
    numeroEhPossivel(M23, 2, 4, M24),
    numeroEhPossivel(M24, 2, 5, M25),

    numeroEhPossivel(M25, 3, 0, M30),
    numeroEhPossivel(M30, 3, 1, M31),
    numeroEhPossivel(M31, 3, 2, M32),
    numeroEhPossivel(M32, 3, 3, M33),
    numeroEhPossivel(M33, 3, 4, M34),
    numeroEhPossivel(M34, 3, 5, M35),

    numeroEhPossivel(M35, 4, 0, M40),
    numeroEhPossivel(M40, 4, 1, M41),
    numeroEhPossivel(M41, 4, 2, M42),
    numeroEhPossivel(M42, 4, 3, M43),
    numeroEhPossivel(M43, 4, 4, M44),
    numeroEhPossivel(M44, 4, 5, M45),

    numeroEhPossivel(M45, 5, 0, M50),
    numeroEhPossivel(M50, 5, 1, M51),
    numeroEhPossivel(M51, 5, 2, M52),
    numeroEhPossivel(M52, 5, 3, M53),
    numeroEhPossivel(M53, 5, 4, M54),
    numeroEhPossivel(M54, 5, 5, M55),

    nl, imprimirMatriz(M55), nl, !.