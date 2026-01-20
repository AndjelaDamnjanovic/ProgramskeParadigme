type Par a = (a, a)

pomnozi :: Par Int -> Int
pomnozi p = fst p * snd p
