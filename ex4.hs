{-
Definir uma função recursiva que recebe um número decimal
inteiro, um número de bits desejado e retorna o valor 
equivalente em binário na representação de complemento 
de dois com o número de bits informado.
Modelo de função: dec2bincompl :: Int -> Int -> [Int]
Exemplo: dec2bincompl (-2) 8 =  [1,1,1,1,1,1,1,0]
-}

dec2bincompl :: Int -> Int -> [Int]
dec2bincompl 0 0 = [0]
dec2bincompl 0 n = replicate n 0
dec2bincompl x y 
    | x<0 = inverteBits(dec2bin (abs x -1) y)
    | otherwise = dec2bin (abs x) y

dec2bin :: Int -> Int -> [Int]
dec2bin _ 0 = []
dec2bin n bits = dec2bin (n `div` 2) (bits - 1) ++ [n `mod` 2]

inverteBits :: [Int] -> [Int]
inverteBits = map (\x -> if x == 0 then 1 else 0)