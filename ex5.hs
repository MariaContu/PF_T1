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