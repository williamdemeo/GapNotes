isIsomorphicInterval:=function(list1, list2)
    # Gap function for testing whether two sets of covering relations 
    # are the same modulo relabelling. 
    
    local n, m, j, list3, G, p;
    
    if not IsList(list1) or not IsList(list2) then
        Error("usage: isIsomorphicInterval( <lst1>, <lst2> );");
    fi;
    if Length(list1) <> Length(list2)  then
        return false;
    fi;
        
    list1 := SSortedList(list1);
    list2 := SSortedList(list2);

    n:=Length(list1);
    
    m:=Maximum(Maximum(list1));
  
    G:=SymmetricGroup(m);
    
    for p in Elements(G) do
        list3 := [[ ]];
        for j in [1..n] do
            list3[j]:=List(list1[j], x->((x+1)^p)-1); 
        od;
        list3:=SSortedList(list3);
        if list3=list2 then
            return true;
        fi;
    od;
    return false;
end;

       
            

    

