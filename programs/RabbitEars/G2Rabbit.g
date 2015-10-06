# File: G2Rabbit.g
# Author: William DeMeo
# Date: 2011.10.25
#
# Description: GAP routine for doing Rabbit Ears analysis on a given action group.
# See Also: RabbitEars.g
#
# Send questions, comments, suggestions to williamdemeo@gmail.com
#

# writeUACalcOp:=function(uacalcfile, op, opname)
#   Utility function for writing an operation to a file in uacalc 
#   format. The operation should be a vector of length N, say, containing integer 
#   values between 1 and N.  (These values will be converted to 0-offset.)
#
# INPUTS  uacalcfile = name of file to which operation should be written.
#         op = the operation (a vector)
#         opname = what to name the operation in the uacalc algebra file.
#
writeUACalcOp:=function(uacalcfile, op, opname)
    local N, x;
    N:=Length(op);    
    AppendTo(uacalcfile, "<op>\n<opSymbol><opName>", opname, "</opName>\n");
    AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
    AppendTo(uacalcfile,op[1]-1);
    for x in [2..N] do
        AppendTo(uacalcfile, ",", op[x]-1);
    od;
    AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
end;

G2Rabbit:=function(args)
    # G2Rabbit:=function([G, [[a1,b1],[a2,b2],...,[ak,bk]], algebraname])
    #
    # This function takes a transitive permutation group G acting on a set of N moved points
    # B={1,2,...,N}, and a list of pairs of points in this set, [[a1,b1],[a2,b2],...,[ak,bk]]
    # with ai<>bi, and for each 1<i<k+1, constructs a set BB[i], which is in bijective 
    # correspondence with B via pp[i]:B-->BB[i] and so that, for 1<i<k-1, 
    # 
    #     BB[i] \ni pp[i][b[i]] = pp[i+1][a[i+1]]  \in BB[i+1],
    #
    #     B \ni a[1] = pp[1][a[1]]  \in BB[1], and
    #
    #     BB[k] \ni pp[k][b[k]] = pp[k+1][b[1]]  \in BB[k+1], and
    #
    ##### TODO(wjd)[2011.10.17]: I think this ^^^ should be pp[k+1][a[1]] <<< check it!!
    #
    # and the sets have no other points in common, other than the ones mentioned above.
    #
    # Then operations on the union A = B0 \cup BB[1] \cup BB[2] \cup ...
    # are defined to create an algebra on A, which is stored in a uacalc file named 
    # G2Rabbit-algebraname.ua.  Also, the original G-set algebra is stored in the same file
    # and called algebraname. (This can be turned off by setting the variable STORE_GSET:=false below.)
    #
    # Input   G              a transitive group on the set of moved points B0 = {1, 2, ..., N}
    #         [[a1,b1],[a2,b2],...,[ak,bk]]  the tie-points
    #         algebraname    (optional, default=StructureDescription(G)) a string, used to name the uacalc algebra.
    #
    # Output  G2Rabbit-algebraname.ua  A uacalc file which stores the original G-set algebra, called
    #                             algebraname, as well as the G2Rabbit-algebra <A, F> where A is the set 
    #                                      A = B0 \cup BB[1] \cup BB[2] \cup ...
    #                                      F is the set of maps:
    #                                         (fill this in later)
    #
    # Example    gap> Read("G2Rabbit.g");
    #            gap> G:=TransitiveGroup(12,7);
    #            gap> for b in AllBlocks(G) do Print(Orbit(G,b,OnSets), "\n"); od;
    #            [ [ 1, 3, 5, 7, 9, 11 ], [ 2, 4, 6, 8, 10, 12 ] ]
    #            [ [ 1, 6 ], [ 7, 12 ], [ 5, 10 ], [ 4, 11 ], [ 2, 9 ], [ 3, 8 ] ]
    #            [ [ 1, 6, 7, 12 ], [ 4, 5, 10, 11 ], [ 2, 3, 8, 9 ] ]            <--- non-principal coatom
    #            [ [ 1, 7 ], [ 5, 11 ], [ 3, 9 ], [ 6, 12 ], [ 4, 10 ], [ 2, 8 ] ]
    #            [ [ 1, 12 ], [ 6, 7 ], [ 4, 5 ], [ 10, 11 ], [ 8, 9 ], [ 2, 3 ] ]
    #
    #            Pick your a1, ..., ak, b1, ..., bk, say, [a1,b1]=[1, 6], [a2,b2]=[1, 7]
    #            and run the G2Rabbit function like this:
    #
    #            gap> G2Rabbit( [ G, [[1,6],[1,7]] ] );
    # 
    #            This produces a file called G2Rabbit-C2 x A4_1-6_1-7.ua.
    #
    # Author: williamdemeo@gmail.com
    # Date: 2011.10.25
    
    local i, j, k, z, x, K, aa, a, bb, b, bi, bj, blk, Bmp, B0, B1, BB, p0, p, pi, r, q, g, gp0, gens, Gens, numgens, N, n, 
          nargin, G, pathname, filename, outfile, opcount, pos, VERBOSE, sizeA, algebraname, opname,
          uacalcpath, uacalcfile, STORE_GSET, numalgebras, yetfound;
    
    ### Variables you can change to your liking:
    uacalcpath := "/tmp/G2Rabbits/"; # <<< ATTENTION! This is where uacalc file is stored.
    VERBOSE:=true;         # Set this to false to supress extra command-line output.
    STORE_GSET:=true;      # Set this to false if you don't want the original G-set also stored in the uacalc file.
    ###
    
    nargin := Length(args);
    if VERBOSE then
        Print("G2Rabbit called with the following arguments: \n");
        for k in [1..nargin] do
            Print("args[",k,"] = ", args[k], "\n");
        od;
    fi;
    
    if nargin < 2 then 
        Error("Usage: G2Rabbit([G, [[a1,b1], [a2,b2],...],  algebraname])"); 
    else 
        G:=args[1];  
        Gens:=args[2];   # The generators, or axes, as a list of lists: [[a1,b1], [a2,b2], ...]
    fi;
    
    K:=Length(Gens);
    aa:=[];
    bb:=[];
    for k in [1..K] do
        Add(aa,Gens[k][1]);
        Add(bb,Gens[k][2]);
    od;
    if nargin < 3 then algebraname:=StructureDescription(G); else algebraname:=args[3]; fi;

    if not IsTransitive(G) then
        Error("Usage: G2Rabbit([G, ...]);  G must be a transitive group.");
    fi;
    
    filename:=Concatenation(uacalcpath, "G2Rabbit_", algebraname, "_");
    K:=Length(aa);
    
    for k in [1..K] do
        filename:= Concatenation(filename, String( aa[k] - 1 ), "-", String( bb[k] - 1));
        if k<>K then filename:= Concatenation(filename, "_"); fi;
    od;
    filename:=Concatenation(filename, ".ua");
    
    if VERBOSE then Print("\nuacalc file: ", filename, "\n"); fi;
    uacalcfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(uacalcfile, false);   # prevents automatic indentation and line breaks.

    Bmp:=MovedPoints(G);
    N:=NrMovedPoints(G);
    for k in [1..K] do
        if not (aa[k] in Bmp) then
            Error("Usage: G2Rabbit([G, [[a1,b1],...,[ak,bk]],...]);  a_",k," must be in the set B=MovedPoints(G)."); 
        fi;
        if not (bb[k] in Bmp) then
            Error("Usage: G2Rabbit([G, [[a1,b1],...,[ak,bk]],...]);  b_",k," must be in the set B=MovedPoints(G)."); 
        fi;
        if aa[k]=bb[k] then
            Error("Usage: G2Rabbit([G, [[a1,b1],...,[ak,bk]],...]);  a",k,"=b",k,", but they must be distinct."); 
        fi;
    od;
    
    # Print the congruences and tie-points
    if VERBOSE then
        Print("\n--- CONGRUENCES of (B,G) --- \n");
        for blk in AllBlocks(G) do Print(Orbit(G,blk,OnSets), "\n"); od;
        Print("\ntie-points: a=", aa, ";  b=", bb, ";\n"); 
    fi;
    
    a:=[];  b:=[];    # the indices of the aa and bb in the set of moved points.
    for k in [1..K] do
        a[k]:=Position(Bmp,aa[k]);
        b[k]:=Position(Bmp,bb[k]);
    od;
    
    sizeA:= (K+2)*N-(K+1);
    B0:=[1..N];    # (indices of) the elements in original universe (the moved points of G)
    BB:=[];        # The rows of BB are B1, B2, B3, ...
    BB[1]:=B0+N;   # BB[1] = the left hand rabbit ear
    BB[1][a[1]]:=a[1];
    for j in [(a[1]+1)..N] do
        BB[1][j]:=BB[1][j]-1;
    od;
    for i in [2..K] do
        BB[i]:=[1..N]+BB[i-1][N];
        BB[i][a[i]]:=BB[i-1][b[i-1]];
        for j in [(a[i]+1)..N] do
            BB[i][j]:=BB[i][j]-1;
        od;
    od;
    BB[K+1]:=[1..N]+BB[K][N];
    BB[K+1][a[1]]:=BB[K][b[K]]; # <<< This is where we differ from WALrabbit
    for j in [(a[1]+1)..N] do                          
        BB[K+1][j]:=BB[K+1][j]-1;
    od;
    
    if VERBOSE then
        Print("\n--- MINIMAL SETS --- \n");
        Print("B0    = ", B0-0, "\n");
        for k in [1..K+1] do
            Print("BB[", k, "] = ", BB[k], "\n");
        od;
    fi;
    
    if VERBOSE then
        Print("\nThe size of A is ", sizeA,". This should equal BB[K+1][N]=BB[",K+1,"][",N,"]=",BB[K+1][N],"\n");
        if BB[K+1][N]<>sizeA then
            Print("\nWARNING: the equality above is false, so we got the size of A wrong.\n");
        fi;
    fi;
    p0:=[];
    
    ### Construct p0 and r ### << different construction from WALrabbit
    r:= [1..sizeA];
    p:=[];
    p[K+1]:=[1..sizeA];
    for x in [1..sizeA] do
        if x in B0 then
            p0[x]:=x;
            p[K+1][x]:=BB[K+1][x];
            r[x]:=a[1];
        elif x in BB[K+1] then
            p0[x]:=Position(BB[K+1], x);
            p[K+1][x]:=x;
            r[x]:=BB[K+1][a[1]];
        else
            p0[x]:=a[1];                     
            p[K+1][x]:=BB[K+1][a[1]];          
            r[x]:=x;
        fi;
    od;
    
    ### Construct the pi's
    for k in [1..K] do  #for k in [2..K] do
        p[k]:=[1..sizeA];
        for x in [1..sizeA] do
            if x in BB[k] then
                p[k][x]:=x;
            elif x < BB[k][1] or x< BB[k][2] # we have to check two since on of them could be the intersection point
              then  
                p[k][x]:=BB[k][a[k]];
            elif x > BB[k][N] then
                p[k][x]:=BB[k][b[k]];
            else
                Print("\nWARNING: Didn't expect to get here... There must be an error.\n");
            fi;
        od;
    od;        
    
    ### Construct the qij = sij pi
    q:=[];
    for i in [0..K+1] do
        q[i+1]:=[];
        if i=0 then 
            bi:=B0; pi:=p0; 
        else 
            bi:=BB[i]; pi:=p[i];
        fi;
        for j in [0..K+1] do
            if j=0 then bj:=B0; else bj:=BB[j]; fi;
            q[i+1][j+1]:=[1..sizeA];
            for x in [1..sizeA] do
                q[i+1][j+1][x]:=bj[Position(bi,pi[x])];
            od;
        od;
    od;
    
    ### Construct g p0, one for each g in G.
    gp0:=[];
    gens:=GeneratorsOfGroup(G);
    numgens:=Length(gens);
    for i in [1..numgens] do
        gp0[i]:=[1..sizeA];
        g:=gens[i];
        for j in [1..sizeA] do            
            x:=Bmp[p0[j]]^g;              # The p0[j]-th moved point is moved to x; 
            gp0[i][j]:=Position(Bmp, x);  # gp0[i][x]:= the index of x in Bmp.
        od;
    od;
    
    if VERBOSE then
        Print("\n--- OPERATIONS ---\n");
        Print("\nr = ", r, "\n");
        Print("\n------ pi's --------\n");
        Print("p0 = ", p0, "\n");
        for k in [1..K+1] do
            Print("p[", k, "] = ", p[k], "\n");
        od;
        Print("\n------ qij's --------\n");
        for i in [1..K+1] do
            for j in [1..K+1] do
                Print("q[", i, "][", j, "] = ", q[i][j], "\n");
            od;
        od;
        Print("\n------ gip0's --------\n");
        for i in [1..numgens] do
            Print("g", i, "p0 = ", gp0[i], "\n");
        od;
    fi;
    
    # now write the uacalc file
    PrintTo(uacalcfile, "<?xml version=\"1.0\"?>\n");
            
            if STORE_GSET then  ### First put the original G-set algebra in the uacalc file 
        AppendTo(uacalcfile, "<algebraList>\n");
        AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>", algebraname, "</algName>\n");
        AppendTo(uacalcfile, "<desc>The permutational algebra (", MovedPoints(G)-1, ", ", StructureDescription(G), ") (generated by G2Rabbit).</desc>\n");
        AppendTo(uacalcfile, "<cardinality>", N, "</cardinality>\n");
        AppendTo(uacalcfile, "<operations>\n");
        
        for i in [1..numgens] do
            g:=gens[i];
            AppendTo(uacalcfile, "<op>\n<opSymbol><opName>g", i, "</opName>\n");
            AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
            for j in [1..N] do
                x:=Bmp[j]^g;
                x:=Position(Bmp, x);
                AppendTo(uacalcfile, x-1, "," );
            od;
            AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
        od;
        AppendTo(uacalcfile, "</operations>\n</basicAlgebra>\n</algebra>\n\n");
    fi;
    
    # Now write the general rabbit ears algebra
    AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>G2Rabbit-", algebraname,"</algName>\n");
    AppendTo(uacalcfile, "<desc>Lampean rabbit on ", algebraname, " using points ", Gens-1,".</desc>\n");
    AppendTo(uacalcfile, "<cardinality>", sizeA, "</cardinality>\n");
    AppendTo(uacalcfile, "<operations>\n");
    ## p0 ##
    writeUACalcOp(uacalcfile, p0, "p0");
    ## p[k] ## 
    for k in [1..K+1] do
        opname:=Concatenation("p",String(k));
        writeUACalcOp(uacalcfile, p[k], opname);
    od;    
    # r #
    writeUACalcOp(uacalcfile, r, "r");
    
    # gip0
    for i in [1..numgens] do
        opname:=Concatenation("g",String(i),"p0");
        writeUACalcOp(uacalcfile, gp0[i], opname);
    od;
    
    ### qij = sij pi
    for i in [0..K+1] do
        for j in [0..K+1] do
            opname:=Concatenation("q_",String(i),",", String(j));
            writeUACalcOp(uacalcfile, q[i+1][j+1], opname);
        od;
    od;
    
    AppendTo(uacalcfile, "</operations>\n</basicAlgebra>\n</algebra>\n");

    if STORE_GSET then
        AppendTo(uacalcfile, "</algebraList>\n");
    fi;
