
DeCaen:=function(Om,A)
    local i, j, k, x, p, pp, denom, N, decaen;
    N:=Size(Om);
    p:=0;
    decaen:=0;
    pp:=[];
    for k in [1..Length(A)] do
        pp[k]:=Size(A[k])/N;
    od;
    for i in [1..Length(A)] do
        denom:=0;
        for j in [1..Length(A)] do
            denom:=denom+Size(Intersection(A[i],A[j]))/N;
        od;
        decaen:=decaen+ (pp[i]^2/denom);
    od;
    return decaen;
end;
        
FanErdos:=function(Om,A)
    local i, j, k, x, p, pp, denom, N, fanerd, numer;
    N:=Size(Om);
    p:=0;
    fanerd:=0;
    numer:=0;
    pp:=[];
    for k in [1..Length(A)] do
        pp[k]:=Size(A[k])/N;
        numer:=numer+pp[k];
    od;
    numer:=numer^2;
    denom:=0;
    for i in [1..Length(A)-1] do
        for j in [i+1..Length(A)] do
            denom:=denom+Size(Intersection(A[i],A[j]))/N;
        od;
    od;
    denom:=Sum(pp)+2*denom;
    fanerd:=numer/denom;
    
    return fanerd;
    
end;


N:=1000;      # number of trials
Om:=[1..10];  # Outcome space
K:=10;        # number of evens to consider
M:=10;        # max cardinality of each event
tot:=0;       # number of trials in which Fan Chung-Erdos is leq DeCaen

for k in [1..N] do 
    A:=[];;
    for i in [1..K] do 
        a:=[];;
        for j in [1..Random([1..M])] do 
            Add(a,[Random(Om)]);  # Get M random integers from the set Om
        od;
        Add(A,Union(a));
    od;
    fe:= FanErdos(Om,A); de:=DeCaen(Om,A);
    
    if fe>1 or de>1 then
        Print("\nA= ", A, "\nfe=", fe, "   de=", de, "\n"); 
        Error("lower bound on probability of union greater than 1");
    fi;
    
    if fe<=de then 
        tot:=tot+1; 
        Print("\nA= ", A, "\nfe=", fe, "  <=  de=", de, "\n"); 
    else 
        Print("\nCOUNTEREXAMPLE >>>> A= ", A, "\n                fe=", fe, "  <=  de=", de, " <<<<\n"); 
    fi;
od;
Print("\n Fan Chung-Erdos greater than DeCaen in ", N-tot, " out of ", N, " trials.\n"); 
