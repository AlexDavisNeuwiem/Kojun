%-- Matrizes de Entrada ------------------------------------------------------------------------------------------------------

/* Módulos utilizados na solução */
:- use_module(library(apply)).
:- use_module(library(lists)).

/* Matriz 6x6 que contém todos os números iniciais do puzzle kojun, sendo 0 uma posição vazia */

matrizNumerosInicial([

    [2,0,0,0,1,0],
    [0,0,0,3,0,0],
    [0,3,0,0,5,3],
    [0,0,0,0,0,0],
    [0,0,3,0,4,2],
    [0,0,0,0,0,0]

]).

/* Matriz 6x6 que define as regiões do quebra-cabeça. Essas regiões devem ser representadas por inteiros de 0 até n. */
/* Sendo n a quantidade de regiões - 1, esses inteiros podem ser considerados o id de cada região. */

matrizRegioes([

    [0 ,0 ,1 ,1 ,1 ,2],
    [3 ,3 ,3 ,3 ,3 ,2],
    [4 ,5 ,5 ,5 ,3 ,6],
    [4 ,4 ,4 ,5 ,6 ,6],
    [7 ,7 ,8 ,9 ,9 ,9],
    [10,10,8 ,8 ,9 ,9]

]).

%-----------------------------------------------------------------------------------------------------------------------------



%-- Operações em Matrizes ----------------------------------------------------------------------------------------------------

/* Usando recursividade para imprimir cada elemento de uma lista */
imprimirLista([]).
imprimirLista([H|T]) :- write(H), write(" "), imprimirLista(T).

/* Usando recursividade para imprimir cada linha de uma matriz */
imprimirMatriz([]).
imprimirMatriz([H|T]) :- imprimirLista(H), nl, imprimirMatriz(T).

/* A operação "nth0()" pode retornar o enésimo valor de uma lista */
/* Como as matrizes utilizadas nessa solução são listas de listas, "buscarMatriz()" nos retorna o valor desejado */
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

%-----------------------------------------------------------------------------------------------------------------------------



%-- Listas -------------------------------------------------------------------------------------------------------------------

/* Retornando todos os números presentes em uma região com base em um ID de entrada */
buscarNumerosRegiao(Matriz, IdRegiao, Valor) :-
    matrizRegioes(MatrizRegioes),
    buscarMatriz(MatrizRegioes, I, J, IdRegiao),
    buscarMatriz(Matriz, I, J, Valor).

/* Utilizando "findall()" para gerar uma lista que contenha todos os números de uma determinada região */
listaNumerosRegiao(Matriz, IdRegiao, ListaNumerosRegiao) :- 
    findall(Valor, buscarNumerosRegiao(Matriz, IdRegiao, Valor), ListaNumerosRegiao).

/* Retornando uma lista com os números que completam uma região */
/* Exemplo: seja Lista = [1, 0, 5, 2, 0], o retorno será [3, 4] */
/* Em uma região completa, o retorno é [] */
listaComplemento(Lista, ListaComplemento) :-
    length(Lista, Tamanho),
    numlist(1, Tamanho, ListaTotal),
    delete(Lista, 0, ListaResto),
    subtract(ListaTotal, ListaResto, ListaComplemento).

/* Retornando as coordenadas de uma região que possuem o valor 0 na matriz de números */
buscarCoordenadasLivres(Matriz, IdRegiao, [I, J]) :-
    matrizRegioes(MatrizRegioes),
    buscarMatriz(MatrizRegioes, I, J, IdRegiao),
    buscarMatriz(Matriz, I, J, 0).

/* Utilizando "findall()" para gerar uma lista que contenha todas as coordenadas livres de uma determinada região */
listaCoordenadasLivres(Matriz, IdRegiao, ListaCoordenadasLivres) :- 
    findall([I, J], buscarCoordenadasLivres(Matriz, IdRegiao, [I, J]), ListaCoordenadasLivres).

%-----------------------------------------------------------------------------------------------------------------------------



%-- Verificações -------------------------------------------------------------------------------------------------------------

/* Verificando se a coordenada de entrada já possui um valor ou não com base em "listaCoordenadasLivres()" */
verificarCoordenadas(Matriz, I, J) :-
    matrizRegioes(MatrizRegioes),
    buscarMatriz(MatrizRegioes, I, J, IdRegiao),
    listaCoordenadasLivres(Matriz, IdRegiao, ListaCoordenadasLivres),
    member([I, J], ListaCoordenadasLivres).

/* Retorna um valor que não esteja na região utilizando "listaComplemento()" */
verificarMembro(Matriz, I, J, Valor) :-
    matrizRegioes(MatrizRegioes),
    buscarMatriz(MatrizRegioes, I, J, IdRegiao),
    listaNumerosRegiao(Matriz, IdRegiao, ListaNumerosRegiao),
    listaComplemento(ListaNumerosRegiao, ListaValoresFaltantes),
    member(Valor, ListaValoresFaltantes).

/* Faz parte de "verificarMaiorRegiao()" */
/* Zero não é considerado maior quando está acima de um número na matriz */
verificarValor(Valor1, Valor2) :-
    Valor2 =:= 0 -> true; Valor1 < Valor2.

/* Retorna um valor que é menor que o número da posição acima dele na matriz */
/* Primeiramente é avaliado se as posições pertencem à mesma região para depois comparar os valores */
verificarMaiorRegiao(Matriz, I, J, Valor, Cima) :-
    matrizRegioes(MatrizRegioes),
    buscarMatriz(MatrizRegioes, I, J, IdRegiao),
    buscarMatriz(MatrizRegioes, Cima, J, IdRegiaoCima),
    IdRegiao =:= IdRegiaoCima ->
    buscarMatriz(Matriz, Cima, J, ValorCima),
    verificarValor(Valor, ValorCima);
    buscarMatriz(Matriz, Cima, J, ValorCima),
    Valor =\= ValorCima.

