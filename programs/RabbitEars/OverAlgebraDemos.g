##################

OverAlgebraDemo:=function(i)
    local G, b, Gens;
    if i<3 then 
        G:=Group([(1,2), (1,2,3)]);
        G:=Action(G,G, OnRight);
        name:="S3action";
        Print("\n The congruences of the group, ", StructureDescription(G), ", are:\n");
        for b in AllBlocks(G) do Print(Orbit(G,b,OnSets)-1, "\n"); od;
    else
        G:=Group([(9,10)(11,12)(5,6)(7,8), (3,7,12)(9,1,6)(11,4,8)(5,10,2), (3,2)(9,11)(5,7)(1,4)(10,12)(6,8)]);
        name:="C2xA4";
        Print("\n The congruences of the group, ", StructureDescription(G), ", are:\n");
        for b in AllBlocks(G) do Print(Orbit(G,b,OnSets)-1, "\n"); od;
    fi;        
    
    # S3action
    if i=1 then Gens:=[0,2];
    elif i=2 then Gens:=[0,2,3,5];
        
    # C2xA4
    elif i=3 then Gens:=[0,2];
    elif i=4 then Gens:=[0,4];
        
    else
        Error("Usage: OverAlgebraDemo(i); argument i must be 1, 2, or 3."); 
    fi;
    OverAlgebra([G, Gens, name]);
end;

##################
OverAlgebra2Demo:=function(i)
#   Function for demonstrating program with the group C2xA4, which has 
#   congruence lattice with non-principal coatom 
#   [ [ 0, 1, 2, 3 ], [ 4, 5, 6, 7 ], [ 8, 9, 10, 11  ] ]
# 
#   INPUT  i  demo number
#             i=1 ==> generators: [0,3], [8,11]  (i.e. [1,4], [9,12] in 1-offset)
#             i=2 ==> generators: [0,1], [8,11]  (i.e. [1,2], [9,12] in 1-offset)
#             i=3 ==> generators: [0,3], [8,9]   (i.e. [1,4], [9,10] in 1-offset)
#             i=4 ==> generators: [0,3],[10,11]  (i.e. [1,4],[11,12] in 1-offset)
#             i=5 ==> generators: [0,3],[11,10]  (i.e. [1,4],[12,11] in 1-offset)
#             i=6 ==> generators: [0,1], [0, 2]  (i.e. [1,2], [1, 3] in 1-offset)
#   Notes:
#   1. Examples 2, 3, 4 are of interest because now one of the generators also belongs to 
#      the other coatom [ [ 0, 1, 4, 5, 8, 9 ], [ 2, 3, 6, 7, 10, 11 ] ].
#   2. Example [0,1], [0,2] is of interest because now both generators come from the same block of 
#      [ [ 0, 1, 2, 3 ], [ 4, 5, 6, 7 ], [ 8, 9, 10, 11  ] ]
#
    local G, b, Gens, name;
    if i<7 then
        G:=Group([(9,10)(11,12)(5,6)(7,8), (3,7,12)(9,1,6)(11,4,8)(5,10,2), (3,2)(9,11)(5,7)(1,4)(10,12)(6,8)]);
        Print("\n The congruences of the group, ", StructureDescription(G), ", are:\n");
        for b in AllBlocks(G) do Print(Orbit(G,b,OnSets), "\n"); od;
        # [ [ 0, 1 ], [ 4, 5 ], [ 8, 9 ], [ 2, 3 ], [ 6, 7 ], [ 10, 11 ] ]
        # [ [ 0, 1, 2, 3 ], [ 4, 5, 6, 7 ], [ 8, 9, 10, 11 ] ]
        # [ [ 0, 1, 4, 5, 8, 9 ], [ 2, 3, 6, 7, 10, 11 ] ]
        # [ [ 0, 2 ], [ 1, 3 ], [ 5, 6 ], [ 4, 7 ], [ 8, 11 ], [ 9, 10 ] ]
        # [ [ 0, 3 ], [ 1, 2 ], [ 5, 7 ], [ 4, 6 ], [ 8, 10 ], [ 9, 11 ] ]
        
        # Pick (a1,b1),...,(ak,bk), say, (0,3), (8,11) and run the OverAlgebra2 function:
        name:="C2xA4";
    fi;
    
    if i=1 then
        Gens:=[[0,3], [8,11]];
    elif i=2 then
        Gens:=[[0,1], [8,11]];
    elif i=3 then 
        Gens:= [[0,3], [8,9]];
    elif i=4 then 
        Gens:= [[0,3],[10,11]];
    elif i=5 then 
        Gens:= [[0,3],[11,10]];
    elif i=6 then 
        Gens:= [[0,1], [0, 2]];
    elif i=7 then 
        G:=TransitiveGroup(12,2);
        Print("\n The congruences of the group, ", StructureDescription(G), ", are:\n");
        for b in AllBlocks(G) do Print(Orbit(G,b,OnSets), "\n"); od;
        Gens:= [[0,8]];
        name:="C6xC2";
    else
        Error("Usage: RabbitDemo(i); argument i must be 1,...,7."); 
    fi;
    OverAlgebra2([G, Gens, name]);
end;


