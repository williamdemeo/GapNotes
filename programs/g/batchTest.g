# Batch file for testing various groups.

name:="S4";;
Print("\nTesting group ", name, "...");
s4 := SymmetricGroup(4);; S4 := SymmetricGroup(4);;
testConjecture(S4,s4,name,true);;
Print("done\n");

name:="GL23";;
Print("\nTesting group ", name, "...");
G := GL(2,3);; g := GL(2,3);; 
testConjecture(G,g,name,true);;
Print("done\n");

name := "SL23";;
Print("\nTesting group ", name, "...");
G := SL(2,3);; g := SL(2,3);; 
testConjecture(G,g,name,true);;
Print("done\n");

name:="GU23";;
Print("\nTesting group ", name, "...");
G := GU(2,3);; g := GU(2,3);; 
testConjecture(G,g,name,true);;
Print("done\n");

name := "BO";;
Print("\nTesting group ", name, "...");
G:= SmallGroup(48,28);; # the binary octahedral group
g:= SmallGroup(48,28);;
testConjecture(G,g,name,true);
Print("done\n");

name:="C3C3sdpQ8";;
Print("\nTesting group ", name, "...");
G := SmallGroup(72,41); # the Frobenius group of order 72
g := SmallGroup(72,41);;
testConjecture(G,g,name,true);
Print("done\n");

name := "C2xC3C3C3sdpC2";;
Print("\nTesting group ", name, "...");
G := SmallGroup(108,44); # An interesting group indentified in the previous section
g := SmallGroup(108,44);; # A copy of the group (needed by testConjecture program)
testConjecture(G, g, name, true);
Print("done\n");

name:="GL23modZ";;
Print("\nTesting group ", name, "...");
G := GL(2,3);; g := GL(2,3);;
ZG := Center(G);; zg := Center(g);
GmodZG := FactorGroup(G,ZG);;
gmodzg := FactorGroup(g,zg);;
testConjecture(GmodZG,gmodzg,name,true);
Print("done\n");

name:="GU23modZ";;
Print("\nTesting group ", name, "...");
G := GU(2,3);; g := GU(2,3);;
ZG := Center(G);; zg := Center(g);
GmodZG := FactorGroup(G,ZG);;
gmodzg := FactorGroup(g,zg);;
testConjecture(GmodZG,gmodzg,name,true);
Print("done\n");

name:="C3C3C3sdpC2";;
Print("\nTesting group ", name, "...");
G := SmallGroup(108,44);;
ZG := Center(G); # returns Group([ f2 ])
GmodZG := FactorGroup(G,ZG);
g := SmallGroup(108,44);;
zg := Center(g);;
gmodzg := FactorGroup(g,zg);;
testConjecture(GmodZG, gmodzg, name, true);
Print("done\n");
