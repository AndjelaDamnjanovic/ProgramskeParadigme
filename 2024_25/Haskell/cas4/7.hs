-- 2.7 Napisati funkciju parMax p koja određuje veći element iz para 
--realnih brojeva

{-
    U Haskell-u je moguce definisati i torke koje, za razliku od listi, 
    ne moraju da sadrze elemente istog tipa. Ali, samo u slucaju dvojki
    moguce je koristiti ugradjene funkcije fst i snd koji izdvajaju redom prvi
    i drugi element uredjenog para. U potpisima funkcija, kao i u pozivima funkcija
    torke se pisu unutar obicnih zagrada
-}

parMax :: (Double, Double) -> Double
parMax p = if (fst p) > (snd p) then fst p
           else snd p
            
-- Drugi nacin da se resi isti problem jeste koriscenjem ugradjene funkcije
-- max koja vraca maksimum dva elementa
parMax' :: (Double, Double) -> Double
parMax' p = max (fst p) (snd p)