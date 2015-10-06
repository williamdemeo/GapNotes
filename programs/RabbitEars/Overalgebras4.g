# File: Overalgebras3.g
# Author: William DeMeo
# Date: 2011.12.09
# Updated: 2011.12.09
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

Overalgebra3:=function(args)
    # Overalgebra3:=function([G, [[a1,b1],[a2,b2],...], Q, algebraname])
    local i, j, k, kk, z, x, K, aa, a, bb, b, bi, bj, blk, Bmp, B0, B1, BB, p0, p, pi, r, q, g, gp0, gens, Gens, numgens, N, n, 
          nargin, G, pathname, filename, outfile, opcount, pos, VERBOSE, sizeA, algebraname, opname, M, Q, foundx, numpotatos,
          uacalcpath, uacalcfile, STORE_GSET, numalgebras, yetfound, f1, f2, s0, s, f;
    
    ### Variables you can change to your liking:
    uacalcpath := "./"; # <<< ATTENTION! This is where uacalc file is stored.
    VERBOSE:=true;         # Set this to false to supress extra command-line output.
    STORE_GSET:=true;      # Set this to false if you don't want the original G-set also stored in the uacalc file.
    ###
    
    nargin := Length(args);
    if VERBOSE then
        Print("Overalgebra3 called with the following arguments: \n");
        for k in [1..nargin] do
            Print("args[",k,"] = ", args[k], "\n");
        od;
    fi;
    
    if nargin < 2 then 
        Error("Usage: Overalgebra3([G, [[a1,b1], [a2,b2],...],  algebraname])"); 
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
        Error("Usage: Overalgebra3([G, ...]);  G must be a transitive group.");
    fi;
    
    filename:=Concatenation(uacalcpath, "Overalgebra3_", algebraname, "_");
    
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
            Error("Usage: Overalgebra3([G, [[a1,b1],...,[ak,bk]],...]);  a_",k," must be in the set B=MovedPoints(G)."); 
        fi;
        if not (bb[k] in Bmp) then
            Error("Usage: Overalgebra3([G, [[a1,b1],...,[ak,bk]],...]);  b_",k," must be in the set B=MovedPoints(G)."); 
        fi;
        if aa[k]=bb[k] then
            Error("Usage: Overalgebra3([G, [[a1,b1],...,[ak,bk]],...]);  a",k,"=b",k,", but they must be distinct."); 
        fi;
    od;
    
    # Print the congruences and tie-points
    if VERBOSE then
        Print("\n--- CONGRUENCES of (B,G) --- \n");
        for blk in AllBlocks(G) do Print(Orbit(G,blk,OnSets), "\n"); od;
        Print("\ntie-points: a=", aa-1, ";  b=", bb-1, ";\n"); 
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
    BB[1]:=[1..N]+M;   
    BB[1][a[1]]:=a[1];
    for j in [(a[1]+1)..N] do
        BB[1][j]:=BB[1][j]-1;
    od;
    M:=Maximum(BB[1]);
    for i in [2..K-1] do
        BB[i]:=[1..N]+M;
        BB[i][a[i]]:=BB[i-1][b[i-1]];
        for j in [(a[i]+1)..N] do
            BB[i][j]:=BB[i][j]-1;
        od;
        M:=Maximum(BB[i]);
    od;
    BB[K]:=[1..N]+M;   # BB[K] is the 2nd ear.
    # BB[K][a[1]]:=BB[K-1][b[K-1]];  # <<== we are changing this to b[K-1]!!
    # for j in [(a[1]+1)..N] do                              
    BB[K][b[K-1]]:=BB[K-1][b[K-1]];
    for j in [(b[K-1]+1)..N] do                          
        BB[K][j]:=BB[K][j]-1;
    od;
    M:=Maximum(BB[K]);
    
    # New faces
    for q in [1..Q] do
        BB[2*q*K]:=[1..N]+M;   
        M:=M+N;
        
        BB[2*q*K-1]:=[1..N]+M;
        BB[2*q*K-1][a[1]]:=BB[2*q*K][a[1]];
        for j in [(a[1]+1)..N] do                          
            BB[2*q*K-1][j]:=BB[2*q*K-1][j]-1;
        od;
        M:=Maximum(BB[2*q*K-1]);
        
        for i in [2..K-1] do
            BB[2*q*K-i]:=[1..N]+M;
            BB[2*q*K-i][a[i]]:=BB[2*q*K-(i-1)][b[i-1]];
            for j in [(a[i]+1)..N] do                          
                BB[2*q*K-i][j]:=BB[2*q*K-i][j]-1;
            od;
            M:=Maximum(BB[2*q*K-i]);
        od;
        
        BB[2*q*K-(K-1)][b[K-1]]:=BB[2*q*K-(K+1)][b[K-1]];  # link up with last pair of sets of faces
        for j in [(b[K-1]+1)..N] do                          
            BB[2*q*K-(K-1)][j]:=BB[2*q*K-(K-1)][j]-1;
        od;
        
        M:=Maximum(BB[2*q*K-(K-1)]);
        
        BB[2*q*K+1]:=[1..N]+M;
        BB[2*q*K+1][a[1]]:=BB[2*q*K][a[1]];
        for j in [(a[1]+1)..N] do                          
            BB[2*q*K+1][j]:=BB[2*q*K+1][j]-1;
        od;
        M:=Maximum(BB[2*q*K+1]);
        
        for i in [2..K-1] do
            BB[2*q*K+i]:=[1..N]+M;
            BB[2*q*K+i][a[i]]:=BB[2*q*K+(i-1)][b[i-1]];
            for j in [(a[i]+1)..N] do                          
                BB[2*q*K+i][j]:=BB[2*q*K+i][j]-1;
            od;
            M:=Maximum(BB[2*q*K+i]);
        od;
        
        # Add an odd ear:
