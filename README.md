# kojun

Esse código encontra a solução de um puzzle kojun a partir de uma
matriz de números e uma matriz de regiões, conforme indicado em "src/main.hs". O código foi escrito na linguagem haskell, utilizando backtracking como estratégia para resolução do problema.

## Compilar e executar

O comando a seguir compila o código, o executa e limpa os binários em apenas uma linha. Ele deve ser executado na pasta raiz do projeto.

```shell
ghc -o a src/main.hs && ./a && rm a src/*.hi src/*.o
```
## Entrada

Existem exemplos de entrada em "src/exemplosEntrada.txt". A entrada deve ser colocada diretamente no código, como
indicado em "src/main.hs".

## Saída

A saída é impressa no terminal. No caso de sucesso, é a matriz resolvida. Caso não encontre solução, é "Nao ha solucao".
