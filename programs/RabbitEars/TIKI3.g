# File: TIKI3.g
# Author: William DeMeo
# Date: 2011.10.19
# Updated: 2011.10.19
#
# Description: The functions here build on those in RabbitEars.g and WJDrabbit.g.
# They are experimental and are an attempt to find more general constructions.
#
# Send questions, comments, suggestions to williamdemeo@gmail.com
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



TIKI3:=function(args)
    # TIKI3:=function([G, [[a1,b1], [a2,b2], ...],  algebraname])
    # This is for expanding an interval above a non-principle congruence Cg((a1,b1),(a2,b2),...(an,bn)) (and no others?)
    # We will only add extra minimal sets BB[1] and BB[2] which intersect at (a1,a2,...,an) and (b1,b2,...,bn) resp.
    #
    # Author: williamdemeo@gmail.com
    # Date: 2011.10.19
    # Updated: 2011.10.19
    
    local B0, BB, p0, s, s1, s2, q0, q1, gn, gensB, gensA, nargin, G, pathname, filename, outfile, N, m, opcount, g, k, z, x, pos, pos1, pos2, 
          i, j, flag, opname, b, axes, Gens, ngens, axstring, aboveax, VERBOSE, sizeA,algebraname, newops, genprod, 
          uacalcpath, uacalcfile, STORE_GSET, e, numalgebras, znotfound, count, last, apts, bpts;
    
    ### Variables you can change to your liking:
    #
    uacalcpath := "./"; # <<< ATTENTION! This is where uacalc file is stored.
    VERBOSE:=true;         # Set this to false to supress extra command-line output.
    STORE_GSET:=true;      # Set this to false if you don't want the original G-set also stored in the uacalc file.
    #
    ###
    
    nargin := Length(args);
    if VERBOSE then
        Print("TIKI called with the following arguments: \n");
        for k in [1..nargin] do
            Print("args[",k,"] = ", args[k], "\n");
        od;
    fi;
    if nargin < 1 then 
        Error("Usage: TIKI([G, [[a1,b1], [a2,b2], ...], algebraname]);");
    else
        G:=args[1]; 
    fi;
    
    if nargin < 3 then algebraname:=StructureDescription(G); else algebraname:=args[3]; fi;
    #if nargin < 3 then M:=1; else M:=args[3]; fi;
    if nargin < 2 then 
        Error("Usage: TIKI([G, [[a1,b1], [a2,b2],...],  algebraname])"); 
    else 
        Gens:=args[2];   # The generators, or axes, as a list of lists: [[a1,b1], [a2,b2], ...]
    fi;
    
    ngens:=Length(Gens);
    apts:=[];
    bpts:=[];
    for g in [1..ngens] do
        Add(apts,Gens[g][1]);
        Add(bpts,Gens[g][2]);
    od;
    
    if not IsTransitive(G) then
        Error("Usage: TIKI([G, [[a1,b1], [a2,b2],...],  algebraname]); G must be a transitive group."); 
    fi;
    
    axstring:=Concatenation("TIKI3_", algebraname);
    axstring:=Concatenation(axstring, "_");
    axstring:= Concatenation(axstring, String( Gens[1][1] - 1 ));
    axstring:= Concatenation(axstring, "-");        
    axstring:= Concatenation(axstring, String( Gens[1][2] - 1 ));
    axstring:= Concatenation(axstring, "__");
    for g in [2..ngens] do
        axstring:= Concatenation(axstring, String( Gens[g][1] - 1 ));
        axstring:= Concatenation(axstring, "-");        
        axstring:= Concatenation(axstring, String( Gens[g][2] - 1 ));
        if g<>ngens then axstring:= Concatenation(axstring, "_"); fi;
    od;
    
    filename := Concatenation(uacalcpath, axstring, ".ua");

    Print("uacalc file: ", filename, "\n");
    uacalcfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(uacalcfile, false);   # prevents automatic indentation and line breaks.

    N:=NrMovedPoints(G);
    
    if VERBOSE then
        Print("apts = ", apts, "\n");
        Print("bpts = ", bpts, "\n");
    fi;
    
    sizeA:= N+2*(N-ngens);
    B0:=[1..N];
    BB:=[];
    p0:=[];
    aboveax:=[];
    for k in [1..2] do
        Add(aboveax, 0);
        Add(BB, [1..N]);
        Add(p0, ());
    od;
    
    # construct BB[1]
    count:=0; last:=0;
    for b in B0 do
        if b in apts then
            count:=count+1;
        else
            BB[1][b]:=N+b-count;
            last:=BB[1][b];
        fi;
    od;
    
    # construct BB[2]
    count:=0;
    for b in B0 do
        if b in bpts then
            count:=count+1;
        else
            BB[2][b]:=last+b-count;
        fi;
    od;
    
    if VERBOSE then
        Print("B0 = ", B0-0, "\n");
        Print("BB[1]= ", BB[1], "\n");
        Print("BB[2]= ", BB[2], "\n");
    fi;
    
    ### Construct the p0i's
    # Note: p0[k] maps B0 bijectively onto BB[k].
    # p0[k] is a permutation; e.g. p0[1]=(b1,b1')(b2,b2')...(bn,bn')
    # so you can apply it to any element x of A as follows:
    #  x^p0[k] will leave x fixed if x is not in B0 or BB[k]
    #          otherwise it will map x to the corresponding element of B0 or BB[k] 
    # construct p01
    for b in B0 do
        if not(b in apts) then
            #Print("(b,BB[1][b]) = (", b, ", " , BB[1][b], ")\n");  
            p0[1]:=p0[1]*(b,BB[1][b]); 
        fi;
    od;
    
    # construct p02
    for b in B0 do
        if not(b in bpts) then
            p0[2]:=p0[2]*(b,BB[2][b]); 
        fi;
    od;
    
    
    if VERBOSE then
        Print("p0[1] = ", p0[1], "\n");
        Print("p0[2] = ", p0[2], "\n");
    fi;
    
    ### Construct s[g]
    s:=[];
    for g in [1..ngens] do
        s[g]:=[1..sizeA];
    od;
    for g in [1..ngens] do
        for z in [1..sizeA] do
            if (z in BB[1]) then
                s[g][z]:=apts[g];
            elif (z in BB[2]) then
                s[g][z]:=bpts[g];
            fi;
        od;
    od;

    if VERBOSE then 
        for m in [1..ngens] do
            Print("s[", m, "] = ", s[m], "\n");
        od;
    fi;
    # now write the uacalc file
    PrintTo(uacalcfile, "<?xml version=\"1.0\"?>\n");
            
    if STORE_GSET then   # there will be multiple algebras in the resulting uacalc file
        AppendTo(uacalcfile, "<algebraList>\n");
    fi;
    
    ### First put the original G-set algebra in the uacalc file 
    if STORE_GSET then
        AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>", algebraname, "</algName>\n");
        AppendTo(uacalcfile, "<desc>The permutational algebra (", MovedPoints(G)-1, ", ", StructureDescription(G), ") (generated by Manifoil).</desc>\n");
        AppendTo(uacalcfile, "<cardinality>", N, "</cardinality>\n");
        AppendTo(uacalcfile, "<operations>\n");
        opcount:=0;
        
        for g in GeneratorsOfGroup(G) do
            AppendTo(uacalcfile, "<op>\n<opSymbol><opName>g", opcount, "</opName>\n");
            AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
            AppendTo(uacalcfile, 1^g-1);
            for x in [2..N] do
                AppendTo(uacalcfile, ",", x^g-1);
            od;
            AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
            opcount:=opcount+1;
        od;
        AppendTo(uacalcfile, "</operations>\n</basicAlgebra>\n</algebra>\n\n");
    fi;
    
    AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>", axstring,"</algName>\n");
    AppendTo(uacalcfile, "<desc>Rabbit-ears on ", algebraname, " using points ", Gens-1, ".</desc>\n");
    
    AppendTo(uacalcfile, "<cardinality>", sizeA, "</cardinality>\n");
    AppendTo(uacalcfile, "<operations>\n");
    
    ## p0 ## maps everything in A to B0
    AppendTo(uacalcfile, "<op>\n<opSymbol><opName>p0</opName>\n");
    AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
    for z in [1..sizeA] do
        if z in B0 then
            AppendTo(uacalcfile, z-1, ",");  #  (this leaves extra comma in op definition -- hope that's ok)
        else
            for k in [1..2] do
                if z in BB[k] then
                    AppendTo(uacalcfile, (z^p0[k])-1, ",");
                    break;
                fi;
            od;
        fi;
    od;
    AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
    
    ## p0[k] ## 
    # Note carefully what we're doing here.  We're not simply writing the p0 as defined above
    # to the uacalc file.  Rather, we're taking any b not in B0 or BB[k] and mapping it first to
    # B0, then mapping it from B0 to BB[k].  So the resulting map "pk" maps all of A onto BB[k].
    
    for k in [1..2] do
        AppendTo(uacalcfile, "<op>\n<opSymbol><opName>p", k, "</opName>\n");
        AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
        for z in [1..sizeA] do
            if z in B0 then
                AppendTo(uacalcfile, z^p0[k]-1, ",");
            else
                for j in [1..2] do
                    if z in BB[j] then
                        if j=k then
                            AppendTo(uacalcfile, z-1, ",");
                        else
                            AppendTo(uacalcfile, (z^p0[j])^p0[k]-1, ",");
                        fi;
                        break;
                    fi;
                od;
            fi;
        od;
        AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
    od;
    
    for m in [1..ngens] do
        opname:=Concatenation("s",String(m));
        writeUACalcOp(uacalcfile, s[m], opname);
    od;

    opcount:=0;
    # now construct the operations g p_0, one for each generator g of G.
    for g in GeneratorsOfGroup(G) do
        AppendTo(uacalcfile, "<op>\n<opSymbol><opName>g", opcount, "</opName>\n");
        AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
        for z in [1..sizeA] do
            if z in B0 then
                AppendTo(uacalcfile, z^g-1,",");
            else
                for k in [1..2] do
                    if z in BB[k] then
                        AppendTo(uacalcfile,(z^p0[k])^g-1, ",");
                        break;
                    fi;
                od;
            fi;
        od;
        AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
        opcount:=opcount+1;
    od;
    
    AppendTo(uacalcfile, "</operations>\n</basicAlgebra>\n</algebra>\n");

    if STORE_GSET then
        AppendTo(uacalcfile, "</algebraList>\n");
    fi;

    
