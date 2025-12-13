-- 2.70 Uvesti novo ime Par za par dva elementa proizvoljnog tipa i napisati funkciju
--za množenje elemenata instance tipa Par Int

-- najpre definišemo tip ParInt kako bismo pokazali kako se pravi alijas bez 
-- parametara i pišemo istu funkciju za proizvod

type ParInt = (Int, Int)

proizvod :: ParInt -> Int
proizvod p = (fst p) * (snd p)

-- alternativan način jeste zapis para vrednosti preko šablona
-- proizvod (a, b) = a * b

-- sada definišemo par vrednosti proizvoljnog tipa

type Par a = (a, a)

proizvod' :: Par Int -> Int
proizvod' (a, b) = a * b