/* Retorna um valor que é maior que o número da posição abaixo dele na matriz */
/* Primeiramente é avaliado se as posições pertencem à mesma região para depois comparar os valores */
verificarMenorRegiao(Matriz, I, J, Valor, Baixo) :-
    matrizRegioes(MatrizRegioes),
    buscarMatriz(MatrizRegioes, I, J, IdRegiao),
    buscarMatriz(MatrizRegioes, Baixo, J, IdRegiaoBaixo),
    IdRegiao =:= IdRegiaoBaixo ->
    buscarMatriz(Matriz, Baixo, J, ValorBaixo), Valor > ValorBaixo; 
    buscarMatriz(Matriz, Baixo, J, ValorBaixo), Valor =\= ValorBaixo.

/* Dada uma coordenada, verifica se a posição acima dela na matriz é valida */
/* Se a posição de cima for válida, retorna um valor que seja menor que o número dessa posição */
verificarCima(Matriz, I, J, Valor) :-
    Cima is (I - 1), Cima >= 0 ->
    verificarMaiorRegiao(Matriz, I, J, Valor, Cima); true.

/* Dada uma coordenada, verifica se a posição abaixo dela na matriz é valida */
/* Se a posição de baixo for válida, retorna um valor que seja maior que o número dessa posição */
verificarBaixo(Matriz, I, J, Valor) :-
    length(Matriz, Tamanho),
    Baixo is (I + 1), Baixo < Tamanho ->
    verificarMenorRegiao(Matriz, I, J, Valor, Baixo); true.

/* Dada uma coordenada, retorna um valor que seja diferente do número à sua esquerda na matriz */
verificarEsquerda(Matriz, I, J, Valor) :-
    Esquerda is (J - 1), Esquerda >= 0 ->
    buscarMatriz(Matriz, I, Esquerda, ValorEsquerda),
    Valor =\= ValorEsquerda; true.

/* Dada uma coordenada, retorna um valor que seja diferente do número à sua direita na matriz */
verificarDireita(Matriz, I, J, Valor) :- 
    length(Matriz, Tamanho),
    Direita is (J + 1), Direita < Tamanho ->
    buscarMatriz(Matriz, I, Direita, ValorDireita),
    Valor =\= ValorDireita; true.

%-----------------------------------------------------------------------------------------------------------------------------



%-- Preenchendo a Matriz -----------------------------------------------------------------------------------------------------

/* Dado uma matriz e uma coordenada, retorna um valor válido para essa posição segundo as regras do jogo */
/* Com o valor válido, gera uma nova matriz de números e a retorna */
/* Caso a posição já esteja preenchida, retorna a própria matriz de entrada */
preencherPosicao(Matriz, I, J, NovaMatriz) :-
    verificarCoordenadas(Matriz, I, J) ->
    verificarMembro(Matriz, I, J, Valor),
    verificarCima(Matriz, I, J, Valor),
    verificarBaixo(Matriz, I, J, Valor),
    verificarEsquerda(Matriz, I, J, Valor),
    verificarDireita(Matriz, I, J, Valor),
    atualizarMatriz(Matriz, I, J, Valor, NovaMatriz);
    NovaMatriz = Matriz.

%-----------------------------------------------------------------------------------------------------------------------------



%-- Resolvendo o Puzzle ------------------------------------------------------------------------------------------------------

/* Aplicando "preencherPosicao()" para cada posição da matriz */
/* Para cada posição, é dada uma matriz de entrada e uma nova matriz é retornada */

kojun() :-

    matrizNumerosInicial(MNI),

    preencherPosicao(MNI, 0, 0, M00),
    preencherPosicao(M00, 0, 1, M01),
    preencherPosicao(M01, 0, 2, M02),
    preencherPosicao(M02, 0, 3, M03),
    preencherPosicao(M03, 0, 4, M04),
    preencherPosicao(M04, 0, 5, M05),

    preencherPosicao(M05, 1, 0, M10),
    preencherPosicao(M10, 1, 1, M11),
    preencherPosicao(M11, 1, 2, M12),
    preencherPosicao(M12, 1, 3, M13),
    preencherPosicao(M13, 1, 4, M14),
    preencherPosicao(M14, 1, 5, M15),

    preencherPosicao(M15, 2, 0, M20),
    preencherPosicao(M20, 2, 1, M21),
    preencherPosicao(M21, 2, 2, M22),
    preencherPosicao(M22, 2, 3, M23),
    preencherPosicao(M23, 2, 4, M24),
    preencherPosicao(M24, 2, 5, M25),

    preencherPosicao(M25, 3, 0, M30),
    preencherPosicao(M30, 3, 1, M31),
    preencherPosicao(M31, 3, 2, M32),
    preencherPosicao(M32, 3, 3, M33),
    preencherPosicao(M33, 3, 4, M34),
    preencherPosicao(M34, 3, 5, M35),

    preencherPosicao(M35, 4, 0, M40),
    preencherPosicao(M40, 4, 1, M41),
    preencherPosicao(M41, 4, 2, M42),
    preencherPosicao(M42, 4, 3, M43),
    preencherPosicao(M43, 4, 4, M44),
    preencherPosicao(M44, 4, 5, M45),

    preencherPosicao(M45, 5, 0, M50),
    preencherPosicao(M50, 5, 1, M51),
    preencherPosicao(M51, 5, 2, M52),
    preencherPosicao(M52, 5, 3, M53),
    preencherPosicao(M53, 5, 4, M54),
    preencherPosicao(M54, 5, 5, M55),

    nl, imprimirMatriz(M55), nl.

%-----------------------------------------------------------------------------------------------------------------------------
