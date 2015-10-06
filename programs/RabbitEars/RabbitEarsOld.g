# File: RabbitEars.g
# Author: William DeMeo
# Date: 2011.05.24
#
# Description: GAP routine for doing Rabbit Ears analysis on a given action group.
#
# Send questions, comments, suggestions to williamdemeo@gmail.com
#
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
        AppendTo(outfile, "\n[1:N; F+1]");
        AppendTo(outfile, "\nfor i=1:size(F,1),");
        AppendTo(outfile, "\n  disp(sprintf('%s', Function2perm(F(i,:))));");
        AppendTo(outfile, "\nend;");
        AppendTo(outfile, "\ndisp('In GAP notation:');");
        AppendTo(outfile, "\nfor i=1:size(F,1),");
        AppendTo(outfile, "\n  disp(sprintf('%s', Function2GAPperm(F(i,:))));");
        AppendTo(outfile, "\nend;\n");
    fi;
end;


DoubleAxle:=function(args)
    # DoubleAxle:=function([G, b1, b2, algebraname])
    # Input   G        a transitive group on the set of moved points B0 = {1, 2, ..., N}
    #         b1, b2   two distinct points which must be among the moved points of G
    #
    # Output  algebraname.ua  A uacalc (resp. matlab) file algebraname.ua defining the algebra <A, F> 
    #         (algebraname.m) where A is the set B0 \cup B1 \cup B2 where 
    #                         |B1| = |B2| = |B0|,
    #                         B0\cap B1 = {b1},
    #                         B0\cap B2 = {b2},
    #                         B1\cap B2 = { },
    #                         F is the set of maps {gbar : g \in G} defined by
    #                                   { g(c),  if c in B0
    #                         gbar(c) = { (p1 g p0)(c), if c in B1
    #                                   { (p2 g p0)(c), if c in B2
    #    
    #
    # Author: williamdemeo@gmail.com
    # Date: 2011.05.25
    
    local B0, B1, B2, p0, p1, p2, s, gn, gensB, gensA, nargin, G, pathname, filename, outfile, N, opcount, g, k, z,
          x, y, abovex, abovey, b, VERBOSE, sizeA,algebraname, newops, OneOffset, ZeroOffset, genprod, uacalcpath, uacalcfile;
    VERBOSE:=true;
    
    nargin := Length(args);
    
    if nargin < 1 then 
        Error("Usage: DoubleAxle([G, x, y, ...]);");
    else
        G:=args[1]; 
    fi;
    
    OneOffset:=1;
    ZeroOffset:=1-OneOffset;
    
    if nargin < 4 then algebraname:=StructureDescription(G); else algebraname:=args[4]; fi;
    if nargin < 3 then Error("Usage: DoubleAxle([G, x, y, ...]);"); else x:=args[2]; y:=args[3]; fi;
    
    if not IsTransitive(G) then
        Error("Usage: DoubleAxle([G, x, y, ...]);  G must be a transitive group.");
    fi;
    
    pathname := "/home/williamdemeo/pub/research/LatticeTheory/DeMeo/Octave/OctLatCore/"; # <<< ATTENTION! You should edit this variable.
    uacalcpath := "/home/williamdemeo/Dropbox/ClosureCore/UACalcFiles/"; # <<< ATTENTION! You should edit this variable.
    filename := Concatenation(pathname, "DA", algebraname, ".m");
    Print("output file: ", filename, "\n");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    filename := Concatenation(uacalcpath, "DA-", algebraname, "-", String(x), "-", String(y), ".ua");
    Print("uacalc file: ", filename, "\n");
    uacalcfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(uacalcfile, false);   # This prevents automatic indentation and line breaks.

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
    Print("B0 = ", B0, "\n");
    Print("B1 = ", B1, "\n");
    Print("B2 = ", B2, "\n");
    PrintTo(outfile, "% B0 = ", B0, "\n");
    AppendTo(outfile, "% B1 = ", B1, "\n");
    AppendTo(outfile, "% B2 = ", B2, "\n");
    AppendTo(outfile, "\nDAops=[");
    
    AppendTo(uacalcfile, "<?xml version=\"1.0\"?>\n");
    AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>DA-", algebraname, "</algName>\n");
    AppendTo(uacalcfile, "<cardinality>", sizeA, "</cardinality>\n");
    AppendTo(uacalcfile, "<operations>\n");
    opcount:=0;
    for g in GeneratorsOfGroup(G) do
        #    for g in Elements(G) do
        AppendTo(uacalcfile, "<op>\n<opSymbol><opName>g", opcount, "</opName>\n");
        AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
        AppendTo(uacalcfile, 1^g-1);
        AppendTo(outfile, 1^g-1);
        for z in [2..sizeA] do
            if z in B0 then
                AppendTo(uacalcfile, ",", z^g-1);
                AppendTo(outfile, " ", z^g-1);
            elif z in B1 then
                AppendTo(uacalcfile, ",", p1[p0[z]^g]-1);
                AppendTo(outfile, " ", p1[p0[z]^g]-1);
            elif z in B2 then
                AppendTo(uacalcfile, ",", p2[p0[z]^g]-1);
                AppendTo(outfile, " ", p2[p0[z]^g]-1);
            fi;
        od;
        AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
        AppendTo(outfile, ";\n");
        AppendTo(uacalcfile, "<op>\n<opSymbol><opName>f", opcount, "</opName>\n");
        AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
        AppendTo(uacalcfile, 0);
        AppendTo(outfile, 0);
        for z in [2..sizeA] do
            if z in B0 then
                AppendTo(uacalcfile, ",", z-1);
                AppendTo(outfile, " ", z-1);
            elif z in B1 then
                AppendTo(uacalcfile, ",", p1[p0[z]^g]-1);
                AppendTo(outfile, " ", p1[p0[z]^g]-1);
            elif z in B2 then
                AppendTo(uacalcfile, ",", p2[p0[z]^g]-1);
                AppendTo(outfile, " ", p2[p0[z]^g]-1);
            fi;
        od;
        AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
        AppendTo(outfile, ";\n");
        opcount:=opcount+1;
    od;
    s:=[1..sizeA];
    for k in B1 do s[k]:=x; od;
    for k in B2 do s[k]:=y; od;
    AppendTo(uacalcfile, "<op>\n<opSymbol><opName>s</opName>\n");
    AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
    AppendTo(uacalcfile, s[1]-1);
    for k in [2..sizeA] do AppendTo(uacalcfile, ",", s[k]-1); od;
    AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
    
    AppendTo(uacalcfile, "<op>\n<opSymbol><opName>p0</opName>\n");
    AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
    AppendTo(uacalcfile, p0[1]-1);
    for k in [2..sizeA] do AppendTo(uacalcfile, ",", p0[k]-1); od;
    AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
    
    AppendTo(uacalcfile, "<op>\n<opSymbol><opName>p1</opName>\n");
    AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
    AppendTo(uacalcfile, p1[1]-1);
    for k in [2..sizeA] do AppendTo(uacalcfile, ",", p1[k]-1); od;
    AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
    
    AppendTo(uacalcfile, "<op>\n<opSymbol><opName>p2</opName>\n");
    AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
    AppendTo(uacalcfile, p2[1]-1);
    for k in [2..sizeA] do AppendTo(uacalcfile, ",", p2[k]-1); od;
    AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");

    AppendTo(uacalcfile, "</operations>\n</basicAlgebra>\n</algebra>\n");
