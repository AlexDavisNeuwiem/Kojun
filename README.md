# kojun

Esse código encontra a solução de um puzzle kojun por meio de backtracking a partir de uma
matriz de números e uma matriz de regiões. O código foi implementado em três linguagens diferentes: haskell, python e elixir. 
A estratégia utilizada para resolver o problema é a mesma para ambas linguagens. Relatório disponível na pasta "/docs".

## Entrada

Existem exemplos de entrada em "docs/exemplosEntrada.txt". A entrada deve ser colocada diretamente no código, como
indicado em no próprio código.

## Saída

A saída é impressa no terminal. No caso de sucesso, é a matriz resolvida. Caso não encontre solução, é "Nao ha solucao".

## Compilar e executar: haskell

O comando a seguir compila o código, o executa e limpa os binários em apenas uma linha. Ele deve ser executado na pasta raiz do projeto.

```shell
ghc -o a haskell/kojun.hs && ./a && rm a haskell/*.hi haskell/*.o
```

## Executar: python

```shell
python3 python/kojun.py
```

## Executar: Elixir
```shell
elixir elixir/kojun.exs
```
