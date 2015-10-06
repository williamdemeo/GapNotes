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

IntransitiveAction:=function(args)
    # IntransitiveAction:=function([G, n, algebraname])
    
    local G, gens, N, i, j, k, uacalcpath, uacalcfile, filename, nargin, algebraname, n, g, ops, numops, 
          opname, r, x, d, A, axstring;
    
    uacalcpath := "./"; # For now, store output in current directory. 
    
    nargin := Length(args);
    Print("IntransitiveAction called with the following arguments: \n");
    for k in [1..nargin] do
        Print("args[",k,"] = ", args[k], "\n");
    od;
    G:=args[1]; 
    if nargin < 3 then algebraname:=StructureDescription(G); else algebraname:=args[3]; fi;
    if nargin < 2 then n:=1; else n:=args[2]; fi;

    if not IsTransitive(G) then
        Error("Usage:  G must be a transitive group.");
    fi;
    
    axstring:=Concatenation("IntransGset-", algebraname, "-", String(n));
    filename := Concatenation(uacalcpath, axstring, ".ua");

    Print("uacalc file: ", filename, "\n");
    uacalcfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(uacalcfile, false);   # prevents automatic indentation and line breaks.

    N:=NrMovedPoints(G);
    if MovedPoints(G) <> [1..N] then
        Error("Unexpected set of moved points.");
    fi;
    
    A:=[1..n*N];
    ops:=[];
    i:=0;
    for g in GeneratorsOfGroup(G) do
        i:=i+1;
        ops[i]:=[1..n*N];
        for j in [0..n-1] do
            for k in [1..N] do
                ops[i][j*N+k]:= j*N + k^g;
            od;
        od;
        # for x in [N+1..n*N] do
        #     d:=Int(x/n);
        #     r:=RemInt(x,n);  #  x = d*n + r;
        #     ops[i][x]:= d*n + (r+1)^g -1;
        # od;
    od;
    numops:=i;
    # now write the uacalc file
    PrintTo(uacalcfile, "<?xml version=\"1.0\"?>\n");
    
    AppendTo(uacalcfile, "<algebra>\n<basicAlgebra>\n<algName>", algebraname, "</algName>\n");
    AppendTo(uacalcfile, "<desc>Intransitive G-set ", StructureDescription(G), " acting on ", n, " copies of itself.</desc>\n");
    AppendTo(uacalcfile, "<cardinality>", n*N, "</cardinality>\n");
    AppendTo(uacalcfile, "<operations>\n");
    ## ops[k] ##
    for k in [1..numops] do
        opname:=Concatenation("op",String(k));
        writeUACalcOp(uacalcfile, ops[k], opname);
    od;    
    AppendTo(uacalcfile, "</operations>\n</basicAlgebra>\n</algebra>\n");
end;    
