bin2dec :: [Int] -> Int
bin2dec [] = 0
bin2dec (bit:bits) = bit * 2^length bits + bin2dec bits
