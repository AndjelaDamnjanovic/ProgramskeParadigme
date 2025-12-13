-- 2.51 Korišćenjem funkcija and i map, definisati funkciju list_all p l
-- koja proverava da li svi elementi liste l zadovoljavaju dato svojstvo p.
-- Testirati funkciju zadavanjem svojstava (>0) i (<0).

list_all p l = and (map p l)