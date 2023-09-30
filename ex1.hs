{- 
Definir uma função recursiva que recebe
um número binário (interpretado como número inteiro sem sinal)
e retorna o valor equivalente em decimal. 
Modelo de função: bin2dec :: [Int] -> Int 
Exemplo: bin2dec [0,1,0,1,0,1] = 21
-}

bin2dec :: [Int] -> Int
bin2dec [] = 0
bin2dec (bit:bits) = bit * 2^length bits + bin2dec bits

{-
Teste1: bin2dec [0,1,0,1,0,1] Espera:21
Teste2: bin2dec [1,0,0,0,1,0] Espera:34
Teste3: bin2dec [1,0,1,0] Espera:10
-}