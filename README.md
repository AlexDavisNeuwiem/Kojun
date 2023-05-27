# Kojun

Esse código encontra a solução de um puzzle Kojun por meio de backtracking a partir de uma
matriz de números e uma matriz de regiões. O código foi implementado em quatro linguagens diferentes: Python, Haskell, Elixir e Prolog. 
A estratégia utilizada para resolver o problema é a mesma para todas as linguagens. Relatório disponível na pasta "/docs".

## Entrada

Existem exemplos de entrada em "docs/exemplosEntrada.txt". A entrada deve ser colocada diretamente no código, como
indicado.

## Saída

A saída é impressa no terminal. No caso de sucesso, é a matriz resolvida. Caso não encontre solução, é "Nao ha solucao".

## Executar: Python

```shell
python3 python/kojun.py
```

## Compilar e executar: Haskell

O comando a seguir compila o código, o executa e limpa os binários em apenas uma linha. Ele deve ser executado na pasta raiz do projeto.

```shell
ghc -o a haskell/kojun.hs && ./a && rm a haskell/*.hi haskell/*.o
```

## Executar: Elixir

```shell
elixir elixir/kojun.exs
```
## Compilar e executar: Prolog

O comando a seguir compila o código e o executa. Ele deve ser executado na pasta raiz do projeto.

```shell
cd prolog && swipl -o kojun -c kojun.pl && ./kojun
```