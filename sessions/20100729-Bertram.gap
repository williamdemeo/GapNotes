gap> G := SmallGroup(108,35);
<pc group of size 108 with 5 generators>
gap> g := SmallGroup(108,35);
<pc group of size 108 with 5 generators>
gap> name := "C2xC3C3C3:C2";
"C2xC3C3C3:C2"
gap> testConjecture(G,g,name,true);
Variable: 'testConjecture' must have a value

gap> Read("testConjecture.g");
gap> testConjecture(G,g,name,true);
gap> IsAbelian(G);
true
gap> Read("findSolvableNonNilpotentGroups.g");
gap> IsAbelianGroup(G);
Variable: 'IsAbelianGroup' must have a value

gap> IsAblian(G);
Variable: 'IsAblian' must have a value

gap> IsAbelian(G);
true
gap> a4 := AlternatingGroup(4);
Alt( [ 1 .. 4 ] )
gap> IsAbelian(a4);
false
gap> Read("findSolvableNonNilpotentGroups.g");
gap> G := SmallGroup(108, 35);
<pc group of size 108 with 5 generators>
gap> StructureDescription(G);
"C12 x C3 x C3"
gap> Read("findSolvableNonNilpotentGroups.g");
gap> Read("findSolvableNonNilpotentGroups.g");
Syntax error: := expected in findSolvableNonNilpotentGroups.g line 14
        If IsAbelian(G) or IsSolvableGroup(G) or IsNilpotentGroup(G) then
                   ^
Syntax error: expression expected in findSolvableNonNilpotentGroups.g line 17
            ncc := NrConjugacyClasses(G);
                                        ^
Syntax error: od expected in findSolvableNonNilpotentGroups.g line 21
        fi;
         ^
gap> Read("findSolvableNonNilpotentGroups.g");
gap> Read("findSolvableNonNilpotentGroups.g");
gap> G := SmallGroup(108,44);
<pc group of size 108 with 5 generators>
gap> IsAbelian(G);
false
gap> IsNilpotentGroup(G);
false
gap> IsSolvable(G);
true
gap> g := SmallGroup(108,44);
<pc group of size 108 with 5 generators>
gap> name := "C2xC3C3C3:C2";
"C2xC3C3C3:C2"
gap> testConjecture(G,g,name,true);
gap> testConjecture(G,g,name,true);
gap> Read("testConjecture.g");
gap> testConjecture(G,g,name,true);
gap> Read("findSolvableNonNilpotentGroups.g");
gap> G := SmallGroup(72,17);
<pc group of size 72 with 5 generators>
gap> g := SmallGroup(72,17);
<pc group of size 72 with 5 generators>
gap> name := "C2xC2xD18";
"C2xC2xD18"
gap> testConjecture(G,g,name,true);
gap> testConjecture(G,g,name,true);
gap> Read("testConjecture.g");
gap> testConjecture(G,g,name,true);
gap> G := SmallGroup(72,6);
<pc group of size 72 with 5 generators>
gap> g := SmallGroup(72,6);
<pc group of size 72 with 5 generators>
gap> name := "D72";
"D72"
gap> testConjecture(G,g,name,true);
gap> G := SmallGroup(72,49);
<pc group of size 72 with 5 generators>
gap> g := SmallGroup(72,49);
<pc group of size 72 with 5 generators>
gap> name := "C2xC2XC3xC3sdpC2";
"C2xC2XC3xC3sdpC2"
gap> testConjecture(G,g,name,true);
gap> quit;