end;    

# G2RabbitDemo:=function(i)
#   Function for demonstrating program with the group C2xA4, which has 
#   congruence lattice with non-principal coatom 
#   [ [ 1, 2, 3, 4 ], [ 5, 6, 7, 8 ], [ 9, 10, 11, 12 ] ]
# 
#   INPUT  i  demo number
#             i=1 ==> generators: [1,4], [9,12]
#             i=2 ==> generators: [1,2], [9,12]
#             i=3 ==> generators: [1,4], [9,10]
#             i=4 ==> generators: [1,4],[11,12]
#             i=5 ==> generators: [1,4],[12,11]
#             i=6 ==> generators: [1,2], [1, 3]
#   Notes:
#   1. Examples 2, 3, 4 are of interest because now one of the generators also belongs to 
#      the other coatom [ [ 1, 2, 5, 6, 9, 10 ], [ 3, 4, 7, 8, 11, 12 ] ].
#   2. Example [1,2], [1,3] is of interest because now both generators come from the same block of 
#      [ [ 1, 2, 3, 4 ], [ 5, 6, 7, 8 ], [ 9, 10, 11, 12 ] ]
#
G2RabbitDemo:=function(i)
    local G, b, Gens;
    G:=Group([(9,10)(11,12)(5,6)(7,8), (3,7,12)(9,1,6)(11,4,8)(5,10,2), (3,2)(9,11)(5,7)(1,4)(10,12)(6,8)]);
    Print("\n The congruences of the group, ", StructureDescription(G), ", are:\n");
    for b in AllBlocks(G) do Print(Orbit(G,b,OnSets), "\n"); od;
    #[ [ 1, 2 ], [ 5, 6 ], [ 3, 4 ], [ 9, 10 ], [ 7, 8 ], [ 11, 12 ] ]
    #[ [ 1, 2, 3, 4 ], [ 5, 6, 7, 8 ], [ 9, 10, 11, 12 ] ]              <--- non-principal coatom
    #[ [ 1, 2, 5, 6, 9, 10 ], [ 3, 4, 7, 8, 11, 12 ] ]
    #[ [ 1, 3 ], [ 6, 7 ], [ 2, 4 ], [ 5, 8 ], [ 9, 12 ], [ 10, 11 ] ]
    #[ [ 1, 4 ], [ 6, 8 ], [ 5, 7 ], [ 9, 11 ], [ 10, 12 ], [ 2, 3 ] ]
    # Pick (a1,b1),...,(ak,bk), say, (1,4), (9,12) and run the G2Rabbit function:
    if i=1 then
        Gens:=[[1,4],[9,12]];
    elif i=2 then
        Gens:=[[1,2],[9,12]];
    elif i=3 then 
        Gens:= [[1,4],[9,10]];
    elif i=4 then 
        Gens:= [[1,4],[11,12]];
    elif i=5 then 
        Gens:= [[1,4],[12,11]];
    elif i=6 then 
        Gens:= [[1,2],[1,3]];
    else
        Error("Usage: RabbitDemo(i); argument i must be 1, 2, 3, 4, or 5."); 
    fi;
    G2Rabbit([G, Gens, "C2xA4"]);