end;


Manifoil:=function(args)
    # Manifoil:=function([G, [b1, b2,...], algebraname, EXTRAOPS])
    # Input   G        a transitive group on the set of moved points B0 = {1, 2, ..., N}
    #         axes = [b1, b2, ...]  distinct points among the moved points of G
    #         EXTRAOPS  (optional, default=false) if true, add operations pi[k] g pi[k]^k.
    #
    # Output  algebraname.ua  A uacalc (resp. matlab) file algebraname.ua defining the algebra <A, F> 
    #         (algebraname.m) where A is the set B0 \cup B1 \cup B2 where 
    #                         |B1| = |B2| = |B0| = |B3| = |B4|,
    #                         B0\cap B1 = {b1},
    #                         B0\cap B2 = {b2},
    #                         B0\cap B3 = {b3},
    #                         B0\cap B4 = {b4},
    #                         B1\cap B2 = { },
    #                         F is the set of maps {gbar : g \in G} defined by
    #                                   { g(c),  if c in B0
    #                         gbar(c) = { (p1 g p0)(c), if c in B1
    #                                   { (p2 g p0)(c), if c in B2
    #    
    #
    # Author: williamdemeo@gmail.com
    # Date: 2011.05.26
    
    local B0, BB, p0, p01, p02, p03, p04, s, gn, gensB, gensA, nargin, G, pathname, filename, outfile, N, opcount, g, k, z, pos, j, EXTRAOPS,
          b, axes, naxes, axstring, aboveax, VERBOSE, sizeA,algebraname, newops, OneOffset, ZeroOffset, genprod, uacalcpath, uacalcfile;
    VERBOSE:=true;
    
    nargin := Length(args);
    for k in [1..nargin] do
        Print("args[",k,"] = ", args[k], "\n");
    od;
    if nargin < 1 then 
        Error("Usage: Manifoil([G, [b1, b2, ...], ...]);");
    else
        G:=args[1]; 
    fi;
    
    OneOffset:=1;
    ZeroOffset:=1-OneOffset;
    
    if nargin < 4 then EXTRAOPS:=false; else EXTRAOPS:=args[4]; fi;
    if nargin < 3 then algebraname:=StructureDescription(G); else algebraname:=args[3]; fi;
    if nargin < 2 then Error("Usage: Manifoil([G, [b1, b2, ...], ...);"); else axes:=args[2]; fi;
    
    naxes:=Length(axes);
    if not IsTransitive(G) then
        Error("Usage: Manifoil([G, [b1, b2, ...], ...);  G must be a transitive group.");
    fi;
    
    uacalcpath := "/home/williamdemeo/Dropbox/ClosureCore/UACalcFiles/"; # <<< ATTENTION! You should edit this variable.
    
    axstring:=Concatenation("MF-", algebraname);
    for k in [1..naxes] do
        axstring:= Concatenation(axstring, "-", String(axes[k]-1));
    od;
    if EXTRAOPS then
        axstring:= Concatenation(axstring, "-XO");
    fi;
        
    filename := Concatenation(uacalcpath, axstring, ".ua");

    Print("uacalc file: ", filename, "\n");
    uacalcfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(uacalcfile, false);   # This prevents automatic indentation and line breaks.

    N:=NrMovedPoints(G);
    
    Print("axes = ", axes, "\n");
    
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
    Print("B0 = ", B0-0, "\n");
    for k in [1..naxes] do
        Print("B", k, " = ", BB[k], "\n");
    od;
    
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
    for k in [1..naxes] do
        Print("p0[", k, "] = ", p0[k], "\n");
    od;
    
    AppendTo(uacalcfile, "<?xml version=\"1.0\"?>\n");
    AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>", axstring,"</algName>\n");
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
    
    # Construct s = contracts BB[k] onto the axis points, leaves B0 fixed.
    s:=[1..sizeA];
    for z in [1..sizeA] do
        for k in [1..naxes] do
            if z in BB[k] then
                s[z]:=axes[k]; 
                break;
            fi;
        od;
    od;
    Print("s = ", s, "\n");
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
    
    # Now (optionally) construct the ops p_j g p_0, one for each generator g of G.
    if EXTRAOPS then
        opcount:=0;
        for g in GeneratorsOfGroup(G) do
            AppendTo(uacalcfile, "<op>\n<opSymbol><opName>g^pi", opcount, "</opName>\n");
            AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
            for z in [1..sizeA] do
                if z in B0 then
                    AppendTo(uacalcfile, z^g-1,",");
                else
                    for k in [1..naxes] do
                        if z in BB[k] then
                            AppendTo(uacalcfile,((z^p0[k])^g)^p0[k]-1, ",");
                            break;
                        fi;
                    od;
                fi;
            od;
            AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
            opcount:=opcount+1;
        od;
    fi;
    AppendTo(uacalcfile, "</operations>\n</basicAlgebra>\n</algebra>\n");
    
