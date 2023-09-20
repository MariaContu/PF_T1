{-
Definir uma função recursiva que recebe uma tupla com dois números 
binários representando, respectivamente, a parte inteira (na representação 
de complemento de dois com 16 bits) e a parte fracionária (na representação 
de binário fracionado com 16 bits) de um número binário de ponto fixo com 
32 bits, e retorna o correspondente valor fracionário decimal.
Modelo de função: bin2frac :: ([Int],[Int]) -> Double
Exemplo: bin2frac ([0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0],[1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0]) = 16392.625
-}