end;
        

OldDemo:=function()
    local G, b;
    G:=TransitiveGroup(12,7);
    Print("\n The congruences of the group, ", StructureDescription(G), ", are:\n");
    for b in AllBlocks(G) do Print(Orbit(G,b,OnSets), "\n"); od;
    # [ [ 1, 3, 5, 7, 9, 11 ], [ 2, 4, 6, 8, 10, 12 ] ]
    # [ [ 1, 6 ], [ 7, 12 ], [ 5, 10 ], [ 4, 11 ], [ 2, 9 ], [ 3, 8 ] ]
    # [ [ 1, 6, 7, 12 ], [ 4, 5, 10, 11 ], [ 2, 3, 8, 9 ] ]            <--- non-principal coatom
    # [ [ 1, 7 ], [ 5, 11 ], [ 3, 9 ], [ 6, 12 ], [ 4, 10 ], [ 2, 8 ] ]
    # [ [ 1, 12 ], [ 6, 7 ], [ 4, 5 ], [ 10, 11 ], [ 8, 9 ], [ 2, 3 ] ]
    # Pick (a1,b1),...,(ak,bk), say, (1,6), (1,7) and run the G2Rabbit function:
    # and run the G2Rabbit function:
    G2Rabbit([G, [[1,6],[1,7]]]);
    # This produces a file called G2Rabbit-C2 x A4_1-6_1-7.ua.
end;

