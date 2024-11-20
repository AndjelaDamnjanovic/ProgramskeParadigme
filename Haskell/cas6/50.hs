-- 2.50 Definisati funkcije za sortiranje liste parova brojeva: 
-- a) rastuće/opadajuće po prvom elementu para, b) rastuće/opadajuće 
-- po drugom elementu para.

-- sort - koristi ugradjenu fju compare i sortira el rastuce
-- sortBy
-- sortOn

cmp p1 p2 = compare (snd p1) (snd p2)
sort1 l = sortBy cmp l
