# File: RabbitEars.g
# Author: William DeMeo
# Date: 2011.05.24
# Updated: 2011.06.04
#
# Description: GAP routine for doing Rabbit Ears analysis on a given action group.
#
# Send questions, comments, suggestions to williamdemeo@gmail.com
#

G1Rabbit:=function(args)
    # G1Rabbit:=function([G, [b1, b2,...], algebraname, EXTRAOPS])
    #
    # This function takes a transitive permutation group G acting on the set of moved points B0
    # and, for each bk in [b1, b2, ...], constructs a set BB[k], which has the single point 
    # bk in common with B0.  Then operations on the union A = B0 \cup BB[1] \cup BB[2] \cup ...
    # are defined to create an algebra on A, which is stored in a uacalc file named 
    # G1Rabbit-algebraname-b1-b2-....ua.  Also, the original G-set algebra is stored in the same file
    # and called algebraname. (This can be turned off by setting the variable STORE_GSET:=false below.)
    #
    # Input   G              a transitive group on the set of moved points B0 = {1, 2, ..., N}
    #         [b1, b2, ...]  "tie-points" -- distinct points among the moved points of G;  bk = B0 \cap BB[k]
    #         algebraname    (optional, default=StructureDescription(G)) a string, used to name the uacalc algebra.
    #         EXTRAOPS       (optional, default=false) if true, add operations 
    #                        p_{g(k)} g p0 (x in BB[k]) for each g in setwise stabilizer of [b1, b2, ...].
    #
    # Output  G1Rabbit-algebraname-b1-b2-....ua  A uacalc file which stores the original G-set algebra, called
    #                                      algebraname, as well as the G1Rabbit-algebra <A, F> where A is the set 
    #                                      A = B0 \cup BB[1] \cup BB[2] \cup ... where 
    #                                            |B0| = |BB[1]| = |BB[2]| = ...,
    #                                            B0\cap BB[1] = {b1}, B0\cap BB[2] = {b2}, ...
    #                                            BB[i]\cap BB[j] = { }, unless i=j
    #                                      F is the set of maps:
    #                                            p0[k] maps A onto BB[k]
    #                                            s maps BB[k] onto bk and is the identity on B0
    #                                                      { g(c),  if c in B0
    #                                            gbar(c) = { (p1 g p0)(c), if c in B1
    #                                                      { (p2 g p0)(c), if c in B2
    #    
    #
    # Author: williamdemeo@gmail.com
    # Date: 2011.05.26
    # Updated: 2011.06.04
    
    local B0, BB, p0, s, gn, gensB, gensA, nargin, G, pathname, filename, outfile, N, opcount, g, k, z, x, pos, i, j, EXTRAOPS, XO, flag,
          b, axes, naxes, axstring, aboveax, VERBOSE, sizeA,algebraname, newops, genprod, uacalcpath, uacalcfile, STORE_GSET, e, numalgebras;
    
    ### Variables you can change to your liking:
    #
    #uacalcpath := "/home/williamdemeo/Dropbox/ClosureCore/UACalcFiles/"; # <<< ATTENTION! This is where uacalc file is stored.
    uacalcpath := "/tmp/G1Rabbits/"; # <<< ATTENTION! This is where uacalc file is stored.    
    VERBOSE:=true;         # Set this to false to supress extra command-line output.
    STORE_GSET:=true;      # Set this to false if you don't want the original G-set also stored in the uacalc file.
    #
    ###
    
    nargin := Length(args);
    if VERBOSE then
        Print("G1Rabbit called with the following arguments: \n");
        for k in [1..nargin] do
            Print("args[",k,"] = ", args[k], "\n");
        od;
    fi;
    if nargin < 1 then 
        Error("Usage: G1Rabbit([G, [b1, b2, ...], ...]);");
    else
        G:=args[1]; 
    fi;
    
    if nargin < 4 then EXTRAOPS:=false; XO:=false; else EXTRAOPS:=args[4]; XO:=args[4]; fi;
    if nargin < 3 then algebraname:=StructureDescription(G); else algebraname:=args[3]; fi;
    if nargin < 2 then Error("Usage: G1Rabbit([G, [b1, b2, ...], ...);"); else axes:=args[2]; fi;
    
    naxes:=Length(axes);
    if not IsTransitive(G) then
        Error("Usage: G1Rabbit([G, [b1, b2, ...], ...);  G must be a transitive group.");
    fi;
    
    
    axstring:=Concatenation("G1Rabbit-", algebraname);
    for k in [1..naxes] do
        axstring:= Concatenation(axstring, "-", String(axes[k]-1));
    od;
    if XO then
        filename := Concatenation(uacalcpath, axstring, "-XO.ua");
    else
        filename := Concatenation(uacalcpath, axstring, ".ua");
    fi;
        

    Print("uacalc file: ", filename, "\n");
    uacalcfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(uacalcfile, false);   # prevents automatic indentation and line breaks.

    N:=NrMovedPoints(G);
    
    if VERBOSE then
        Print("axes = ", axes, "\n");
    fi;
    
    sizeA:= N+naxes*(N-1);
    B0:=[1..N];
    BB:=[];
    p0:=[];
    aboveax:=[];
    for k in [1..naxes] do
        Add(BB, [1..N]);
        Add(aboveax, 0);
        Add(p0, ());
    od;
    for b in B0 do
        for k in [1..naxes] do
            BB[k][b]:=b+(k*N)-(k-1)-aboveax[k];
        od;
        if b in axes then
            pos:=Position(axes, b);
            aboveax[pos]:=1;
            BB[pos][b]:=b;
        fi;
    od;
    if VERBOSE then
        Print("B0 = ", B0-0, "\n");
        for k in [1..naxes] do
            Print("B", k, " = ", BB[k], "\n");
        od;
    fi;
    
    ### Construct the p0i's
    # Note: p0[k] maps B0 bijectively onto BB[k].
    # p0[k] is a permutation; e.g. p0[1]=(b1,b1')(b2,b2')...(bn,bn')
    # so you can apply it to any element x of A as follows:
    #  x^p0[k] will leave x fixed if x is not in B0 or BB[k]
    #          otherwise it will map x to the corresponding element of B0 or BB[k] 
    for b in B0 do
        for k in [1..naxes] do
            if b in axes then
                pos:=Position(axes, b);
                if k<>pos then
                    p0[k]:=p0[k]*(b,BB[k][b]); 
                fi;
            else
                p0[k]:=p0[k]*(b,BB[k][b]); 
            fi;
        od;
    od;        
    if VERBOSE then
        for k in [1..naxes] do
            Print("p0[", k, "] = ", p0[k], "\n");
        od;
    fi;
    
    ### Construct s  (maps BB[k] onto the kth axis, leaves B0 fixed)
    s:=[1..sizeA];
    for z in [1..sizeA] do
        for k in [1..naxes] do
            if z in BB[k] then
                s[z]:=axes[k]; 
                break;
            fi;
        od;
    od;
    if VERBOSE then Print("s = ", s, "\n");  fi;
    
    # now write the uacalc file
    PrintTo(uacalcfile, "<?xml version=\"1.0\"?>\n");
    
    if STORE_GSET or XO then   # there will be multiple algebras in the resulting uacalc file
        AppendTo(uacalcfile, "<algebraList>\n");
    fi;
    
    ### First put the original G-set algebra in the uacalc file 
    if STORE_GSET then
        AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>", algebraname, "</algName>\n");
        AppendTo(uacalcfile, "<desc>The permutational algebra (", MovedPoints(G)-1, ", ", StructureDescription(G), ") (generated by G1Rabbit).</desc>\n");
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
    
    if XO then
        numalgebras:=2;   # Write 2 more algebras to the file, the 2nd with extra ops.
    else
        numalgebras:=1;   # Write just the one algebra (no extra ops)
    fi;
    
    for i in [1..numalgebras] do
        if i=2 then
            AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>", axstring,"-XO</algName>\n");
            AppendTo(uacalcfile, "<desc>Freesean rabbit on ", algebraname, " using points ", axes-1, " plus extra operations.</desc>\n");
        else
            AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>", axstring,"</algName>\n");
            AppendTo(uacalcfile, "<desc>Freesean rabbit on ", algebraname, " using points ", axes-1, ".</desc>\n");
        fi;
        AppendTo(uacalcfile, "<cardinality>", sizeA, "</cardinality>\n");
        AppendTo(uacalcfile, "<operations>\n");
    
        ## p0 ##
        AppendTo(uacalcfile, "<op>\n<opSymbol><opName>p0</opName>\n");
        AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
        for z in [1..sizeA] do
            if z in B0 then
                AppendTo(uacalcfile, z-1, ",");  #  (this leaves extra comma in op definition -- hope that's ok)
            else
                for k in [1..naxes] do
                    if z in BB[k] then
                        AppendTo(uacalcfile, (z^p0[k])-1, ",");
                        break;
                    fi;
                od;
            fi;
        od;
        AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
        
        ## p0[k] ## 
        for k in [1..naxes] do
            AppendTo(uacalcfile, "<op>\n<opSymbol><opName>p", k, "</opName>\n");
            AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
            for z in [1..sizeA] do
                if z in B0 then
                    AppendTo(uacalcfile, z^p0[k]-1, ",");
                else
                    for j in [1..naxes] do
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
    
        AppendTo(uacalcfile, "<op>\n<opSymbol><opName>s</opName>\n");
        AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
        AppendTo(uacalcfile, s[1]-1);
        for z in [2..sizeA] do AppendTo(uacalcfile, ",", s[z]-1); od;
        AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
    
        opcount:=0;
        # now construct the operations g p_0, one for each generator g of G.
        for g in GeneratorsOfGroup(G) do
            AppendTo(uacalcfile, "<op>\n<opSymbol><opName>g", opcount, "</opName>\n");
            AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
            for z in [1..sizeA] do
                if z in B0 then
                    AppendTo(uacalcfile, z^g-1,",");
                else
                    for k in [1..naxes] do
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
        
        # extra operations (only write these on the second pass)        
        if i=2 then
            opcount:=1;
            for g in Elements(G) do
                if g=() then
                    # do nothing
                else
                    flag:=1;
                    # check if g stabilizes the set of axes
                    for b in axes do
                        if b^g in axes then
                        else
                            flag:=0;
                            break;
                        fi;
                    od;
                    if flag=1 then
                        if VERBOSE then Print("Stab(axes) element g = ", g, "\n");  fi;
                        AppendTo(uacalcfile, "<op>\n<opSymbol><opName>g^pi_", opcount, "</opName>\n");
                        AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
                        if VERBOSE then  Print("g^pi_", opcount, "="); fi;
                        for z in [1..sizeA] do
                            if z in B0 then
                                AppendTo(uacalcfile, z^g-1,",");
                                if VERBOSE then  Print(z^g-1,","); fi;
                            else
                                for k in [1..naxes] do
                                    if z in BB[k] then
                                        # find out to which axis g moves kth axis
                                        b := axes[k]^g;
                                        pos:=Position(axes, b);
                                        AppendTo(uacalcfile,(((z^p0[k])^g)^p0[pos])-1, ","); 
                                        if VERBOSE then Print((((z^p0[k])^g)^p0[pos])-1,","); fi;
                                        break;
                                    fi;
                                od;
                            fi;
                        od;
                        AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
                        if VERBOSE then Print("\n"); fi;
                        opcount:=opcount+1;
                    fi;
                fi;
            od;
        fi;
        AppendTo(uacalcfile, "</operations>\n</basicAlgebra>\n</algebra>\n");
    od;
    if STORE_GSET or XO then
        AppendTo(uacalcfile, "</algebraList>\n");
    fi;
    
