diagonalFilter:=function(T, n)
    local i, M, emb, diag, D, Ts;
    
    Ts:=List([1..n], x->T);   # [T, T, ..., T] (n terms)
    M:=DirectProduct(Ts);
    
    # Construct hatT (the diagonal subgroup)
    emb:=List([1..n], x->Embedding(M,x)); 

    diag:=List(GeneratorsOfGroup(T), i -> Product(List([1..n], x->Image(emb[x],i)) ) );
    D:=Group(diag);;
    IsSubgroup(M,D);          # returns true

    # The filter above hatT is:
    DtoM := IntermediateSubgroups(M,D);;  
    
    # We can view them inside the Hasse diagram of Sub[M] as follows:
    L := GraphicSubgroupLattice(M);
    # The same could have been achieved more efficiently with:
    for k in [1..Size(DtoM.subgroups)] do
        InsertVertex(L, DtoM.subgroups[k]); 
    od;
end;
