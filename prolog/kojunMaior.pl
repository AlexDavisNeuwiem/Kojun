%-- Matrizes de Entrada ------------------------------------------------------------------------------------------------------

/* Módulos utilizados na solução */
:- use_module(library(apply)).
:- use_module(library(lists)).

/* Matriz 17x17 que contém todos os números iniciais do puzzle kojun, sendo 0 uma posição vazia */

matrizNumerosInicial([

    [0, 0, 3, 0, 2, 0, 3, 0, 0, 0, 7, 0, 0, 5, 0, 3, 6], 
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
    [6, 2, 0, 0, 1, 3, 1, 7, 1, 2, 0, 4, 0, 4, 1, 0, 6]

]).


/* Matriz 17x17 que define as regiões do quebra-cabeça. Essas regiões devem ser representadas por inteiros de 0 até n. */
/* Sendo n a quantidade de regiões - 1, esses inteiros podem ser considerados o id de cada região. */

matrizRegioes([

    [0 , 1 , 1 , 1 , 1 , 2 , 3 , 4 , 4 , 5 , 6 , 6 , 7 , 7 , 8 , 9 , 9 ],
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
    [61, 61, 61, 61, 52, 52, 53, 53, 55, 55, 56, 56, 62, 60, 60, 60, 60]

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
    preencherPosicao(M05, 0, 6, M06),
    preencherPosicao(M06, 0, 7, M07),
    preencherPosicao(M07, 0, 8, M08),
    preencherPosicao(M08, 0, 9, M09),
    preencherPosicao(M09, 0, 10, M10),
    preencherPosicao(M10, 0, 11, M11),
    preencherPosicao(M11, 0, 12, M12),
    preencherPosicao(M12, 0, 13, M13),
    preencherPosicao(M13, 0, 14, M14),
    preencherPosicao(M14, 0, 15, M15),
    preencherPosicao(M15, 0, 16, M16),

    preencherPosicao(M16, 1, 0, M17),
    preencherPosicao(M17, 1, 1, M18),
    preencherPosicao(M18, 1, 2, M19),
    preencherPosicao(M19, 1, 3, M20),
    preencherPosicao(M20, 1, 4, M21),
    preencherPosicao(M21, 1, 5, M22),
    preencherPosicao(M22, 1, 6, M23),
    preencherPosicao(M23, 1, 7, M24),
    preencherPosicao(M24, 1, 8, M25),
    preencherPosicao(M25, 1, 9, M26),
    preencherPosicao(M26, 1, 10, M27),
    preencherPosicao(M27, 1, 11, M28),
    preencherPosicao(M28, 1, 12, M29),
    preencherPosicao(M29, 1, 13, M30),
    preencherPosicao(M30, 1, 14, M31),
    preencherPosicao(M31, 1, 15, M32),
    preencherPosicao(M32, 1, 16, M33),

    preencherPosicao(M33, 2, 0, M34),
    preencherPosicao(M34, 2, 1, M35),
    preencherPosicao(M35, 2, 2, M36),
    preencherPosicao(M36, 2, 3, M37),
    preencherPosicao(M37, 2, 4, M38),
    preencherPosicao(M38, 2, 5, M39),
    preencherPosicao(M39, 2, 6, M40),
    preencherPosicao(M40, 2, 7, M41),
    preencherPosicao(M41, 2, 8, M42),
    preencherPosicao(M42, 2, 9, M43),
    preencherPosicao(M43, 2, 10, M44),
    preencherPosicao(M44, 2, 11, M45),
    preencherPosicao(M45, 2, 12, M46),
    preencherPosicao(M46, 2, 13, M47),
    preencherPosicao(M47, 2, 14, M48),
    preencherPosicao(M48, 2, 15, M49),
    preencherPosicao(M49, 2, 16, M50),

    preencherPosicao(M50, 3, 0, M51),
    preencherPosicao(M51, 3, 1, M52),
    preencherPosicao(M52, 3, 2, M53),
    preencherPosicao(M53, 3, 3, M54),
    preencherPosicao(M54, 3, 4, M55),
    preencherPosicao(M55, 3, 5, M56),
    preencherPosicao(M56, 3, 6, M57),
    preencherPosicao(M57, 3, 7, M58),
    preencherPosicao(M58, 3, 8, M59),
    preencherPosicao(M59, 3, 9, M60),
    preencherPosicao(M60, 3, 10, M61),
    preencherPosicao(M61, 3, 11, M62),
    preencherPosicao(M62, 3, 12, M63),
    preencherPosicao(M63, 3, 13, M64),
    preencherPosicao(M64, 3, 14, M65),
    preencherPosicao(M65, 3, 15, M66),
    preencherPosicao(M66, 3, 16, M67),

    preencherPosicao(M67, 4, 0, M68),
    preencherPosicao(M68, 4, 1, M69),
    preencherPosicao(M69, 4, 2, M70),
    preencherPosicao(M70, 4, 3, M71),
    preencherPosicao(M71, 4, 4, M72),
    preencherPosicao(M72, 4, 5, M73),
    preencherPosicao(M73, 4, 6, M74),
    preencherPosicao(M74, 4, 7, M75),
    preencherPosicao(M75, 4, 8, M76),
    preencherPosicao(M76, 4, 9, M77),
    preencherPosicao(M77, 4, 10, M78),
    preencherPosicao(M78, 4, 11, M79),
    preencherPosicao(M79, 4, 12, M80),
    preencherPosicao(M80, 4, 13, M81),
    preencherPosicao(M81, 4, 14, M82),
    preencherPosicao(M82, 4, 15, M83),
    preencherPosicao(M83, 4, 16, M84),

    preencherPosicao(M84, 5, 0, M85),
    preencherPosicao(M85, 5, 1, M86),
    preencherPosicao(M86, 5, 2, M87),
    preencherPosicao(M87, 5, 3, M88),
    preencherPosicao(M88, 5, 4, M89),
    preencherPosicao(M89, 5, 5, M90),
    preencherPosicao(M90, 5, 6, M91),
    preencherPosicao(M91, 5, 7, M92),
    preencherPosicao(M92, 5, 8, M93),
    preencherPosicao(M93, 5, 9, M94),
    preencherPosicao(M94, 5, 10, M95),
    preencherPosicao(M95, 5, 11, M96),
    preencherPosicao(M96, 5, 12, M97),
    preencherPosicao(M97, 5, 13, M98),
    preencherPosicao(M98, 5, 14, M99),
    preencherPosicao(M99, 5, 15, M100),
    preencherPosicao(M100, 5, 16, M101),

    preencherPosicao(M101, 6, 0, M102),
    preencherPosicao(M102, 6, 1, M103),
    preencherPosicao(M103, 6, 2, M104),
    preencherPosicao(M104, 6, 3, M105),
    preencherPosicao(M105, 6, 4, M106),
    preencherPosicao(M106, 6, 5, M107),
    preencherPosicao(M107, 6, 6, M108),
    preencherPosicao(M108, 6, 7, M109),
    preencherPosicao(M109, 6, 8, M110),
    preencherPosicao(M110, 6, 9, M111),
    preencherPosicao(M111, 6, 10, M112),
    preencherPosicao(M112, 6, 11, M113),
    preencherPosicao(M113, 6, 12, M114),
    preencherPosicao(M114, 6, 13, M115),
    preencherPosicao(M115, 6, 14, M116),
    preencherPosicao(M116, 6, 15, M117),
    preencherPosicao(M117, 6, 16, M118),

    preencherPosicao(M118, 7, 0, M119),
    preencherPosicao(M119, 7, 1, M120),
    preencherPosicao(M120, 7, 2, M121),
    preencherPosicao(M121, 7, 3, M122),
    preencherPosicao(M122, 7, 4, M123),
    preencherPosicao(M123, 7, 5, M124),
    preencherPosicao(M124, 7, 6, M125),
    preencherPosicao(M125, 7, 7, M126),
    preencherPosicao(M126, 7, 8, M127),
    preencherPosicao(M127, 7, 9, M128),
    preencherPosicao(M128, 7, 10, M129),
    preencherPosicao(M129, 7, 11, M130),
    preencherPosicao(M130, 7, 12, M131),
    preencherPosicao(M131, 7, 13, M132),
    preencherPosicao(M132, 7, 14, M133),
    preencherPosicao(M133, 7, 15, M134),
    preencherPosicao(M134, 7, 16, M135),

    preencherPosicao(M135, 8, 0, M136),
    preencherPosicao(M136, 8, 1, M137),
    preencherPosicao(M137, 8, 2, M138),
    preencherPosicao(M138, 8, 3, M139),
    preencherPosicao(M139, 8, 4, M140),
    preencherPosicao(M140, 8, 5, M141),
    preencherPosicao(M141, 8, 6, M142),
    preencherPosicao(M142, 8, 7, M143),
    preencherPosicao(M143, 8, 8, M144),
    preencherPosicao(M144, 8, 9, M145),
    preencherPosicao(M145, 8, 10, M146),
    preencherPosicao(M146, 8, 11, M147),
    preencherPosicao(M147, 8, 12, M148),
    preencherPosicao(M148, 8, 13, M149),
    preencherPosicao(M149, 8, 14, M150),
    preencherPosicao(M150, 8, 15, M151),
    preencherPosicao(M151, 8, 16, M152),

    preencherPosicao(M152, 9, 0, M153),
    preencherPosicao(M153, 9, 1, M154),
    preencherPosicao(M154, 9, 2, M155),
    preencherPosicao(M155, 9, 3, M156),
    preencherPosicao(M156, 9, 4, M157),
    preencherPosicao(M157, 9, 5, M158),
    preencherPosicao(M158, 9, 6, M159),
    preencherPosicao(M159, 9, 7, M160),
    preencherPosicao(M160, 9, 8, M161),
    preencherPosicao(M161, 9, 9, M162),
    preencherPosicao(M162, 9, 10, M163),
    preencherPosicao(M163, 9, 11, M164),
    preencherPosicao(M164, 9, 12, M165),
    preencherPosicao(M165, 9, 13, M166),
    preencherPosicao(M166, 9, 14, M167),
    preencherPosicao(M167, 9, 15, M168),
    preencherPosicao(M168, 9, 16, M169),

    preencherPosicao(M169, 10, 0, M170),
    preencherPosicao(M170, 10, 1, M171),
    preencherPosicao(M171, 10, 2, M172),
    preencherPosicao(M172, 10, 3, M173),
    preencherPosicao(M173, 10, 4, M174),
    preencherPosicao(M174, 10, 5, M175),
    preencherPosicao(M175, 10, 6, M176),
    preencherPosicao(M176, 10, 7, M177),
    preencherPosicao(M177, 10, 8, M178),
    preencherPosicao(M178, 10, 9, M179),
    preencherPosicao(M179, 10, 10, M180),
    preencherPosicao(M180, 10, 11, M181),
    preencherPosicao(M181, 10, 12, M182),
    preencherPosicao(M182, 10, 13, M183),
    preencherPosicao(M183, 10, 14, M184),
    preencherPosicao(M184, 10, 15, M185),
    preencherPosicao(M185, 10, 16, M186),

    preencherPosicao(M186, 11, 0, M187),
    preencherPosicao(M187, 11, 1, M188),
    preencherPosicao(M188, 11, 2, M189),
    preencherPosicao(M189, 11, 3, M190),
    preencherPosicao(M190, 11, 4, M191),
    preencherPosicao(M191, 11, 5, M192),
    preencherPosicao(M192, 11, 6, M193),
    preencherPosicao(M193, 11, 7, M194),
    preencherPosicao(M194, 11, 8, M195),
    preencherPosicao(M195, 11, 9, M196),
    preencherPosicao(M196, 11, 10, M197),
    preencherPosicao(M197, 11, 11, M198),
    preencherPosicao(M198, 11, 12, M199),
    preencherPosicao(M199, 11, 13, M200),
    preencherPosicao(M200, 11, 14, M201),
    preencherPosicao(M201, 11, 15, M202),
    preencherPosicao(M202, 11, 16, M203),

    preencherPosicao(M203, 12, 0, M204),
    preencherPosicao(M204, 12, 1, M205),
    preencherPosicao(M205, 12, 2, M206),
    preencherPosicao(M206, 12, 3, M207),
    preencherPosicao(M207, 12, 4, M208),
    preencherPosicao(M208, 12, 5, M209),
    preencherPosicao(M209, 12, 6, M210),
    preencherPosicao(M210, 12, 7, M211),
    preencherPosicao(M211, 12, 8, M212),
    preencherPosicao(M212, 12, 9, M213),
    preencherPosicao(M213, 12, 10, M214),
    preencherPosicao(M214, 12, 11, M215),
    preencherPosicao(M215, 12, 12, M216),
    preencherPosicao(M216, 12, 13, M217),
    preencherPosicao(M217, 12, 14, M218),
    preencherPosicao(M218, 12, 15, M219),
    preencherPosicao(M219, 12, 16, M220),

    preencherPosicao(M220, 13, 0, M221),
    preencherPosicao(M221, 13, 1, M222),
    preencherPosicao(M222, 13, 2, M223),
    preencherPosicao(M223, 13, 3, M224),
    preencherPosicao(M224, 13, 4, M225),
    preencherPosicao(M225, 13, 5, M226),
    preencherPosicao(M226, 13, 6, M227),
    preencherPosicao(M227, 13, 7, M228),
    preencherPosicao(M228, 13, 8, M229),
    preencherPosicao(M229, 13, 9, M230),
    preencherPosicao(M230, 13, 10, M231),
    preencherPosicao(M231, 13, 11, M232),
    preencherPosicao(M232, 13, 12, M233),
    preencherPosicao(M233, 13, 13, M234),
    preencherPosicao(M234, 13, 14, M235),
    preencherPosicao(M235, 13, 15, M236),
    preencherPosicao(M236, 13, 16, M237),

    preencherPosicao(M237, 14, 0, M238),
    preencherPosicao(M238, 14, 1, M239),
    preencherPosicao(M239, 14, 2, M240),
    preencherPosicao(M240, 14, 3, M241),
    preencherPosicao(M241, 14, 4, M242),
    preencherPosicao(M242, 14, 5, M243),
    preencherPosicao(M243, 14, 6, M244),
    preencherPosicao(M244, 14, 7, M245),
    preencherPosicao(M245, 14, 8, M246),
    preencherPosicao(M246, 14, 9, M247),
    preencherPosicao(M247, 14, 10, M248),
    preencherPosicao(M248, 14, 11, M249),
    preencherPosicao(M249, 14, 12, M250),
    preencherPosicao(M250, 14, 13, M251),
    preencherPosicao(M251, 14, 14, M252),
    preencherPosicao(M252, 14, 15, M253),
    preencherPosicao(M253, 14, 16, M254),

    preencherPosicao(M254, 15, 0, M255),
    preencherPosicao(M255, 15, 1, M256),
    preencherPosicao(M256, 15, 2, M257),
    preencherPosicao(M257, 15, 3, M258),
    preencherPosicao(M258, 15, 4, M259),
    preencherPosicao(M259, 15, 5, M260),
    preencherPosicao(M260, 15, 6, M261),
    preencherPosicao(M261, 15, 7, M262),
    preencherPosicao(M262, 15, 8, M263),
    preencherPosicao(M263, 15, 9, M264),
    preencherPosicao(M264, 15, 10, M265),
    preencherPosicao(M265, 15, 11, M266),
    preencherPosicao(M266, 15, 12, M267),
    preencherPosicao(M267, 15, 13, M268),
    preencherPosicao(M268, 15, 14, M269),
    preencherPosicao(M269, 15, 15, M270),
    preencherPosicao(M270, 15, 16, M271),

    preencherPosicao(M271, 16, 0, M272),
    preencherPosicao(M272, 16, 1, M273),
    preencherPosicao(M273, 16, 2, M274),
    preencherPosicao(M274, 16, 3, M275),
    preencherPosicao(M275, 16, 4, M276),
    preencherPosicao(M276, 16, 5, M277),
    preencherPosicao(M277, 16, 6, M278),
    preencherPosicao(M278, 16, 7, M279),
    preencherPosicao(M279, 16, 8, M280),
    preencherPosicao(M280, 16, 9, M281),
    preencherPosicao(M281, 16, 10, M282),
    preencherPosicao(M282, 16, 11, M283),
    preencherPosicao(M283, 16, 12, M284),
    preencherPosicao(M284, 16, 13, M285),
    preencherPosicao(M285, 16, 14, M286),
    preencherPosicao(M286, 16, 15, M287),
    preencherPosicao(M287, 16, 16, M288),

    nl, imprimirMatriz(M288), nl.

%-----------------------------------------------------------------------------------------------------------------------------
