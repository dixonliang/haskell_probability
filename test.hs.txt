mytake :: Int -> [a] -> [a]
mytake n _
 | n <= 0 = []
mytake _ [] = []
mytake n (x:xs) = x : mytake (n-1) xs