# This is Alexander Hulpke's program for computing congruences of intransitive G-sets.
# The original program file is called blocksimp.g.
# This file contains my comments explaining his program.
#
# Here is an example.
# G := Group([(1,2,3,4),(1,2)]);;  # S_4
# H := Subgroup(G, [(1,2)]);       # a subgroup of index 12
# K := Subgroup(G, [(1,2,3,4)]);   # a subgroup of index 6
# omega:=Concatenation(RightCosets(G,H), RightCosets(G,K));;
# act:=Action(G, omega, OnRight);
# BlocksImprimitive(act);
# returns: Group([ (1,11,4,8)(2,10,5,7)(3,12,6,9)(14,17,16,15), (2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17) ])

BlocksImprimitive:=function(G)
    local orb,b,c,i,j,k,f,fix,co,nb;
    
    # List of orbits:
    orb:=List(Orbits(G,MovedPoints(G)),Set);
    # e.g. [ [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 13, 14, 15, 16, 17, 18 ] ]

    # List of (1-blocks of) nontrivial congruences of the subalgebra orb[1]:
    b:=AllBlocks(Action(G,orb[1]));
    # e.g.  [ [ 1, 2, 3 ], [ 1, 4, 7, 10 ], [ 1, 5, 9 ], [ 1, 10 ] ]
    # (Note [ 1, 10 ] < [ 1, 4, 7, 10 ]; the other 2 are incomparable, so here Con(orb[1]) is a DWP.)
    # NOTE: If you want the full congruences (systems of imprimitivity) do
    # Orbit(G, b[1], OnSets)    # [ [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ], [ 10, 11, 12 ] ]
    # Orbit(G, b[2], OnSets);   # [ [ 1, 4, 7, 10 ], [ 2, 5, 8, 11 ], [ 3, 6, 9, 12 ] ]
    # Orbit(G, b[3], OnSets);   # [ [ 1, 5, 9 ], [ 2, 4, 12 ], [ 3, 7, 11 ], [ 6, 8, 10 ] ]
    # Orbit(LG, b[4], OnSets);  # [ [ 1, 10 ], [ 4, 7 ], [ 2, 8 ], [ 5, 11 ], [ 3, 6 ], [ 9, 12 ] ]
    # Orbit(LG, c[1], OnSets);  # [ [ 13, 18 ], [ 15, 17 ], [ 14, 16 ] ]  (c is defined below)

    b:=List(b,x->orb[1]{x});  
    # Translate to correct labels;
    # e.g. when we compute c:=AllBlocks(Action(G,orb[2])) below,
    # the answer will be [ [ 1, 6 ] ], but it should be [ [ 13, 18 ] ] 
    
    b:=List(b,x->[x,Stabilizer(G,x,OnSets),Length(orb[1])/Length(x)]);
    # This gives [ 1-block, stabilizer of 1-block, number of blocks ]
    # e.g.
    # [ [ [ 1, 2, 3 ], Group([ (2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17), (1,2,3)(4,11,9)(5,12,7)(6,10,8)(13,15,14)(16,18,17) ]), 4 ], 
    # [ [ 1, 4, 7, 10 ], Group([ (2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17), (1,4)(2,5)(3,6)(7,10)(8,11)(9,12)(14,16)(15,17), (1,7)(2,8)(3,9)(4,10)(5,11)(6,12)(13,18)(15,17) ]), 3 ], 
    # [ [ 1, 5, 9 ], Group([ (2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17), (1,5,9)(2,6,7)(3,4,8)(10,11,12)(13,17,14)(15,16,18) ]), 4 ], 
    # [ [ 1, 10 ], Group([ (2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17), (1,10)(2,11)(3,12)(4,7)(5,8)(6,9)(13,18)(14,16) ]), 6 ] ]

    for i in [2..Length(orb)] do
        c:=AllBlocks(Action(G,orb[i]));
        c:=List(c,x->orb[i]{x});
        co:=[];   nb:=[];
        for j in [1..Length(b)] do
            for k in [1..Length(c)] do
                # two block systems from different orbits can be combined only
                # if the two systems have the same number of blocks.
                if Length(orb[i])/Length(c[k])=b[j][3] then
                    if not IsBound(co[k]) then
                        co[k]:=Orbit(G,c[k],OnSets);
                    fi;
                    # these are the possible combinees -- they are fixed and have the
                    # same orbit length, so they have the same stabilizer
                    fix:=Filtered(co[k],x->ForAll(SmallGeneratingSet(b[j][2]),y->OnSets(x,y)=x));
                    # check whether every y in stabilizer of b[j][2] also stabilizes x
                    for f in fix do
                        Add(nb,[Union(b[j][1],f),b[j][2],b[j][3]]);
                    od;
                fi;
            od;
        od;
        b:=nb;
    od;
    return List(b,x->x[1]);
end;

