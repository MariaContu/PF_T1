{-
Definir uma função recursiva que recebe um número decimal inteiro não-negativo,
um número de bits desejado e retorna o valor equivalente em binário 
(interpretado como número inteiro sem sinal) com o número de bits informado.
Modelo da função: dec2bin :: Int -> Int -> [Int]
Exemplo: dec2bin 2 8 = [0,0,0,0,0,0,1,0]
-}

dec2bin :: Int -> Int -> [Int]
dec2bin 0 0 = [] -- lista vazia
