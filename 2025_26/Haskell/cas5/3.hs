parMax :: (Double, Double) -> Double 
parMax p =
    if snd p > fst p then snd p 
    else fst p

parMax' :: (Double, Double) -> Double 
parMax' p = max (fst p) (snd p)