#        if q<>Q then  # for now we don't put an extra odd ear at the end (maybe we should)
            BB[(2*q+1)*K]:=[1..N]+M;
            BB[(2*q+1)*K][b[K-1]]:=BB[(2*q+1)*K-1][b[K-1]];
            for j in [(b[K-1]+1)..N] do                          
                BB[(2*q+1)*K][j]:= BB[(2*q+1)*K][j]-1;
            od;
            M:=Maximum(BB[(2*q+1)*K]);
#        fi;
    od;    
    
    
    ### TOTALS:  2*Q*K+K+1 potatos ==> (N-1)*(2*Q*K+K+1) + 1 points
    # They are B0, BB[1], BB[2], ..., BB[K], BB[K+1], ..., BB[2*K], ..., BB[(2*Q+1)*K]
    numpotatos:=((2*Q+1)*K) + 1;   
    sizeA:= (N-1)*(numpotatos) +1;
    if VERBOSE then
        Print("\nThe size of A is |A|=", M, ".\n");
        if M<>sizeA then
            Print("\nWARNING: the equality above is false, so we got the size of A wrong.\n");
        fi;
    fi;
    
    if VERBOSE then
        Print("\n--- MINIMAL SETS --- \n");
        Print("B0    = ", B0-1, "\n");
        for k in [1..(numpotatos-1)] do
            Print("BB[", k, "] = ", BB[k]-1, "\n");
        od;
    fi;
    
    p0:=[];
    
    ### Construct p0, p[K], p[2*K], ..., p[(2*Q+1)*K] ###
    # p0 maps EVEN ears onto B0, and all ODD ears and all faces onto the tie-point a[1].
    # p[2*q*K] maps EVEN ears onto BB[2*q*K], and all ODD ears and all faces onto its a[1] tie-point.
    # p[(2*q+1)*K] maps ODD ears onto BB[(2*q+1)*K], and all EVEN ears and all faces onto its b[K-1] tie-point.
    p:=[];
    for q in [1..2*Q+1] do
        p[q*K]:=[1..sizeA];
    od;
    for x in [1..sizeA] do
        foundx:=false;
        if x in B0 then
            foundx:=true;
            p0[x]:=x;
            p[K][x]:=BB[K][b[K-1]];
            for q in [1..Q] do
                p[2*q*K][x]:=BB[2*q*K][x];
                p[(2*q+1)*K][x]:=BB[(2*q+1)*K][b[K-1]];
            od;
        elif x in BB[K] then   # x is in an odd ear
            foundx:=true;
            p0[x]:=a[1];       # even
            p[K][x]:=x;        # odd
            for q in [1..Q] do
                p[2*q*K][x]:=BB[2*q*K][a[1]];                       # even
                p[(2*q+1)*K][x]:=BB[(2*q+1)*K][Position(BB[K], x)]; # odd
            od;
        else
            for j in [1..Q] do
                if x in BB[2*j*K] then   # x is in an even ear
                    foundx:=true;
                    p0[x]:=Position(BB[2*j*K], x); # even
                    p[K][x]:=BB[K][b[K-1]];        # odd
                    for q in [1..Q] do
                        p[2*q*K][x]:=BB[2*q*K][Position(BB[2*j*K], x)]; # even
                        p[(2*q+1)*K][x]:=BB[(2*q+1)*K][b[K-1]];         # odd
                    od;
                    break;
                elif x in BB[(2*j+1)*K] then  # x is in an odd ear
                    foundx:=true;
                    p0[x]:=a[1];                             # even
                    p[K][x]:=BB[K][Position(BB[(2*j+1)*K], x)]; # odd
                    for q in [1..Q] do
                        p[2*q*K][x]:=BB[2*q*K][a[1]];                               # even
                        p[(2*q+1)*K][x]:=BB[(2*q+1)*K][Position(BB[(2*j+1)*K], x)]; # odd
                    od;
                    break;
                fi;
            od;
        fi;
        if not foundx then
            p0[x]:=a[1];
            p[K][x]:=BB[K][b[K-1]];
            for q in [1..Q] do
                p[2*q*K][x]:=BB[2*q*K][a[1]];  # even multiples of K have a[1] tie-points
                p[(2*q+1)*K][x]:=BB[(2*q+1)*K][b[K-1]]; # odd multiples of K have b[K-1] tie-points
            od;
        fi;
    od;
    
    ### p[q*K+k] -- maps BB[j] onto left (right) tie-point of BB[q*K+k] if j<q*K+k (j>q*K+k)
    for k in [1..K-1] do
        for q in [0..2*Q] do
            p[q*K+k]:=[1..sizeA];
            for x in [1..sizeA] do
                foundx:=false;
                if x in B0 then
                    foundx:=true;
                    if RemInt(q,2)=0 then
                        p[q*K+k][x]:=BB[q*K+k][a[k]];
                    else
                        p[q*K+k][x]:=BB[q*K+k][b[K-k]];
                    fi;
                else                    
                    for j in [1..q*K+k-1] do  # check if x is in a BB[j] below BB[q*K+k]
                        if x in BB[j] then   
                            foundx:=true;
                            if RemInt(q,2)=0 then  # if q is even, then BB[q*K+k] has a[K-k] as LEFT tie-point.
                                p[q*K+k][x]:=BB[q*K+k][a[k]];
                            else
                                p[q*K+k][x]:=BB[q*K+k][b[K-k]];
                            fi;
                            break;
                        fi;
                    od;
                    if not foundx then
                        if x in BB[q*K+k] then 
                            foundx:=true;
                            p[q*K+k][x]:=x;
                        else
                            for j in [q*K+k+1..(numpotatos-1)] do  # check if x is in a BB[j] above BB[q*K+k]
                                if x in BB[j] then
                                    foundx:=true;
                                    if RemInt(q,2)=0 then # if q is even, then BB[q*K+k] has b[K-k] as RIGHT tie-point.
                                        p[q*K+k][x]:=BB[q*K+k][b[k]];
                                    else
                                        p[q*K+k][x]:=BB[q*K+k][a[K-k]];
                                    fi;
                                    break;
                                fi;
                            od;
                        fi;
                    fi;
                fi;  
            od;
        od;
    od;        
    
    ### Additional ops to eliminate certain ears from playing a role in [\beta^*, \hat{\beta}].
    s0:=[1..sizeA];
    s:=[];
    s[1]:=[1..sizeA];
    for x in [1..sizeA] do
        if x in B0 then
            s0[x]:=a[1];
        elif x in BB[K] then
            s[1][x]:=BB[K][b[K-1]];
        fi;
    od;
    for i in [1..Q] do
        s[2*i]:=[1..sizeA];
        s[2*i+1]:=[1..sizeA];
        for x in [1..sizeA] do
            if x in BB[2*i*K] then
                s[2*i][x]:=BB[2*i*K][a[1]];
            elif x in BB[(2*i+1)*K] then
                s[2*i+1][x]:=BB[(2*i+1)*K][b[K-1]];
            fi;
        od;
    od;
        
    
    ### Experimental: f1 -- maps B0 onto BB[2*K] and BB[k] onto BB[K+k]
    ### Experimental: f2 -- maps BB[K] onto BB[3*K] and BB[K+k] onto BB[2*K+k]
    f:=[];
    for i in [1..Q] do
        f[i]:=[1..sizeA];    # will leave BB[i*K] fixed
        for x in [1..sizeA] do
            if x in B0 then
                f[i][x]:=BB[2*i*K][x];
            else
                for j in [1..i*K-1] do
                    if x in BB[j] then
                        f[i][x]:=BB[2*i*K-j][Position(BB[j],x)];
                        break;
                    fi;
                od;
            fi;
        od;
    od;
    
    for i in [0..Q-1] do
        f[2*Q-i]:=[1..sizeA];  # will leave BB[(2*Q-q)*K] fixed
        for x in [1..sizeA] do
            for j in [0..(i+1)*K-1] do
                if x in BB[(2*Q+1)*K-j] then
                    f[2*Q-i][x]:=BB[(2*Q+1)*K-2*(i+1)*K+j][Position(BB[(2*Q+1)*K-j],x)];
                    break;
                fi;
            od;
        od;
    od;
    
    
    # ### Experimental: f1 -- maps B0 onto BB[2*K] and BB[k] onto BB[K+k]
    # f1:=[1..sizeA];
    # for x in [1..sizeA] do
    #     if x in B0 then
    #         f1[x]:=BB[2*K][x];
    #     else
    #         for j in [1..K-1] do
    #             if x in BB[j] then
    #                 f1[x]:=BB[2*K-j][Position(BB[j],x)];
    #                 break;
    #             fi;
    #         od;
    #     fi;
    # od;
    
    
    # ### Experimental: f2 -- maps BB[K] onto BB[3*K] and BB[K+k] onto BB[2*K+k]
    # f2:=[1..sizeA];
    # for x in [1..sizeA] do
    #     if x in B0 then
    #         f2[x]:=BB[2*2*K][x];
    #     else
    #         for j in [1..2*K-1] do
    #             if x in BB[j] then
    #                 f2[x]:=BB[2*2*K-j][Position(BB[j],x)];
    #                 break;
    #             fi;
    #         od;
    #     fi;
    # od;
    
    ### qij = sij pi -- (pi maps everything onto BB[i], sij maps BB[i] onto BB[j]).
    q:=[];
    for i in [0..(numpotatos-1)] do
        q[i+1]:=[];
        if i=0 then 
            bi:=B0; pi:=p0; 
        else 
            bi:=BB[i]; pi:=p[i];
        fi;
        for j in [0..(numpotatos-1)] do
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
        Print("Suppressing  all but experimental ops for now\n");
        if false then
            Print("p0 = ", p0-1, "\n");
            for k in [1..Length(p)] do
                Print("p[",k,"][B0]: ");
                for x in B0 do
                    Print(p[k][x]-1, " ");
                od;
                Print("\n");
            od;
            Print("\n------ qij's --------\n");
            for i in [0..2*Q*K+K-1] do
                for j in [0..2*Q*K+K-1] do
                    if i=0 or j=0 then
                        Print("q[", i, "][", j, "] = ", q[i+1][j+1]-1, "\n");
                    fi;
                od;
            od;
            Print("\n------ gip0's --------\n");
            for i in [1..numgens] do
                Print("g", i, "p0 = ", gp0[i]-1, "\n");
            od;
        fi;
        
        # Print("s0 = ", s0-1, "\n");
        # for q in [1..Q] do
        #     Print("s[",2*q,"] = ", s[2*q]-1, "\n");
        #     Print("s[",2*q+1,"] = ", s[2*q+1]-1, "\n");
        # od;

        #Print("\n------ experimental f1, f2 --------\n");
        #Print("f1 = ", f1-1, "\n");
        #Print("f2 = ", f2-1, "\n");
        for i in [1..2*Q] do
            Print("f[",i,"] = ", f[i]-1, "\n");
        od;

        
    fi;
    
    # now write the uacalc file
    PrintTo(uacalcfile, "<?xml version=\"1.0\"?>\n");
            
    if STORE_GSET then  ### First put the original G-set algebra in the uacalc file 
        AppendTo(uacalcfile, "<algebraList>\n");
        AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>", algebraname, "</algName>\n");
        AppendTo(uacalcfile, "<desc>The permutational algebra (", MovedPoints(G)-1, ", ", StructureDescription(G), ") (generated by Overalgebra3).</desc>\n");
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
    AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>Overalgebra3-", algebraname,"</algName>\n");
    AppendTo(uacalcfile, "<desc>OveralgebraII on ", algebraname, " using points ", Gens-1,".</desc>\n");
    AppendTo(uacalcfile, "<cardinality>", sizeA, "</cardinality>\n");
    AppendTo(uacalcfile, "<operations>\n");
    
    ## p0  N.B. we call this functions e_0 in the paper. ## 
    writeUACalcOp(uacalcfile, p0, "e0");
    
    ## p0[k]  N.B. we call these functions e_i in the paper. ## 
    for k in [1..Length(p)] do
        opname:=Concatenation("e",String(k));
        writeUACalcOp(uacalcfile, p[k], opname);
    od;    
    
    # ## s0 
    # writeUACalcOp(uacalcfile, s0, "s0");
    
    # ## s[k] 
    # for k in [1..Length(s)] do
    #      opname:=Concatenation("s",String(k));
    #      writeUACalcOp(uacalcfile, s[k], opname);
    # od;    
    
    # # ## f1  experimental ##
    # writeUACalcOp(uacalcfile, f1, "f1");
    # # ## f2  experimental ##
    # writeUACalcOp(uacalcfile, f2, "f2");
    for i in [1..2*Q] do
        opname:=Concatenation("f",String(i));
        writeUACalcOp(uacalcfile, f[i], opname);
    od;
    
    ## gip0  N.B. we call these functions g_i e_0 in the paper. ##
    for i in [1..numgens] do
        opname:=Concatenation("g",String(i),"e0");
        writeUACalcOp(uacalcfile, gp0[i], opname);
    od;
    
    ## qij = sij pi  ##
    for i in [0..(numpotatos-1)] do
        for j in [0..(numpotatos-1)] do
            if i=0 or j=0 then
                opname:=Concatenation("q_",String(i),",", String(j));
                writeUACalcOp(uacalcfile, q[i+1][j+1], opname);
            fi;
        od;
    od;
    
    AppendTo(uacalcfile, "</operations>\n</basicAlgebra>\n</algebra>\n");

    if STORE_GSET then
        AppendTo(uacalcfile, "</algebraList>\n");
    fi;
end;    


