--2.10 Napisati funkciju nzd a b koja računa najveći zajednički 
--delilac brojeva a i b (koristiti Euklidov algoritam). 
-- Pretpostaviti da su argumenti ispravni

nzd ::Int -> Int  -> Int 
nzd a b = if b == 0 then a
          else nzd b (a `mod` b)