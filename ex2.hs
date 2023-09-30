{-
Definir uma função recursiva que recebe um número decimal inteiro não-negativo,
um número de bits desejado e retorna o valor equivalente em binário 
(interpretado como número inteiro sem sinal) com o número de bits informado.
Modelo da função: dec2bin :: Int -> Int -> [Int]
Exemplo: dec2bin 2 8 = [0,0,0,0,0,0,1,0]
-}

dec2bin :: Int -> Int -> [Int]
dec2bin _ 0 = []
dec2bin n bits = dec2bin (n `div` 2) (bits - 1) ++ [n `mod` 2]

{-
Teste1: dec2bin 2 8 Espera: [0,0,0,0,0,0,1,0]
Teste2: dec2bin 3 5 Espera: [0,0,0,1,1]
Teste3: dec2bin 7 10 Espera: [0,0,0,0,0,0,0,1,1,1]
-}