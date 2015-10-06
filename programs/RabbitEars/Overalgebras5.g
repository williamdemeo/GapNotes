# File: Overalgebras5.g
# Author: William DeMeo
# Date: 2011.12.28
# Updated: 2011.12.28
#
# Description: GAP routines for constructing overalgebras of a given G-set and 
#              for creating uacalc files containing the resulting algebras.
#
# N.B. we have changed the routines to accept arguments in 0-offset notation
# instead of the 1-offset notation we used before.
#
# Send questions, comments, suggestions to williamdemeo@gmail.com
#

##################

writeUACalcOp:=function(uacalcfile, op, opname)
#   Utility function for writing an operation to a file in uacalc 
#   format. The operation should be a vector of length N, say, containing integer 
#   values between 1 and N.  (These values will be converted to 0-offset.)
#
# INPUTS  uacalcfile = name of file to which operation should be written.
#         op = the operation (a vector)
#         opname = what to name the operation in the uacalc algebra file.
#
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
    #            ...
    #           B_{K-2} \cap B_{K-1} = {x^{K-1}} = {x^{K-2}} (or the y's, depending)
    #
    # Also, there are K+1 ears attached to each of these tie-points:
    #
    #          B_{K} \cap B_0 = {x} = {x^K}
    #          B_{K+1} \cap B_0 \cap B_1 = {y} = {y^1} = {y^{K+1}}
    #          B_{K+2} \cap B_1 \cap B_2 = {x^1} = {x^2} = {x^{K+2}}
    #           ...
    #          B_{2*K} \cap B_{K-1} = {a^{2*K}}= {a^{K-1}} where a is x or y depending 
    #                                                      on whether K is odd or even.
    #
  
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

    # e0 -- maps BB[j] onto B0 (all j).
    e0:=[1..sizeA];
    for i in [N+1..sizeA] do
        for k in [1..2*K] do
            if i in BB[k] then
                e0[i]:=Position(BB[k],i);
            fi;
        od;
    od;
    
    # ee[k] -- maps BB[j] onto BB[k] (all j).
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
    
    # p0 -- maps BB[K] onto x (left tie-point) and all other BB[j] onto y (right tie-point).
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
    
    # pp[k] -- maps BB[j] and BB[K+j] onto left (right) tie-point of BB[k] if j<k (j>k)
    #          and also maps BB[K+k] onto left tie-point of BB[k].
    pp:=[];
    tpleft:=y;   # left tie-point
    tpright:=x;  # right tie-point  (these alternate between x and y depending on BB[j]).
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
    
    ### Construct g e0, one for each g in G.
    ge0:=[];
    gens:=GeneratorsOfGroup(G);
    numgens:=Length(gens);
    for i in [1..numgens] do
        ge0[i]:=[1..sizeA];
        g:=gens[i];
        for j in [1..sizeA] do            
            ge0[i][j]:=e0[j]^g;              # The e0[j]-th moved point is moved to x; 
            #x:=Bmp[e0[j]]^g;              # The e0[j]-th moved point is moved to x; 
            #ge0[i][j]:=Position(Bmp, x);  # gp0[i][x]:= the index of x in Bmp.
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
        AppendTo(uacalcfile, "<desc>The permutational algebra (", MovedPoints(G)-1, ", ", StructureDescription(G), ") (generated by OveralgebraPC).</desc>\n");
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
        
##################