end;


G1RabbitDemo:=function(i)
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
        Gens:=[1,3];
    elif i=2 then
        Print("\n The congruences of the group, ", StructureDescription(G), ", are:\n");
        for b in AllBlocks(G) do Print(Orbit(G,b,OnSets), "\n"); od;
        Gens:=[1,3,4,6];
    elif i=3 then
        G:=Group([(9,10)(11,12)(5,6)(7,8), (3,7,12)(9,1,6)(11,4,8)(5,10,2), (3,2)(9,11)(5,7)(1,4)(10,12)(6,8)]);
        name:="C2xA4";
        Print("\n The congruences of the group, ", StructureDescription(G), ", are:\n");
        for b in AllBlocks(G) do Print(Orbit(G,b,OnSets), "\n"); od;
        #[ [ 1, 2 ], [ 5, 6 ], [ 3, 4 ], [ 9, 10 ], [ 7, 8 ], [ 11, 12 ] ]
        #[ [ 1, 2, 3, 4 ], [ 5, 6, 7, 8 ], [ 9, 10, 11, 12 ] ]              <--- non-principal coatom
        #[ [ 1, 2, 5, 6, 9, 10 ], [ 3, 4, 7, 8, 11, 12 ] ]
        #[ [ 1, 3 ], [ 6, 7 ], [ 2, 4 ], [ 5, 8 ], [ 9, 12 ], [ 10, 11 ] ]
        #[ [ 1, 4 ], [ 6, 8 ], [ 5, 7 ], [ 9, 11 ], [ 10, 12 ], [ 2, 3 ] ]
        Gens:=[1,4];
    else
        Error("Usage: G1RabbitDemo(i); argument i must be 1, 2, or 3."); 
    fi;
    G1Rabbit([G, Gens, name]);
