SubgroupsOfLattice := function(l)
    local i, j, subgp;
    subgp := ConjugacyClassesSubgroups(l);
    for i in [1..Size(subgp)] do   
        #i - index of class
        Print("Class - ", i, " Order - ", Size(subgp[i][1]),
              " Subgroups - ");
        for j in [1..Size(subgp[i])] do 
            #j - index of subgroup in class
            Print(i, ".", j, " ");
        od;
        Print("\n");
    od;
end;


SubgroupsOfSubgroup := function(lat, cl, nr)
    local i, j, subgps;
    subgps := ConjugacyClassesSubgroups(lat);
    if (cl > Size(subgps)) then
        return 0;
    fi;
    if (nr > Size(subgps[cl])) then
        return 0;
    fi;
    Print("Subgroups of ", cl, ".", nr,
          " (order ", Size(subgps[cl][nr]), ") - ");
    for i in [1..Size(subgps)] do  # i is the index of the class
        for j in [1..Size(subgps[i])] do
            if (IsSubgroup(subgps[cl][nr], subgps[i][j])) then
                if (Size(subgps[cl][nr]) > Size(subgps[i][j])) then
                    Print(i, "." , j, " ");
                fi;
            fi;
        od;
    od;
    Print("\n");
end;


ContainmentsInLattice := function(l)
    local i, j, subgp;
    subgp := ConjugacyClassesSubgroups(l);
    for i in [1..Size(subgp)] do
        #i - index of class
        for j in [1..Size(subgp[i])] do
            #j - indes of subgroup in class
            SubgroupsOfSubgroup(l, i, j);
        od;
    od;
end;
