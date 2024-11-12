-- 2.2.25 Napisati funkcije koje određuju glavu i rep proizvoljne 
--liste bez korišćenja ugrađenih funkcija za rad sa listama

glava :: [a] -> a
glava (x:_) = x

rep :: [a] -> [a]
rep (_:xs) = xs

-- umesto onih parametara koje ne koristimo dalje stavljemo dzokere
--NAPOMENA: date funkcije nece raditi za praznu listu, kao sto ne rade 
-- ni head i tail