end;




QuadAxle:=function(args)
    # QuadAxle:=function([G, b1, b2, b3, b4, algebraname])
    # Input   G        a transitive group on the set of moved points B0 = {1, 2, ..., N}
    #         bi       distinct points which must be among the moved points of G
    #
    # Output  algebraname.ua  A uacalc (resp. matlab) file algebraname.ua defining the algebra <A, F> 
    #         (algebraname.m) where A is the set B0 \cup B1 \cup B2 where 
    #                         |B1| = |B2| = |B0| = |B3| = |B4|,
    #                         B0\cap B1 = {b1},
    #                         B0\cap B2 = {b2},
    #                         B0\cap B3 = {b3},
    #                         B0\cap B4 = {b4},
    #                         B1\cap B2 = { },
    #                         F is the set of maps {gbar : g \in G} defined by
    #                                   { g(c),  if c in B0
    #                         gbar(c) = { (p1 g p0)(c), if c in B1
    #                                   { (p2 g p0)(c), if c in B2
    #    
    #
    # Author: williamdemeo@gmail.com
    # Date: 2011.05.26
    
    local B0, B1, B2, B3, B4, p01, p02, p03, p04, s, gn, gensB, gensA, nargin, G, pathname, filename, outfile, N, opcount, g, k, z,
          b1,b2,b3,b4, aboveb1, aboveb2, aboveb3, aboveb4, b, VERBOSE, sizeA,algebraname, newops, OneOffset, ZeroOffset, genprod, 
          uacalcpath, uacalcfile;
    VERBOSE:=true;
    
    nargin := Length(args);
    
    if nargin < 1 then 
        Error("Usage: QuadAxle([G, b1, b2, ...]);");
    else
        G:=args[1]; 
    fi;
    
    OneOffset:=1;
    ZeroOffset:=1-OneOffset;
    
    if nargin < 6 then algebraname:=StructureDescription(G); else algebraname:=args[6]; fi;
    if nargin < 5 then Error("Usage: QuadAxle([G, b1, b2, ...]);"); else b1:=args[2]; b2:=args[3]; b3:=args[4]; b4:=args[5]; fi;
    
    if not IsTransitive(G) then
        Error("Usage: QuadAxle([G, b1, b2, ...]);  G must be a transitive group.");
    fi;
    
    pathname := "/home/williamdemeo/pub/research/LatticeTheory/DeMeo/Octave/OctLatCore/"; # <<< ATTENTION! You should edit this variable.
    uacalcpath := "/home/williamdemeo/Dropbox/ClosureCore/UACalcFiles/"; # <<< ATTENTION! You should edit this variable.
    filename := Concatenation(pathname, "QA", algebraname, ".m");
    Print("output file: ", filename, "\n");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    filename := Concatenation(uacalcpath, "QA-", algebraname, "-", String(b1), "-", String(b2),"-", String(b3),"-", String(b4), ".ua");
    Print("uacalc file: ", filename, "\n");
    uacalcfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(uacalcfile, false);   # This prevents automatic indentation and line breaks.

    N:=NrMovedPoints(G);
    sizeA:=5*N-4;     # = N+4*(N-1)
    B0:=[1..N];    B1:=[1..N];    B2:=[1..N];  B3:=[1..N];  B4:=[1..N];
    aboveb1:=0;    aboveb2:=0;  aboveb3:=0; aboveb4:=0;
    for b in B0 do
        B1[b]:=b+N-aboveb1;
        B2[b]:=b+2*N-1-aboveb2;
        B3[b]:=b+3*N-2-aboveb3;
        B4[b]:=b+4*N-3-aboveb4;
        if b=b1 then
            aboveb1:=1;
            B1[b]:=b;
        elif b=b2 then
            aboveb2:=1;
            B2[b]:=b;
        elif b=b3 then
            aboveb3:=1;
            B3[b]:=b;
        elif b=b4 then
            aboveb4:=1;
            B4[b]:=b;
        fi;
    od;
    Print("B0 = ", B0, "\n");
    Print("B1 = ", B1, "\n");
    Print("B2 = ", B2, "\n");
    Print("B3 = ", B3, "\n");
    Print("B4 = ", B4, "\n");
    PrintTo(outfile, "% B0 = ", B0, "\n");
    AppendTo(outfile, "% B1 = ", B1, "\n");
    AppendTo(outfile, "% B2 = ", B2, "\n");
    AppendTo(outfile, "% B3 = ", B3, "\n");
    AppendTo(outfile, "% B4 = ", B4, "\n");

    # construct the p0i's 
    p01:=();    p02:=();    p03:=();    p04:=();
    for b in B0 do
        if b<>b1 then p01:=p01*(b,B1[b]); fi;
        if b<>b2 then p02:=p02*(b,B2[b]); fi;
        if b<>b3 then p03:=p03*(b,B3[b]); fi;
        if b<>b4 then p04:=p04*(b,B4[b]); fi;
    od;        
    Print("p01 = ", p01, "\n");
    Print("p02 = ", p02, "\n");
    Print("p03 = ", p03, "\n");
    Print("p04 = ", p04, "\n");
    Print("Tests:\n");
    Print("2^p01 = ", 2^p01, " <<== should be 10\n");
    Print("1^p01 = ", 1^p01, " <<== should be 1\n");
    
    AppendTo(uacalcfile, "<?xml version=\"1.0\"?>\n");
    AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>QA-", algebraname, "-",b1,"-",b2,"-",b3,"-",b4,"</algName>\n");
    AppendTo(uacalcfile, "<cardinality>", sizeA, "</cardinality>\n");
    AppendTo(uacalcfile, "<operations>\n");
    
    ## p0 ##
    AppendTo(uacalcfile, "<op>\n<opSymbol><opName>p0</opName>\n");
    AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
    AppendTo(uacalcfile, 0);
    for z in [2..sizeA] do
        if z in B0 then
            AppendTo(uacalcfile, ",", z-1);
        elif z in B1 then
            AppendTo(uacalcfile, ",", (z^p01)-1);
        elif z in B2 then
            AppendTo(uacalcfile, ",", (z^p02)-1);
        elif z in B3 then
            AppendTo(uacalcfile, ",", (z^p03)-1);
        elif z in B4 then
            AppendTo(uacalcfile, ",", (z^p04)-1);
        fi;
    od;
    AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
    
    ## p1 ##
    AppendTo(uacalcfile, "<op>\n<opSymbol><opName>p1</opName>\n");
    AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
    AppendTo(uacalcfile, 1^p01-1);
    for z in [2..sizeA] do
        if z in B0 then
            AppendTo(uacalcfile, ",", z^p01-1);
        elif z in B1 then
            AppendTo(uacalcfile, ",", z-1);
        elif z in B2 then
            AppendTo(uacalcfile, ",", (z^p02)^p01-1);
        elif z in B3 then
            AppendTo(uacalcfile, ",", (z^p03)^p01-1);
        elif z in B4 then
            AppendTo(uacalcfile, ",", (z^p04)^p01-1);
        fi;
    od;
    AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
    
    ## p2 ##
    AppendTo(uacalcfile, "<op>\n<opSymbol><opName>p2</opName>\n");
    AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
    AppendTo(uacalcfile, 1^p02-1);
    for z in [2..sizeA] do
        if z in B0 then
            AppendTo(uacalcfile, ",", (z^p02)-1);
        elif z in B1 then
            AppendTo(uacalcfile, ",", (z^p01)^p02-1);
        elif z in B2 then
            AppendTo(uacalcfile, ",", z-1);
        elif z in B3 then
            AppendTo(uacalcfile, ",", (z^p03)^p02-1);
        elif z in B4 then
            AppendTo(uacalcfile, ",", (z^p04)^p02-1);
        fi;
    od;
    AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
    
    ## p3 ##
    AppendTo(uacalcfile, "<op>\n<opSymbol><opName>p3</opName>\n");
    AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
    AppendTo(uacalcfile, 1^p03-1);
    for z in [2..sizeA] do
        if z in B0 then
            AppendTo(uacalcfile, ",", z^p03-1);
        elif z in B1 then
            AppendTo(uacalcfile, ",", (z^p01)^p03-1);
        elif z in B2 then
            AppendTo(uacalcfile, ",", (z^p02)^p03-1);
        elif z in B3 then
            AppendTo(uacalcfile, ",", z-1);
        elif z in B4 then
            AppendTo(uacalcfile, ",", (z^p04)^p03-1);
        fi;
    od;
    AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
    
    ## p4 ##
    AppendTo(uacalcfile, "<op>\n<opSymbol><opName>p4</opName>\n");
    AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
    AppendTo(uacalcfile, 1^p04-1);
    for z in [2..sizeA] do
        if z in B0 then
            AppendTo(uacalcfile, ",", z^p04-1);
        elif z in B1 then
            AppendTo(uacalcfile, ",", (z^p01)^p04-1);
        elif z in B2 then
            AppendTo(uacalcfile, ",", (z^p02)^p04-1);
        elif z in B3 then
            AppendTo(uacalcfile, ",", (z^p03)^p04-1);
        elif z in B4 then
            AppendTo(uacalcfile, ",", z-1);
        fi;
    od;
    AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
    
    s:=[1..sizeA];
    for k in B1 do s[k]:=b1; od;
    for k in B2 do s[k]:=b2; od;
    for k in B3 do s[k]:=b3; od;
    for k in B4 do s[k]:=b4; od;
    AppendTo(uacalcfile, "<op>\n<opSymbol><opName>s</opName>\n");
    AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
    AppendTo(uacalcfile, s[1]-1);
    for k in [2..sizeA] do AppendTo(uacalcfile, ",", s[k]-1); od;
    AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
    
    opcount:=0;
    for g in GeneratorsOfGroup(G) do
        #    for g in Elements(G) do
        AppendTo(uacalcfile, "<op>\n<opSymbol><opName>g", opcount, "</opName>\n");
        AppendTo(uacalcfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
        AppendTo(uacalcfile, 1^g-1);
        AppendTo(outfile, 1^g-1);
        for z in [2..sizeA] do
            if z in B0 then
                AppendTo(uacalcfile, ",", z^g-1);
            elif z in B1 then
                AppendTo(uacalcfile, ",", (z^p01)^g-1);
            elif z in B2 then
                AppendTo(uacalcfile, ",", (z^p02)^g-1);
            elif z in B3 then
                AppendTo(uacalcfile, ",", (z^p03)^g-1);
            elif z in B4 then
                AppendTo(uacalcfile, ",", (z^p04)^g-1);
            fi;
        od;
        AppendTo(uacalcfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
        opcount:=opcount+1;
    od;

    AppendTo(uacalcfile, "</operations>\n</basicAlgebra>\n</algebra>\n");
    
    
    
end;
