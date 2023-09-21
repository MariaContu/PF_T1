{-
Definir uma função recursiva que recebe um 
número binário na representação de complemento 
de dois e retorna o valor equivalente em decimal inteiro.
Modelo da função: bincompl2dec :: [Int] -> Int
Exemplo: bincompl2dec [1,0,1,0] = -6
-}

bincompl2dec :: [Int] -> Int
bincompl2dec [] = 0
bincompl2dec (bit:bits)
--primeiro descobrimos se é positivo ou negativo
    | bit == 1 = (-1) * complementoDois bits
    | otherwise = 1 * complementoDois bits

complementoDois :: [Int] -> Int
complementoDois [] = 0
complementoDois (bit:bits) = bit * (2 ^length bits) + complementoDois bits