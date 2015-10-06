# commented and simplified (for just two orbits) version of 4/4/11 
BlocksImprimitive:=function(G)
    local orb,b,c,i,j,k,f,fix,co,nb;
    orb:=List(Orbits(G,MovedPoints(G)),Set);
    # e.g. [ [ 1, 2, 3, 4, 5, 6 ], [ 7, 8, 9, 10, 11, 12 ] ]
    b:=AllBlocks(Action(G,orb[1]));
    # e.g. [ [ 1, 6 ] ]
    b:=Concatenation([[1]],b); # also trivial blocks
    # e.g. [ [ 1 ], [ 1, 6 ] ]
    b:=List(b,x->orb[1]{x});
    
    b:=List(b,x->[x,Stabilizer(G,x,OnSets),Length(orb[1])/Length(x)]);
    # e.g. [ 
    #      [ [ 1 ], Group([ (2,4)(3,5)(7,8)(11,12), (2,5,4,3)(7,11,8,12) ]), 6 ], 
    #      [ [ 1, 6 ], Group([ (2,4)(3,5)(7,8)(11,12), (2,5,4,3)(7,11,8,12), (1,6)(3,5)(7,8)(9,10) ]), 3 ] 
    #      ]

    c:=AllBlocks(Action(G,orb[2]));
    # e.g. [ [ 1, 2 ] ]
    c:=Concatenation([[1]],c); # also trivial blocks
    # e.g. [ [ 1 ], [ 1, 2 ] ]
    c:=List(c,x->orb[2]{x});
    
    # c := [ [ 7 ], [ 7, 8 ] ]
    
    co:=[];    nb:=[];
    for j in [1..Length(b)] do
        for k in [1..Length(c)] do
            if Length(orb[2])/Length(c[k])=b[j][3] then
                if not IsBound(co[k]) then
                    co[k]:=Orbit(G,c[k],OnSets);
                    # e.g. k=1, [ [ 7 ], [ 8 ], [ 11 ], [ 12 ], [ 9 ], [ 10 ] ]
                    #      k=2, [ [ 7, 8 ], [ 11, 12 ], [ 9, 10 ] ]
                fi;
                # these are the possible combinees -- they are fixed and have the
                # same orbit length, so they have the same stabilizer
                fix:=Filtered(co[k],x->ForAll(SmallGeneratingSet(b[j][2]),y->OnSets(x,y)=x));
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

