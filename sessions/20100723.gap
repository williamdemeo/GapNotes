gap> s4 := SymmetricGroup(4);
Sym( [ 1 .. 4 ] )
gap> s4alt := Group((1,2)(3,4), (1,2,3));
Group([ (1,2)(3,4), (1,2,3) ])
gap> Order(s4alt);
12
gap> s4alt := Group((1,2)(3,4), (1,2,3,4));
Group([ (1,2)(3,4), (1,2,3,4) ])
gap> Order(s4alt);
8
gap> GeneratorsOfGroup(s4);
[ (1,2,3,4), (1,2) ]
gap> s4alt := Group((1,2,3,4),(1,2));
Group([ (1,2,3,4), (1,2) ])
gap> Order(s4alt);
24
gap> quit;