end;

TIKI3Demo:=function(i)
    local G, b, Gens;
    G:=Group([(1,2), (1,2,3)]);
    G:=Action(G,G, OnRight);
    name:="S3";
    # [ [ 1, 5 ], [ 2, 6 ], [ 3, 4 ] ]
    # [ [ 1, 2, 3 ], [ 4, 5, 6 ] ]
    # [ [ 1, 4 ], [ 2, 5 ], [ 3, 6 ] ]
    # [ [ 1, 6 ], [ 3, 5 ], [ 2, 4 ] ]
    if i=1 then
        Print("\n The congruences of the group, ", StructureDescription(G), ", are:\n");
        for b in AllBlocks(G) do Print(Orbit(G,b,OnSets), "\n"); od;
        Gens:=[[1,3]];
    elif i=2 then
        Print("\n The congruences of the group, ", StructureDescription(G), ", are:\n");
        for b in AllBlocks(G) do Print(Orbit(G,b,OnSets), "\n"); od;
        Gens:=[[1,3],[4,6]];
    elif i=3 then
        Print("\n The congruences of the group, ", StructureDescription(G), ", are:\n");
        for b in AllBlocks(G) do Print(Orbit(G,b,OnSets), "\n"); od;
        Gens:=[[1,4]];
    elif i=4 then
        Print("\n The congruences of the group, ", StructureDescription(G), ", are:\n");
        for b in AllBlocks(G) do Print(Orbit(G,b,OnSets), "\n"); od;
        Gens:=[[1,4],[3,6]];
    elif i=5 then
        G:=Group([(9,10)(11,12)(5,6)(7,8), (3,7,12)(9,1,6)(11,4,8)(5,10,2), (3,2)(9,11)(5,7)(1,4)(10,12)(6,8)]);
        name:="C2xA4";
        Print("\n The congruences of the group, ", StructureDescription(G), ", are:\n");
        for b in AllBlocks(G) do Print(Orbit(G,b,OnSets), "\n"); od;
        #[ [ 1, 2 ], [ 5, 6 ], [ 3, 4 ], [ 9, 10 ], [ 7, 8 ], [ 11, 12 ] ]
        #[ [ 1, 2, 3, 4 ], [ 5, 6, 7, 8 ], [ 9, 10, 11, 12 ] ]              <--- non-principal coatom
        #[ [ 1, 2, 5, 6, 9, 10 ], [ 3, 4, 7, 8, 11, 12 ] ]
        #[ [ 1, 3 ], [ 6, 7 ], [ 2, 4 ], [ 5, 8 ], [ 9, 12 ], [ 10, 11 ] ]
        #[ [ 1, 4 ], [ 6, 8 ], [ 5, 7 ], [ 9, 11 ], [ 10, 12 ], [ 2, 3 ] ]
        Gens:=[[1,4],[9,12]];
    elif i=6 then
        G:=Group([(9,10)(11,12)(5,6)(7,8), (3,7,12)(9,1,6)(11,4,8)(5,10,2), (3,2)(9,11)(5,7)(1,4)(10,12)(6,8)]);
        name:="C2xA4";
        Print("\n The congruences of the group, ", StructureDescription(G), ", are:\n");
        for b in AllBlocks(G) do Print(Orbit(G,b,OnSets), "\n"); od;
        #[ [ 1, 2 ], [ 5, 6 ], [ 3, 4 ], [ 9, 10 ], [ 7, 8 ], [ 11, 12 ] ]
        #[ [ 1, 2, 3, 4 ], [ 5, 6, 7, 8 ], [ 9, 10, 11, 12 ] ]              <--- non-principal coatom
        #[ [ 1, 2, 5, 6, 9, 10 ], [ 3, 4, 7, 8, 11, 12 ] ]
        #[ [ 1, 3 ], [ 6, 7 ], [ 2, 4 ], [ 5, 8 ], [ 9, 12 ], [ 10, 11 ] ]
        #[ [ 1, 4 ], [ 6, 8 ], [ 5, 7 ], [ 9, 11 ], [ 10, 12 ], [ 2, 3 ] ]
        Gens:=[[1,5]];
    else
        Error("Usage: TIKI3(i); argument i must be 1,...,6."); 
    fi;
    TIKI3([G, Gens, name]);
end;