Overalgebra4:=function(args)
    # Overalgebra4:=function([G, [[a1,b1],[a2,b2],...], Q, algebraname])
    #
    # Experimental function to build an overalgebra with no intersection points.
    #
    local i, j, k, kk, x, y, K, aa, a, bb, b, bi, bj, blk, Bmp, B0, B1, BB, p0, p, pp, pi, r, q, g, gp0, gens, Gens, numgens, N, n, 
          nargin, G, pathname, filename, outfile, opcount, pos, VERBOSE, sizeA, algebraname, opname, M, Q, foundx, numpotatos,
          uacalcpath, uacalcfile, STORE_GSET, numalgebras, yetfound, s0, s, f, ff, f0, s0j, sj0;
    
    ### Variables you can change to your liking:
    uacalcpath := "./"; # <<< ATTENTION! This is where uacalc file is stored.
    VERBOSE:=true;         # Set this to false to supress extra command-line output.
    STORE_GSET:=true;      # Set this to false if you don't want the original G-set also stored in the uacalc file.
    ###
    
    nargin := Length(args);
    if VERBOSE then
        Print("Overalgebra4 called with the following arguments: \n");
        for k in [1..nargin] do
            Print("args[",k,"] = ", args[k], "\n");
        od;
    fi;
    
    if nargin < 2 then 
        Error("Usage: Overalgebra4([G, [[a1,b1], [a2,b2],...],  algebraname])"); 
    else 
        G:=args[1];  
        Gens:=args[2];   # The generators, or axes, as a list of lists: [[a1,b1], [a2,b2], ...]
    fi;
    
    # N.B. we now assume arguments passed in 0-offset notation!!!
    Gens:=Gens+1;    
    
    K:=Length(Gens)+1;   # N.B. we are now assuming K-1 generating pairs.
    aa:=[];
    bb:=[];
    for k in [1..K-1] do
        Add(aa,Gens[k][1]);
        Add(bb,Gens[k][2]);
    od;
    if nargin < 3 then Q:=4; else Q:=args[3]; fi;
    if nargin < 4 then algebraname:=StructureDescription(G); else algebraname:=args[4]; fi;

    if not IsTransitive(G) then
        Error("Usage: Overalgebra4([G, ...]);  G must be a transitive group.");
    fi;
    
    filename:=Concatenation(uacalcpath, "Overalgebra4_", algebraname, "_");
    
    for k in [1..K-1] do
        filename:= Concatenation(filename, String( aa[k] - 1 ), "-", String( bb[k] - 1));
        if k<>K-1 then filename:= Concatenation(filename, "_"); fi;
    od;
    filename:=Concatenation(filename, "_Q", String(Q));
    filename:=Concatenation(filename, ".ua");
    
    if VERBOSE then Print("\nuacalc file: ", filename, "\n"); fi;
    uacalcfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(uacalcfile, false);   # prevents automatic indentation and line breaks.

    Bmp:=MovedPoints(G);
    N:=NrMovedPoints(G);
    for k in [1..K-1] do
        if not (aa[k] in Bmp) then
            Error("Usage: Overalgebra4([G, [[a1,b1],...,[ak,bk]],...]);  a_",k," must be in the set B=MovedPoints(G)."); 
        fi;
        if not (bb[k] in Bmp) then
            Error("Usage: Overalgebra4([G, [[a1,b1],...,[ak,bk]],...]);  b_",k," must be in the set B=MovedPoints(G)."); 
        fi;
        if aa[k]=bb[k] then
            Error("Usage: Overalgebra4([G, [[a1,b1],...,[ak,bk]],...]);  a",k,"=b",k,", but they must be distinct."); 
        fi;
    od;
    
    # Print the congruences and tie-points
    if VERBOSE then
        Print("\n--- CONGRUENCES of (B,G) --- \n");
        for blk in AllBlocks(G) do Print(Orbit(G,blk,OnSets)-1, "\n"); od;
        Print("\ntie-points: ", args[2], ";\n"); 
    fi;
    
    a:=[];  b:=[];    # the indices of the aa and bb in the set of moved points.
    for k in [1..K-1] do
        a[k]:=Position(Bmp,aa[k]);
        b[k]:=Position(Bmp,bb[k]);
    od;
    
    B0:=[1..N];    # (indices of) the elements in original universe (the moved points of G)
                   # B0 = the left rabbit ear;
    BB:=[];        # The rows of BB are B1, B2, B3, ...
    M:=N;
    for j in [1..Q] do
        BB[j]:=[1..N]+j*N;   
    od;
    sizeA:=N+Q*N;

    numpotatos:=Q+1;
    
    if VERBOSE then
        Print("\n--- MINIMAL SETS --- \n");
        Print("B0    = ", B0-1, "\n");
        for k in [1..(numpotatos-1)] do
            Print("BB[", k, "] = ", BB[k]-1, "\n");
        od;
    fi;
    
    p0:=[1..sizeA];
    for j in [1..Q] do
        for x in BB[j] do
            p0[x]:=Position(BB[j],x);
        od;
    od;
        
    pp:=[];
    for i in [1..Q-1] do
        pp[i]:=[];
        for j in [i+1..Q] do
            pp[i][j]:=[];
            for k in [1..K-1] do
                pp[i][j][k]:=[1..sizeA];
                for x in BB[i] do
                    pp[i][j][k][x]:=aa[k];
                od;
                for x in BB[j] do
                    pp[i][j][k][x]:=bb[k];
                od;
            od;
        od;
    od;
    
    s0j:=[];
    for j in [1..Q] do
        s0j[j]:=[1..sizeA];
        for x in B0 do
            s0j[j][x]:=BB[j][x];
        od;
    od;
    sj0:=[];
    for j in [1..Q] do
        sj0[j]:=[1..sizeA];
        for x in BB[j] do
            sj0[j][x]:=Position(BB[j],x);
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
    
    ### Construct f_j such that f[j](x) = s0j g sj0 (x) if x in BB[j], identity otherwise (one for each g in G).
    f0:=[];
    gens:=GeneratorsOfGroup(G);
    numgens:=Length(gens);
    for i in [1..numgens] do
        f0[i]:=[1..sizeA];
        g:=gens[i];
        for x in B0 do
            f0[i][x]:=x^g;
        od;
    od;
    ff:=[];
    for j in [1..Q] do
        ff[j]:=[];
        for i in [1..numgens] do
            ff[j][i]:=[1..sizeA];
            g:=gens[i];
            for x in BB[j] do
                y:=(Position(BB[j],x))^g; 
                ff[j][i][x]:=BB[j][y];
            od;
        od;
    od;
    f:=[];
    for i in [1..numgens] do
        f[i]:=[1..sizeA];
        for x in B0 do
            f[i][x]:=f0[i][x];
        od;
        for j in [1..Q] do
            for x in BB[j] do
                f[i][x]:=ff[j][i][x];
            od;
        od;
    od;
    
    
    
    if VERBOSE then
        Print("\n--- OPERATIONS ---\n");
        Print("p0 = ", p0-1, "\n");
        Print("\n------ s0j's --------\n");
        for j in [1..Length(s0j)] do
            Print("s0j[",j,"]: ", s0j[j]-1);
            Print("\n");
        od;
        Print("\n------ sj0's --------\n");
        for j in [1..Length(sj0)] do
            Print("sj0[",j,"]: ", sj0[j]-1);
            Print("\n");
        od;
        Print("\n------ f0[i] --------\n");
        for i in [1..numgens] do
            Print("f0[", i, "]: ", f0[i]-1);
            Print("\n");
        od;
        
        Print("\n------ ff[j][i] --------\n");
        for j in [1..Q] do
            for i in [1..numgens] do
                Print("ff[",j,"][", i, "]: ", ff[j][i]-1);
                Print("\n");
            od;
        od;
        
        Print("\n------ f[i] --------\n");
        for i in [1..numgens] do
            Print("f[", i, "]: ", f[i]-1);
            Print("\n");
        od;
        
        # Print("\n------ pp[i][j][k] --------\n");
        # for i in [1..Q-1] do
        #     for j in [i+1..Q] do
        #         for k in [1..K-1] do
        #             Print("pp[",i,"][", j, "][", k,"]: ", pp[i][j][k]-1);
        #             Print("\n");
        #         od;
        #     od;
        # od;
        
        
        Print("\n------ gip0's --------\n");
        for i in [1..numgens] do
            Print("g", i, "p0 = ", gp0[i]-1, "\n");
        od;
    fi;
    
    # now write the uacalc file
    PrintTo(uacalcfile, "<?xml version=\"1.0\"?>\n");
            
    if STORE_GSET then  ### First put the original G-set algebra in the uacalc file 
        AppendTo(uacalcfile, "<algebraList>\n");
        AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>", algebraname, "</algName>\n");
        AppendTo(uacalcfile, "<desc>The permutational algebra (", MovedPoints(G)-1, ", ", StructureDescription(G), ") (generated by Overalgebra4).</desc>\n");
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
    AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>Overalgebra4-", algebraname,"</algName>\n");
    AppendTo(uacalcfile, "<desc>OveralgebraII on ", algebraname, " using points ", Gens-1,".</desc>\n");
    AppendTo(uacalcfile, "<cardinality>", sizeA, "</cardinality>\n");
    AppendTo(uacalcfile, "<operations>\n");
    
    ## p0  N.B. we call this functions e_0 in the paper. ## 
    writeUACalcOp(uacalcfile, p0, "e0");
    
    ## s0j[k] ##
    for k in [1..Length(s0j)] do
        opname:=Concatenation("s0j",String(k));
        writeUACalcOp(uacalcfile, s0j[k], opname);
    od;    
    
    ## sj0[k] ##
    for k in [1..Length(sj0)] do
        opname:=Concatenation("sj0",String(k));
        writeUACalcOp(uacalcfile, sj0[k], opname);
    od;    
    
    # for j in [1..Q] do
    #     for i in [1..numgens] do
    #         opname:=Concatenation("f_", String(j),",",String(i));
    #         writeUACalcOp(uacalcfile, f[j][i], opname);
    #     od;
    # od;
    for i in [1..numgens] do
        opname:=Concatenation("f", String(i));
        writeUACalcOp(uacalcfile, f[i], opname);
    od;
    
    # for i in [1..Q-1] do
    #     for j in [i+1..Q] do
    #         for k in [1..K-1] do
    #             opname:=Concatenation("p_", String(i),",",String(j), ",", String(k));
    #             writeUACalcOp(uacalcfile, pp[i][j][k], opname);
    #         od;
    #     od;
    # od;
    
    # for i in [1..numgens] do
    #     opname:=Concatenation("f0_",String(i));
    #     writeUACalcOp(uacalcfile, f0[i], opname);
    # od;
    
    ## gip0  N.B. we call these functions g_i e_0 in the paper. ##
    for i in [1..numgens] do
        opname:=Concatenation("g",String(i),"e0");
        writeUACalcOp(uacalcfile, gp0[i], opname);
    od;
    
    AppendTo(uacalcfile, "</operations>\n</basicAlgebra>\n</algebra>\n");

    if STORE_GSET then
        AppendTo(uacalcfile, "</algebraList>\n");
    fi;
end;    


