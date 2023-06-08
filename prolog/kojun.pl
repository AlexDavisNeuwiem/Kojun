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


/* A função "maplist" aplica "max_list" para cada lista em uma lista da matriz */
/* A função "max_list" retorna o maior elemento de uma lista */
maximoMatriz(Matriz, Maximo) :- maplist(max_list, Matriz, ListaMaximos), max_list(ListaMaximos, Maximo).

/*  */
quantidadeRegioes(Quantidade) :- matrizRegioes(Matriz), maximoMatriz(Matriz, Maximo), Quantidade is Maximo + 1.

/*  */
minimoMatriz(Matriz, Minimo) :- maplist(min_list, Matriz, ListaMinimos), min_list(ListaMinimos, Minimo).

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
numeroEhPossivel(Matriz, I, J, Valor) :-
    verificarCima(Matriz, I, J, Valor),
    verificarBaixo(Matriz, I, J, Valor),
    verificarEsquerda(Matriz, I, J, Valor),
    verificarDireita(Matriz, I, J, Valor).

/*  */
listaComplemento(Lista, ListaComplemento) :-
    length(Lista, Tamanho),
    numlist(1, Tamanho, ListaTotal),
    delete(Lista, 0, ListaResto),
    subtract(ListaTotal, ListaResto, ListaComplemento).

/*  */
avaliarNumero(_Matriz, _Valor, [], [T]) :- T = [0].
avaliarNumero(Matriz, Valor, [[I, J]|RestoCoordenadas], [H|T]) :-
    numeroEhPossivel(Matriz, I, J, Valor) -> H = [Valor, I, J], avaliarNumero(Matriz, Valor, RestoCoordenadas, T);
    avaliarNumero(Matriz, Valor, RestoCoordenadas, [H|T]).

/*  */
avaliarListas(_Matriz, [], _ListaCoordenadas, [T]) :- T = [0].
avaliarListas(Matriz, [Valor|RestoValores], ListaCoordenadas, [H|T]) :-
    avaliarNumero(Matriz, Valor, ListaCoordenadas, ListaResultado),
    delete(ListaResultado, [0], ListaPossibilidades),
    length(ListaPossibilidades, Tamanho),
    Tamanho > 0 -> H = ListaPossibilidades, avaliarListas(Matriz, RestoValores, ListaCoordenadas, T);
    avaliarListas(Matriz, RestoValores, ListaCoordenadas, [H|T]).

/*  */
possibilidadesRegiao(Matriz, IdRegiao, ListaPossibilidades) :-
    listaNumerosRegiao(Matriz, IdRegiao, ListaNumerosRegiao),
    listaComplemento(ListaNumerosRegiao, ListaComplemento),
    listaCoordenadasLivres(Matriz, IdRegiao, ListaCoordenadasLivres),
    avaliarListas(Matriz, ListaComplemento, ListaCoordenadasLivres, ListaResultado),
    delete(ListaResultado, [0], ListaPossibilidades).

/*
possibilidadesMatriz(-1, [T]) :- T is 0.
possibilidadesMatriz(IdRegiao, [H|T]) :-
    matrizNumerosInicial(Matriz),
    possibilidadesRegiao(Matriz, IdRegiao, ListaPossibilidades),
    H = ListaPossibilidades,
    ProximaRegiao is IdRegiao - 1,
    possibilidadesMatriz(ProximaRegiao, T).

possibilidadesMatriz(ListaFinal) :- 
    quantidadeRegioes(QuantidadeRegioes),
    PrimeiraRegiao is QuantidadeRegioes - 1,
    possibilidadesMatriz(PrimeiraRegiao, ListaComZero),
    delete(ListaComZero, 0, ListaReversa),
    reverse(ListaReversa, ListaFinal), !.
*/

/*  */
filtroCoord([], _ListaNaoFiltrada, [T]) :- T = [0].
filtroCoord([[_, I, J]|RestoValores], ListaNaoFiltrada, [H|T]) :-
    findall([_Valor, I, J], nth0(_Posicao, ListaNaoFiltrada, [_Valor, I, J]), ListaDescarte),
    subtract(ListaNaoFiltrada, ListaDescarte, ListaFiltrada),
    H = ListaFiltrada,
    filtroCoord(RestoValores, ListaFiltrada, T).

