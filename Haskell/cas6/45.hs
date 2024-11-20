-- 2.45 Definisati funkciju prviNePozitivni lista koja izdvaja najduži
-- prefiks pozitivnih elemenata liste.

prviNePozitivni :: [Int] -> [Int]
prviNePozitivni lst = takeWhile (>0) lst