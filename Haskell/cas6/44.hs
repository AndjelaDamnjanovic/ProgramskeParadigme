-- 2.44 Definisati funkciju pozitivni lista koja izdvaja sve pozitivne 
--elemente iz liste.

pozitivni :: [Int] -> [Int]
pozitivni lst = filter (>0) lst