/*  */
filtroValores([], [T]) :- T = [0].
filtroValores([ListaNumeroPossivel|Resto], [H|T]) :-
    length(ListaNumeroPossivel, Tamanho),
    Tamanho =:= 1 -> append(ListaNumeroPossivel, ListaResultado), H = ListaResultado, filtroValores(Resto, T);
    filtroValores(Resto, [H|T]).

/*  */
atualizarLista(_Matriz, [], [T]) :- T = [0].
atualizarLista(Matriz, [[Valor, I, J]|Resto], [H|T]) :-
    atualizarMatriz(Matriz, I, J, Valor, NovaMatriz),
    H = NovaMatriz,
    atualizarLista(NovaMatriz, Resto, T).

/*  */
atualizarPossibilidades(_Matriz, -1, [T]) :- T = [0].
atualizarPossibilidades(Matriz, IdRegiao, [H|T]) :-
    possibilidadesRegiao(Matriz, IdRegiao, ListaPossibilidades),

% -----------------------------------------------------------------------------%

    filtroValores(ListaPossibilidades, ListaValoresComZero),
    delete(ListaValoresComZero, [0], ListaFiltradaValores),

    append(ListaPossibilidades, ListaTotal),

    subtract(ListaTotal, ListaFiltradaValores, ListaNaoFiltrada),

    filtroCoord(ListaFiltradaValores, ListaNaoFiltrada, ListaCoordenadasComZero),
    delete(ListaCoordenadasComZero, [0], ListaTotalCoordenadas),
    last(ListaTotalCoordenadas, ListaFiltradaCoordenadas),

    append(ListaFiltradaValores, ListaFiltradaCoordenadas, ListaFinal),

% -----------------------------------------------------------------------------%

    atualizarLista(Matriz, ListaFinal, ListaMatrizes),
    delete(ListaMatrizes, [0], NovaListaMatrizes),

    last(NovaListaMatrizes, MatrizFinal) ->

    H = MatrizFinal,
    ProximaRegiao is IdRegiao - 1,
    atualizarPossibilidades(MatrizFinal, ProximaRegiao, T), !;

    H = Matriz,
    ProximaRegiao is IdRegiao - 1,
    atualizarPossibilidades(Matriz, ProximaRegiao, T), !.

/*  */
kojun(Matriz) :- 
    quantidadeRegioes(QuantidadeRegioes),
    PrimeiraRegiao is QuantidadeRegioes - 1,
    atualizarPossibilidades(Matriz, PrimeiraRegiao, ListaMatrizes),
    delete(ListaMatrizes, [0], NovaListaMatrizes),
    last(NovaListaMatrizes, MatrizFinal),
    minimoMatriz(MatrizFinal, Minimo),
    write(MatrizFinal), nl,
    Minimo =:= 0 -> kojun(MatrizFinal); imprimirMatriz(MatrizFinal).


main() :-
    matrizNumerosInicial(MatrizNumerosInicial),
    kojun(MatrizNumerosInicial).
    

testeAtualizar() :-
    matrizNumerosInicial(M),
    imprimirMatriz(M), nl,
    atualizarPossibilidades(M, 10, LM1),
    delete(LM1, [0], MF1),
    last(MF1, FIM),
    imprimirMatriz(FIM), nl,
    atualizarPossibilidades(FIM, 10, LM2),
    delete(LM2, [0], MF2),
    last(MF2, FIM2),
    imprimirMatriz(FIM2), nl,
    atualizarPossibilidades(FIM2, 10, LM3),
    delete(LM3, [0], MF3),
    last(MF3, FIM3),
    imprimirMatriz(FIM3), nl.




testeFiltro(R) :-
    matrizNumerosInicial(M),
    possibilidadesRegiao(M, R, LP),
    write(LP), nl,
    filtro(LP, LR),
    write(LR), nl,
    delete(LR, [0], LF),
    atualizarLista(M, LF, MF),
    last(MF, FIM),
    imprimirMatriz(FIM).
