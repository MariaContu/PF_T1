{-
Definir uma função recursiva que recebe um 
número binário na representação de complemento 
de dois e retorna o valor equivalente em decimal inteiro.
Modelo da função: bincompl2dec :: [Int] -> Int
Exemplo: bincompl2dec [1,0,1,0] = -6
-}

bincompl2dec :: [Int] -> Int
bincompl2dec [] = 0
bincompl2dec xs
    | head xs == 0 = bin2dec xs
    | head xs == 1 = (-1) * (bin2dec (inverteBits xs) + 1)

bin2dec :: [Int] -> Int
bin2dec [] = 0
bin2dec (x:xs) = x * 2^length xs + bin2dec xs

inverteBits :: [Int] -> [Int]
inverteBits = map (\x -> if x == 0 then 1 else 0)