##################

OveralgebraPC:=function(args)
    # OveralgebraPC:=function([G, [x, y], K, algebraname])
    # The construction in which \beta is a principal congruence, say, \beta = Cg(x,y), 
    # and we have K faces strung together at points 
    #
    #           B_0 \cap B_1 = {x} = {x^1}, 
    #           B_1 \cap B_2 = {y^1} = {y^2}, 
    #           B_2 \cap B_3 = {x^2} = {x^3},
    #           B_3 \cap B_4 = {y^3} = {y^4},
    #           ...
    #           B_{K-2} \cap B_{K-1} = {x^{K-1}} = {x^{K-2}} (or the y's, depending)
    #
    # Also, there are K+1 ears attached to each of these tie-points.
  
    local B0, BB, e0, ee, p0, pp, s, ge0, f0, f1, hatf1, nargin, G, pathname, filename, outfile, N, M, M2, opcount, g, k, K, z, x, y, pos, 
          i, j, kodd, tmp, tmp2, last, b, axes, naxes, axstring, VERBOSE, sizeA, algebraname, gens, numgens,
          uacalcpath, uacalcfile, STORE_GSET,  Bmp, opname, tpleft, tpright, foundi;

    ### Variables you can change to your liking:
    #
    uacalcpath := "./"; # For now, store output in current directory. 
                        # Change this, if you want, to something like
                        # uacalcpath := "/tmp/Overalgebras/";    
                        # but make sure the directory exists on your machine!!!

    VERBOSE:=true;         # Set this to false to supress extra command-line output.
    STORE_GSET:=true;      # Set this to false if you don't want the original G-set also stored in the uacalc file.
    #
    ###
    
    nargin := Length(args);
    if VERBOSE then
        Print("Overalgebra called with the following arguments: \n");
        for k in [1..nargin] do
            Print("args[",k,"] = ", args[k], "\n");
        od;
    fi;
    if nargin < 1 then 
        Error("Usage: OveralgebraPC([G, [x,y], K]);");
    else
        G:=args[1]; 
    fi;
    if not IsTransitive(G) then
        Error("Usage: OveralgebraPC([G, [x,y], K]);  G must be a transitive group.");
    fi;
    
    if nargin < 4 then algebraname:=StructureDescription(G); else algebraname:=args[3]; fi;
    if nargin < 3 then K:=3; else K:=args[3]; fi;
    if nargin < 2 then Error("Usage: OveralgebraPC([G, [x,y], K]);"); else axes:=args[2]; fi;
    # N.B. we now assume arguments passed in 0-offset notation!!!
    axes:=axes+1;
    x:=axes[1]; y:=axes[2];
    naxes:=2;
    if VERBOSE then Print("axes = ", axes-1, "\n"); fi;
    
    axstring:=Concatenation("OveralgebraPC-", algebraname, "_", String(axes[1]-1), "-", String(axes[2]-1), "_", String(K));
    filename := Concatenation(uacalcpath, axstring, ".ua");
    Print("uacalc file: ", filename, "\n");
    uacalcfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(uacalcfile, false);   # prevents automatic indentation and line breaks.

    Bmp:=MovedPoints(G);
    N:=NrMovedPoints(G);
    
    sizeA:= N+(K-1)*(N-1)+(K+1)*(N-1);
    B0:=[1..N];
    BB:=[];
    M:=N;
    M2:=N+(K-1)*(N-1);
    BB[K]:=[];
    tmp2:=[M2+1..M2+(N-1)];
    Append(BB[K], tmp2{[1..x-1]}); Add(BB[K], x); Append(BB[K], tmp2{[x..N-1]});
    M2:=M2+(N-1);
    last:=y;
    kodd:=true;
    for k in [1..K-1] do
        BB[k]:=[];
        BB[K+k]:=[];
        tmp:=[M+1..M+(N-1)];
        tmp2:=[M2+1..M2+(N-1)];
        if kodd then
            Append(BB[k], tmp{[1..y-1]});  Append(BB[K+k], tmp2{[1..y-1]});
            Add(BB[k], last);              Add(BB[K+k], last);
            Append(BB[k], tmp{[y..N-1]});  Append(BB[K+k], tmp2{[y..N-1]});
            last:=BB[k][x];
            kodd:=false;
        else
            Append(BB[k], tmp{[1..x-1]});  Append(BB[K+k], tmp2{[1..x-1]});
            Add(BB[k], last);              Add(BB[K+k], last);
            Append(BB[k], tmp{[x..N-1]});  Append(BB[K+k], tmp2{[x..N-1]});
            last:=BB[k][y];
            kodd:=true;
        fi;
        M:=M+(N-1);
        M2:=M2+(N-1);
    od;
    BB[2*K]:=[];
    tmp2:=[M2+1..M2+(N-1)];
    if kodd then
        Append(BB[2*K], tmp2{[1..y-1]}); Add(BB[2*K], last); Append(BB[2*K], tmp2{[y..N-1]});
    else
        Append(BB[2*K], tmp2{[1..x-1]}); Add(BB[2*K], last); Append(BB[2*K], tmp2{[x..N-1]});
    fi;
    
    if VERBOSE then
        Print("B0 = ", B0-1, "\n");
        for k in [1..2*K] do
            Print("BB[", k, "] = ", BB[k]-1, "\n");
        od;
        Print("sizeA = ", sizeA, "\n");
    fi;

    # Construct e0 and ee[k]
    e0:=[1..sizeA];
    for i in [N+1..sizeA] do
        for k in [1..2*K] do
            if i in BB[k] then
                e0[i]:=Position(BB[k],i);
            fi;
        od;
    od;
    
    ee:=[];
    for k in [1..2*K] do
        ee[k]:=[1..sizeA];
        for i in [1..sizeA] do
            ee[k][i]:= BB[k][e0[i]];
        od;
    od;
    if VERBOSE then
        Print("e0 = ", e0-1, "\n");
        for k in [1..2*K] do
            Print("ee[",k,"] = ", ee[k]-1, "\n");
        od;
    fi;
    
    # Construct p0 and pp[k]
    p0:=[1..sizeA];
    for i in [1..sizeA] do
        if i in BB[K] then
            p0[i]:=x;
        else
            for k in [1..2*K] do
                if i in BB[k] then
                    p0[i]:=y;
                fi;
            od;
        fi;
    od;
    pp:=[];
    tpleft:=y;
    tpright:=x;
    for k in [1..K-1] do
        pp[k]:=[1..sizeA];
        for i in [1..sizeA] do
            foundi:=false;
            if i in B0 or i in BB[K] or i in BB[K+k] then
                pp[k][i]:=BB[k][tpleft];
                foundi:=true;
            else
                for j in [1..k-1] do
                    if i in BB[j] or i in BB[K+j] then
                        pp[k][i]:=BB[k][tpleft];
                        foundi:=true;
                        break;
                    fi;
                od;
                if not foundi then
                    if i in BB[2*K] then
                        pp[k][i]:=BB[k][tpright];
                        foundi:=true;
                    else
                        for j in [k+1..K-1] do
                            if i in BB[j] or i in BB[K+j] then
                                pp[k][i]:=BB[k][tpright];
                                foundi:=true;
                                break;
                            fi;
                        od;
                    fi;
                fi;
            fi;
        od;
        # swap tpleft and tpright:
        tmp:=tpleft;
        tpleft:=tpright;
        tpright:=tmp;
    od;
    if VERBOSE then
        Print("p0 = ", p0-1, "\n");
        for k in [1..K-1] do
            Print("pp[",k,"] = ", pp[k]-1, "\n");
        od;
    fi;
    
    # construct s  (DON'T NEED IT)
    # s:=[1..sizeA];
    # for i in [1..sizeA] do
    #     for k in [K..2*K] do
    #         if i in BB[k] then
    #             s[i]:=Minimum(BB[k]);
    #         fi;
    #     od;
    # od;
    # if VERBOSE then
    #     Print("s = ", s-1, "\n");
    # fi;
    
    ### Construct g e0, one for each g in G.
    ge0:=[];
    gens:=GeneratorsOfGroup(G);
    numgens:=Length(gens);
    for i in [1..numgens] do
        ge0[i]:=[1..sizeA];
        g:=gens[i];
        for j in [1..sizeA] do            
            ge0[i][j]:=e0[j]^g;              # The e0[j]-th moved point is moved to x; 
            # x:=Bmp[e0[j]]^g;              # The e0[j]-th moved point is moved to x; 
            # ge0[i][j]:=Position(Bmp, x);  # gp0[i][x]:= the index of x in Bmp.
        od;
        if VERBOSE then
            Print("g[", i, "]e0 = ", ge0[i]-1, "\n");
        fi;
    od;
    
    # Construct extra experimental ops
    f0:=[1..sizeA];
    for i in [1..N] do
        f0[i]:=BB[1][i];
    od;
    for i in BB[K] do
        pos:=Position(BB[K],i);
        f0[i]:=BB[K+2][pos];
    od;
    if VERBOSE then
        Print("f0 = ", f0-1, "\n");
    fi;
    
    hatf1:=[1..sizeA];
    for i in BB[1] do
        pos:=Position(BB[1],i);
        hatf1[i]:=BB[2][pos];
    od;
    for i in BB[K+1] do
        pos:=Position(BB[K+1],i);
        hatf1[i]:=BB[K+3][pos];
    od;
    f1:=[1..sizeA];
    for i in [1..sizeA] do
        f1[i]:=hatf1[f0[i]];
    od;
    if VERBOSE then
        Print("f1 = ", f1-1, "\n");
    fi;
    
    
    # now write the uacalc file
    PrintTo(uacalcfile, "<?xml version=\"1.0\"?>\n");
            
    if STORE_GSET then   # there will be multiple algebras in the resulting uacalc file
        AppendTo(uacalcfile, "<algebraList>\n");
    fi;
            
    ### First put the original G-set algebra in the uacalc file 
    if STORE_GSET then
        AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>", algebraname, "</algName>\n");
        AppendTo(uacalcfile, "<desc>The permutational algebra (", MovedPoints(G)-1, ", ", StructureDescription(G), ") (generated by OveralgebraXO).</desc>\n");
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
    
    # Now write the general rabbit ears algebra
    AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>",axstring,"</algName>\n");
    AppendTo(uacalcfile, "<desc>New rabbit with ", K, " faces and ", K+1, " ears.</desc>\n");
    AppendTo(uacalcfile, "<cardinality>", sizeA, "</cardinality>\n");
    AppendTo(uacalcfile, "<operations>\n");
    
    ## e0  ##
    writeUACalcOp(uacalcfile, e0, "e0");
    
    ## ee[k] ##
    for k in [1..2*K] do
        opname:=Concatenation("e",String(k));
        writeUACalcOp(uacalcfile, ee[k], opname);
    od;    
    
    ## p0  ##
    writeUACalcOp(uacalcfile, p0, "p0");
    
    ## pp[k] ##
    for k in [1..K-1] do
        opname:=Concatenation("p",String(k));
        writeUACalcOp(uacalcfile, pp[k], opname);
    od;    
    
    ## s ##
    ## writeUACalcOp(uacalcfile, s, "s");
    
    ## f (experimental) ##
    writeUACalcOp(uacalcfile, f1, "f1");
    writeUACalcOp(uacalcfile, f0, "f0");
    
    # for k in [1..naxesSets] do
    #     opname:=Concatenation("s",String(k));
    #     writeUACalcOp(uacalcfile, ss[k], opname);
    # od;
    
    ## gie0  ##
    for i in [1..numgens] do
        opname:=Concatenation("g",String(i),"e0");
        writeUACalcOp(uacalcfile, ge0[i], opname);
    od;
    
    AppendTo(uacalcfile, "</operations>\n</basicAlgebra>\n</algebra>\n");

    if STORE_GSET then
        AppendTo(uacalcfile, "</algebraList>\n");
    fi;
        
    
end;