end;
    


###############################################################################################
#   Below is the old RabbitEars function which only works for two intersection points.
#   It is made redundant by the function above which can also handle two intersection points.
#   The only reason you might still want to use RabbitEars is because it also creates a 
#   Matlab/octave file which you can use to experiment with the algebra 
#   e.g. to search for functions which voilate various congruences.
RabbitEars:=function(args)
    # RabbitEars:=function([G, x, y, algebraname, OneOffset])
    #    
    # Input: G            The action group created in GAP, 
    #                     for example, like this:
    #                     G := Action( K, RightCosets(K,H), OnRight );
    #
    #        [x, y]       The generators of alpha=Cg(x,y)
    #        OneOffset (optional, default=1) if 0, output will be 0-offset (this doesn't work yet)
    #
    # Author: williamdemeo@gmail.com
    # Date: 2011.05.24
    
    local B0, B1, B2, p0, p1, p2, s, gn, gensB, gensA, nargin, G, pathname, filename, outfile, N, opcount, g, k,
          x, y, abovex, abovey, b, VERBOSE, sizeA,algebraname, newops, OneOffset, ZeroOffset, genprod;
    VERBOSE:=true;
    
    nargin := Length(args);
    
    if nargin < 1 then 
        Error("Usage: RabbitEars([G, x, y, ...]);");
    else
        G:=args[1]; 
    fi;
    
    if nargin < 5 then OneOffset:=1; else OneOffset:=args[5]; fi;
    if nargin < 4 then algebraname:=StructureDescription(G); else algebraname:=args[4]; fi;
    if nargin < 3 then Error("Usage: RabbitEars([G, x, y, ...]);"); else x:=args[2]; y:=args[3]; fi;
    ZeroOffset:=1-OneOffset;
    
    if not IsTransitive(G) then
        Error("Usage: RabbitEars([G, x, y, ...]);  G must be a transitive group.");
    fi;
    
    pathname := "/home/williamdemeo/pub/research/LatticeTheory/DeMeo/ResearchNotes/RabbitEars/mfiles/"; # <<< ATTENTION! You should edit this variable.
    filename := Concatenation(pathname, "REars", algebraname, ".m");
    Print("output file: ", filename, "\n");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    PrintTo(outfile, "REops=[");

    N:=NrMovedPoints(G);
    sizeA:=3*N-2;
    p0:=[1..sizeA];    p1:=[1..sizeA];    p2:=[1..sizeA];
    B0:=[1..N];    B1:=[1..N];    B2:=[1..N];
    abovex:=0;    abovey:=0;
    for b in B0 do
        p0[b+N-abovex]:=b; p0[b+2*N-1-abovey]:=b; 
        B1[b]:=b+N-abovex;
        p1[b]:=b+N-abovex;  p1[b+2*N-1-abovey]:=b+N-abovex; 
        B2[b]:=b+2*N-1-abovey;
        p2[b]:=b+2*N-1-abovey; p2[b+N-abovex]:=b+2*N-1-abovey;
        if b=x then
            abovex:=1;
            p1[b]:=b;  p1[b+2*N-1-abovey]:=b; 
            B1[b]:=b;
        elif b=y then
            abovey:=1;
            p2[b]:=b;  p2[b+N-abovex]:=b;
            B2[b]:=b;
        fi;
    od;
    for k in [1..sizeA] do AppendTo(outfile, p0[k]-ZeroOffset, " "); od;
    AppendTo(outfile,";\n");
    for k in [1..sizeA] do AppendTo(outfile, p1[k]-ZeroOffset, " "); od;
    AppendTo(outfile,";\n");
    for k in [1..sizeA] do AppendTo(outfile, p2[k]-ZeroOffset, " "); od;
    AppendTo(outfile,";\n");
    s:=[1..sizeA];
    for k in B1 do s[k]:=x; od;
    for k in B2 do s[k]:=y; od;
    for k in [1..sizeA] do AppendTo(outfile, s[k]-ZeroOffset, " "); od;
    
    if VERBOSE then
        Print("B0 = ", B0-0, "\n");  Print("B1 = ", B1, "\n");   Print("B2 = ", B2, "\n");        
        Print("p0 = ", p0, "\n");  Print("p1 = ", p1, "\n");   Print("p2 = ", p2, "\n");        
        Print("s = ", s, "\n"); 
        Print("\n ------------ 0-offset: \n");
        Print("B0 = ", B0-1, "\n");  Print("B1 = ", B1-1, "\n");   Print("B2 = ", B2-1, "\n");        
        Print("p0 = ", p0-1, "\n");  Print("p1 = ", p1-1, "\n");   Print("p2 = ", p2-1, "\n");        
        Print("s = ", s-1, "\n");
    fi;
    
    if VERBOSE then 
        
        gensB:=GeneratorsOfGroup(G);
        gensA:=[];
        for g in gensB do
            gn:=[];
            AppendTo(outfile, ";\n");
            for x in [1..sizeA] do
                gn[x]:= p0[x]^g;
                AppendTo(outfile, gn[x]-ZeroOffset, " ");
            od;
            Add(gensA, gn);
        od;
        AppendTo(outfile, "];\n");
        
        # Now we suggest some possible new operations that might get rid of partitions
        # inside the BA, so we can quickly check which work in various examples.
        newops:=[];
        Print("\nPossible New Operations: \n");
        AppendTo(outfile, "\n% Possible New Operations: \n");
        AppendTo(outfile, "% 1. g(x) if x in B0;  p1 g p0(x) if x in B1,  p2 g p0(x) if x in B2\n");
        for k in [1..Length(gensB)] do
            g:=gensB[k];
            gn:=[];
            for x in B1 do
                gn[x]:=p1[p0[x]^g];
            od;
            for x in B2 do
                gn[x]:=p2[p0[x]^g];
            od;
            for x in B0 do
                gn[x]:= x^g;
            od;
            AppendTo(outfile, "%   f1[", g, "] = ", gn-ZeroOffset, "\n");
            Print("f1[", g, "] = ", gn-ZeroOffset, "\n");
            Add(newops, gn);
        od;
        AppendTo(outfile, "%\n% 2. g(x) if x in B0;  p2 g p0(x) if x in B1,  p1 g p0(x) if x in B2\n");
        for k in [1..Length(gensB)] do
            g:=gensB[k];
            gn:=[];
            for x in B1 do
                gn[x]:=p2[p0[x]^g];
            od;
            for x in B2 do
                gn[x]:=p1[p0[x]^g];
            od;
            for x in B0 do
                gn[x]:= x^g;
            od;
            AppendTo(outfile, "%   f2[", g, "] = ", gn-ZeroOffset, "\n");
            Print("f2[", g, "] = ", gn-ZeroOffset, "\n");
            Add(newops, gn);
        od;
        
        genprod:=[gensB[1]*gensB[2], gensB[2]*gensB[1]];
        AppendTo(outfile, "%\n% 3. (g=g1g2 or g2g1) g(x) if x in B0;  p1 g p0(x) if x in B1,  p2 g p0(x) if x in B2\n");
        for k in [1..Length(genprod)] do
            g:=genprod[k];
            gn:=[];
            for x in B1 do
                gn[x]:=p1[p0[x]^g];
            od;
            for x in B2 do
                gn[x]:=p2[p0[x]^g];
            od;
            for x in B0 do
                gn[x]:= x^g;
            od;
            AppendTo(outfile, "%   f3[", g, "] = ", gn-ZeroOffset, "\n");
            Print("f4[", g, "] = ", gn-ZeroOffset, "\n");
            Add(newops, gn);
        od;
        AppendTo(outfile, "%\n% 4. (g=g1g2 or g2g1) g(x) if x in B0;  p2 g p0(x) if x in B1,  p1 g p0(x) if x in B2\n");
        for k in [1..Length(genprod)] do
            g:=genprod[k];
            gn:=[];
            for x in B1 do
                gn[x]:=p2[p0[x]^g];
            od;
            for x in B2 do
                gn[x]:=p1[p0[x]^g];
            od;
            for x in B0 do
                gn[x]:= x^g;
            od;
            AppendTo(outfile, "%   f4[", g, "] = ", gn-ZeroOffset, "\n");
            Print("f3[", g, "] = ", gn-ZeroOffset, "\n");
            Add(newops, gn);
        od;
        
        AppendTo(outfile, "\n% B0= ", B0-0);
        AppendTo(outfile, "\n% B1= ", B1);
        AppendTo(outfile, "\n% B2= ", B2, "\n");
        AppendTo(outfile, "\nN=size(REops,2);\n");
        AppendTo(outfile, "\nr=[]; h=[]; \n rho = Rho(h, r, REops-1, 100);\n");
        AppendTo(outfile, "\n% with full BA");
        AppendTo(outfile, "\nCon=displayRho(rho);");
        AppendTo(outfile, "\n[lambda, rho] = displayClosure(Con, N, 100, 50000, 0);");

        AppendTo(outfile, "\n% With only top and bottom of BA:");
        AppendTo(outfile, "\ngens=[Con(2,:); Con(5:8,:)];  % <<<=== adjust this as appropriate. ");
        AppendTo(outfile, "\n[lambda2, rho] = displayClosure(gens, N, 100, 50000, 0);");
        AppendTo(outfile, "\nF = getNewOperations(lambda, lambda2);  ");
        AppendTo(outfile, "\ndisp('New operations:');");
        AppendTo(outfile, "\n[0:N-1; F]");
        AppendTo(outfile, "\nfor i=1:size(F,1),");
        AppendTo(outfile, "\n  disp(sprintf('%s', Function2perm(F(i,:))));");
        AppendTo(outfile, "\nend;");
        AppendTo(outfile, "\ndisp('In GAP notation:');");
        AppendTo(outfile, "\n[1:N; F+1]");
        AppendTo(outfile, "\nfor i=1:size(F,1),");
        AppendTo(outfile, "\n  disp(sprintf('%s', Function2GAPperm(F(i,:))));");
        AppendTo(outfile, "\nend;\n");
    fi;
end;

