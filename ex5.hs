{- 
Definir uma função recursiva que recebe um número fracionário 
decimal por parâmetro e devolve um número binário de ponto fixo 
de 32 bits. O número binário de ponto fixo dever ser representado 
por uma tupla com dois números binários tal que a parte inteira deve 
estar na representação de complemento de dois com 16 bits e a parte 
fracionária deve estar na representação de binário fracionado com 
16 bits. Você deve definir uma forma adequada de representar o 
resultado caso o número decimal estoure a representação.
Modelo de função: frac2bin :: Double -> ([Int],[Int])
Exemplo: frac2bin (-8.5) = ([1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0],[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
-}

frac2bin :: Double -> ([Int], [Int])
frac2bin x
    | x >= 0 = (dec2bincompl (truncate x) 16, dec2fracPos (x - fromIntegral (truncate x)) 16)
    | otherwise = (dec2bincompl (truncate x) 16, dec2fracNeg (x - fromIntegral (truncate x)) 16)

dec2fracPos :: Double -> Int -> [Int]
dec2fracPos _ 0 = replicate 16 0
dec2fracPos x n = take 16 (go x n)
    where
    go _ 0 = []
    go x' n'
      | x' >= 0.5 = 1 : go (x' * 2 - 1) (n' - 1)
      | otherwise = 0 : go (x' * 2) (n' - 1)

dec2fracNeg :: Double -> Int -> [Int]
dec2fracNeg _ 0 = replicate 16 0
dec2fracNeg x n = take 16 (go x n)
    where
    go _ 0 = []
    go x' n'
      | x' <= -0.5 = 1 : go (x' * 2 + 1) (n' - 1)
      | otherwise = 0 : go (x' * 2) (n' - 1)

dec2bincompl :: Int -> Int -> [Int]
dec2bincompl 0 0 = [0]
dec2bincompl 0 n = replicate n 0
dec2bincompl x y 
    | x<0 = inverteBits(dec2bin (abs x-1) y)
    | otherwise = dec2bin (abs x) y

inverteBits :: [Int] -> [Int]
inverteBits = map (\x -> if x == 0 then 1 else 0)

dec2bin :: Int -> Int -> [Int]
dec2bin _ 0 = []
dec2bin n bits = dec2bin (n `div` 2) (bits - 1) ++ [n `mod` 2]

{-
Teste1: frac2bin (-8.5) Espera: ([1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0],[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
Teste2: frac2bin (-1.2) Espera: ([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],[0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1])
Teste3: frac2bin (4.3) Espera: ([0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0])
-}