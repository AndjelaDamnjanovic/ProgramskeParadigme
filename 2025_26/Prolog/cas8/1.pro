% jednolinijski komentari

/*


*/

zivotinja(slon).
zivotinja(zec).
zivotinja(lisica).
zivotinja(vuk).
zivotinja(macka).
zivotinja(mis).


veci(slon, zec).
veci(lisica, zec).
veci(macka, mis).
veci(lisica, vuk).
veci(slon, lisica).
veci(slon, macka).

jeVeci(X, Y) :- veci(X, Z), veci(Z, Y).