## Example: interval above HxK
G := Group([(1,2,3,4),(1,2)]);;                # S4
H1 := Subgroup(G, [(1,2)]);                    # a subgroup of index 12
H2 := Subgroup(G, [(2,4)]);                    # a subgroup conjugate to H1
K1 := Subgroup(G, [(1,2,3,4)]);                # a subgroup of index 6
K2 := Subgroup(G, [ (1,2)(3,4), (1,3,2,4) ]);  # a conjugate of K1

GHGK:=Concatenation(RightCosets(G,H1), RightCosets(G,K1));;
# returns 
# Group([ (1,11,4,8)(2,10,5,7)(3,12,6,9)(14,17,16,15), (2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17) ])
act1:=Action(G, GHGK, OnRight);
Read("blocksimp.g");
blk:=BlocksImprimitive(act1);
# returns [ [ 1, 4, 7, 10, 15, 17 ] ]

List([1..6],x->Stabilizer(act1,blk[1][x]));
[ Group([ (2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17) ]), 
  Group([ (1,10)(2,12)(3,11)(5,6)(8,9)(13,14)(15,17)(16,18) ]), 
  Group([ (1,10)(2,12)(3,11)(5,6)(8,9)(13,14)(15,17)(16,18) ]), 
  Group([ (2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17) ]), 
  Group([ (1,4,10,7)(2,6,11,9)(3,5,12,8)(13,14,18,16) ]), 
  Group([ (1,7,10,4)(2,9,11,6)(3,8,12,5)(13,16,18,14) ]) ]

# Group action on right cosets G/K1 union G/K2.
GKGK:= Concatenation(RightCosets(G,K1), RightCosets(G,K2));;
act2:=Action(G, GKGK, OnRight);
# returns Group([ (2,5,4,3)(7,11,8,12), (1,4)(2,6)(3,5)(7,8)(9,12)(10,11) ])
blk:=BlocksImprimitive(act2);
# returns [ [ 1, 6, 9, 10 ] ]
List([1..4],x->Stabilizer(act2,blk[1][x]));
[ Group([ (2,4)(3,5)(7,8)(11,12), (2,5,4,3)(7,11,8,12) ]), 
  Group([ (2,4)(3,5)(7,8)(11,12), (2,3,4,5)(7,12,8,11) ]), 
  Group([ (2,4)(3,5)(7,8)(11,12), (2,3,4,5)(7,12,8,11) ]), 
  Group([ (2,4)(3,5)(7,8)(11,12), (2,5,4,3)(7,11,8,12) ]) ]


# (some matlab commands for writing the corresponding uacalc algebra files)
g{1} = '(1,11,4,8)(2,10,5,7)(3,12,6,9)(14,17,16,15)';
g{2} = '(2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17)';
GAPperms2uacalc(g, 18, 'intransS4HK');
g{1} = '(2,5,4,3)(7,11,8,12)';
g{2} = '(1,4)(2,6)(3,5)(7,8)(9,12)(10,11)';
GAPperms2uacalc(g, 12, 'intransS4KK');



# Example from Seress, "Permutation Group Algorithms" p. 111.
g:=Group([(1,2,3,4)(5,6)]);
BlocksImprimitive(g);

g{1} = '(1,2,3,4)(5,6)';
GAPperms2uacalc(g, 6, 'intransSeressExample');
