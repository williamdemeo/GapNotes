GroupGeneratedBy:=function(args)
    local G, gens, nargin, g;
    gens:=[];
    nargin := Length(args);
    for g in args do
        gens:=Concatenation(gens,GeneratorsOfGroup(g));
    od;
    G:=Group(gens);
    return G;
end;

Join:=function(args)
    local G, gens, nargin, g;
    gens:=[];
    nargin := Length(args);
    for g in args do
        gens:=Concatenation(gens,GeneratorsOfGroup(g));
    od;
    G:=Group(gens);
    return G;
end;
