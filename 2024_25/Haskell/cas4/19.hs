--2.19 Napisati funkciju fib n koja računa n-ti element Fibonačijevog 
--niza. Pretpostaviti da je argument ispravan.

fib :: Int -> Int

fib n
    | n == 1 = 1
    | n == 2 = 1
    | otherwise = fib (n - 1) + fib (n - 2)