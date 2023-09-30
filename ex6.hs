{-
Definir uma função recursiva que recebe uma tupla com dois números 
binários representando, respectivamente, a parte inteira (na representação 
de complemento de dois com 16 bits) e a parte fracionária (na representação 
de binário fracionado com 16 bits) de um número binário de ponto fixo com 
32 bits, e retorna o correspondente valor fracionário decimal.
Modelo de função: bin2frac :: ([Int],[Int]) -> Double
Exemplo: bin2frac ([0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0],[1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0]) = 16392.625
-}

-- Definindo a função bincompl2dec 

bincompl2dec :: [Int] -> Int
bincompl2dec [] = 0
bincompl2dec xs
    | head xs == 0 = bin2dec xs
    | head xs == 1 = (-1) * (bin2dec (inverteBits xs) + 1)

-- Definindo a função bin2dec 

bin2dec :: [Int] -> Int
bin2dec [] = 0
bin2dec (x:xs) = x * 2^length xs + bin2dec xs

-- Definindo a função inverteBits 

inverteBits :: [Int] -> [Int]
inverteBits = map (\x -> if x == 0 then 1 else 0)

-- Definindo a função bin2frac

bin2frac :: ([Int], [Int]) -> Double
bin2frac (inteiraBits, fracionariaBits) =
    let inteiraDecimal = fromIntegral (bincompl2dec inteiraBits)
        fracionariaDecimal = sum [ fromIntegral bit / 2^(i+1) | (bit, i) <- zip fracionariaBits [0..15] ]
    in inteiraDecimal + fracionariaDecimal

{-
Teste1: bin2frac ([0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0],[1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0]) Espera: 16392.625
Teste2: bin2frac ([1,1,0,0,0,0,1,0,0,1,0,0,1,0,0,1],[1,0,1,0,0,1,0,0,1,0,0,0,0,1,0,0]) Espera: -15798.357360839844
Teste3: bin2frac ([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1]) Espera: -0.9999847412109375
-}