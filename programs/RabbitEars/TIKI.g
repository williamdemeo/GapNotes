# File: RabbitEarsExperimental.g
# Author: William DeMeo
# Date: 2011.10.17
# Updated: 2011.10.17
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



TIKI:=function(args)
    # TIKI:=function([G, [[a1,b1,...,c1], [a2,b2,...,c2], ...],  algebraname])
    # This should blow up the congruence Cg((a1,b1,...,b2), (a2,b2,...,c2),...) and no others.
    # Author: williamdemeo@gmail.com
    # Date: 2011.10.18
    # Updated: 2011.10.18
    
    local B0, BB, p0, s, s1, s2, q0, q1, gn, gensB, gensA, nargin, G, pathname, filename, outfile, N, m, opcount, g, k, z, x, pos, 
          i, j, flag, opname, b, axes, Axes, naxes, ngens, genlen, axstring, aboveax, VERBOSE, sizeA,algebraname, newops, genprod, 
          uacalcpath, uacalcfile, STORE_GSET, e, numalgebras;
    
    ### Variables you can change to your liking:
    #
    uacalcpath := "/tmp/REX/"; # <<< ATTENTION! This is where uacalc file is stored.
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
        Error("Usage: TIKI([G, [[a1,b1,...,c1], [a2,b2,...,c2], ...],  algebraname]);");
    else
        G:=args[1]; 
    fi;
    
    if nargin < 3 then algebraname:=StructureDescription(G); else algebraname:=args[3]; fi;
    #if nargin < 3 then M:=1; else M:=args[3]; fi;
    if nargin < 2 then 
        Error("Usage: TIKI([G, [[a1,b1,...,c1], [a2,b2,...,c2], ...],  algebraname])"); 
    else 
        Axes:=args[2];   # The generators, or axes, as a list of lists: [[a1,b1,...,c1], [a2,b2,...,c2], ...]
    fi;
    
    ngens:=Length(Axes);
    genlen:=[1..ngens];
    axes:=[];    # List of all axes (or tie-points): [a1, b1, ..., c1, a2, b2, ...] = all elements appearing in generators (with repeats)
    for g in [1..ngens] do
        genlen[g]:=Length(Axes[g]);   # number of elements (axes) in the gth generator.
        Append(axes, Axes[g]);
    od;
    naxes:=Sum(genlen);  # the total number of axes (or tie-points)
    
    if not IsTransitive(G) then
        Error("Usage: TIKI([G, [[a1,b1,...,c1], [a2,b2,...,c2], ...],  algebraname]); G must be a transitive group."); 
    fi;
    
    axstring:=Concatenation("TIKI_", algebraname);
    axstring:=Concatenation(axstring, "_");
    
    for g in [1..ngens] do
        for k in [1..genlen[g]] do
            axstring:= Concatenation(axstring, String( Axes[g][k] - 1 ));
            if k<>genlen[g] then axstring:= Concatenation(axstring, "-"); fi;
        od;
        if g<>ngens then axstring:= Concatenation(axstring, "_"); fi;
    od;
    #if M>1 then axstring:= Concatenation(axstring, "-M", String(M)); fi;
    
    filename := Concatenation(uacalcpath, axstring, ".ua");

    Print("uacalc file: ", filename, "\n");
    uacalcfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(uacalcfile, false);   # prevents automatic indentation and line breaks.

    N:=NrMovedPoints(G);
    
    if VERBOSE then
        Print("axes = ", axes, "\n");
    fi;
    
    #sizeA:= N+naxes*M*(N-1);
    sizeA:= N+naxes*(N-1);
    B0:=[1..N];
    BB:=[];
    p0:=[];
    aboveax:=[];
    for k in [1..naxes] do
        Add(aboveax, 0);
        #for m in [1..M] do
        Add(BB, [1..N]);
        Add(p0, ());
        #od;
    od;
    
    for b in B0 do
        for k in [1..naxes] do
            BB[k][b]:=b+(k*N)-(k-1)-aboveax[k];
            #for m in [0..M-1] do  BB[m*naxes+k][b]:=m*naxes*(N-1) + b+(k*N)-(k-1)-aboveax[k];  od;
        od;
        if b in axes then
            pos:=Position(axes, b);
            aboveax[pos]:=1;
            #for m in [0..M-1] do BB[m*naxes+pos][b]:=b; od;
            BB[pos][b]:=b;
        fi;
    od;
    
    if VERBOSE then
        Print("B0 = ", B0-0, "\n");
        #        for m in [0..M-1] do
        for k in [1..naxes] do
            #Print("B", m*naxes+k, " = ", BB[m*naxes+k], "\n");
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
                    #for m in [0..(M-1)] do
                    #    p0[m*naxes+k]:=p0[m*naxes+k]*(b,BB[m*naxes+k][b]); 
                    #od;
                fi;
            else
                p0[k]:=p0[k]*(b,BB[k][b]); 
                #for m in [0..(M-1)] do
                #    p0[m*naxes+k]:=p0[m*naxes+k]*(b,BB[m*naxes+k][b]); 
                #od;
            fi;
        od;
    od;        
    
    if VERBOSE then
        for k in [1..naxes] do
            Print("p0[", k, "] = ", p0[k], "\n");
        od;
        # for m in [0..(M-1)] do
        #     for k in [1..naxes] do
        #         Print("p0[", m*naxes+k, "] = ", p0[m*naxes+k], "\n");
        #     od;
        # od;
    fi;
    
    ### Construct s[g]  (for all b in Axes[g], maps BB[pos(b)] onto Axes[g][pos(b)], leaves other b's unchanged)
    s:=[];
    for g in [1..ngens] do
        s[g]:=[1..sizeA];
    od;
    for g in [1..ngens] do
        for z in [1..sizeA] do
            for k in [1..genlen[g]] do
                pos:=Position(axes,Axes[g][k]);
                if (z in BB[pos]) then
                    s[g][z]:=Axes[g][k];
                    break;
                fi;
            od;
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
    AppendTo(uacalcfile, "<desc>Rabbit-ears on ", algebraname, " using points ", axes-1, ".</desc>\n");
    
    AppendTo(uacalcfile, "<cardinality>", sizeA, "</cardinality>\n");
    AppendTo(uacalcfile, "<operations>\n");
    
    ## p0 ## maps everything in A to B0
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
            # for k in [1..M*naxes] do
            #     if z in BB[k] then
            #         AppendTo(uacalcfile, (z^p0[k])-1, ",");
            #         break;
            #     fi;
            # od;
        fi;
    od;
    AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
    
    ## p0[k] ## 
    # Note carefully what we're doing here.  We're not simply writing the p0 as defined above
    # to the uacalc file.  Rather, we're taking any b not in B0 or BB[k] and mapping it first to
    # B0, then mapping it from B0 to BB[k].  So the resulting map "pk" maps all of A onto BB[k].
    
    #for k in [1..M*naxes] do
    for k in [1..naxes] do
        AppendTo(uacalcfile, "<op>\n<opSymbol><opName>p", k, "</opName>\n");
        AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
        for z in [1..sizeA] do
            if z in B0 then
                AppendTo(uacalcfile, z^p0[k]-1, ",");
            else
                #for j in [1..M*naxes] do
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
    
    #for m in [1..M] do
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
                #for k in [1..M*naxes] do
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
    
    AppendTo(uacalcfile, "</operations>\n</basicAlgebra>\n</algebra>\n");

    if STORE_GSET then
        AppendTo(uacalcfile, "</algebraList>\n");
    fi;

    
end;


