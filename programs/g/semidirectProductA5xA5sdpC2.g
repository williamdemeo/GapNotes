# As SteveD on math.stackexchange noticed the flaw in the following method 
# of constructing the wreath product.  In fact, since the cyclic group I 
# chose normalizes one of the alternating groups, 
#        
if false then
    A5:=AlternatingGroup(5);
    A5xA5:=DirectProduct(A5,A5);
        
    # To describe the action of C2 on A5xA5, we need the generators of C2:
    C2:=Group([(1,2)]);
    gens:=GeneratorsOfGroup(C2);
    actions:=List(gens, i->ConjugatorAutomorphism(A5xA5,i));
    alpha:=GroupHomomorphismByImages(C2, Group(actions), gens, actions);        
    
    # Now we can form the semidirect product of C2 acting on S3xS3 via alpha:
    G:=SemidirectProduct(C2,alpha,A5xA5);
    
    # The following command fairly quickly produces the normal subgroups.
    nsg:=NormalSubgroups(G);
    
    for N in nsg do Print(StructureDescription(N),",  "); od; 
    # produces the output     1,  A5,  A5,  A5 x A5,  S5,  S5 x A5,  
fi;
    
# Here is code that works:
A5:=AlternatingGroup(5);
C2:=CyclicGroup(2);
G:=WreathProduct(A5,C2);
nsg:=NormalSubgroups(G);
    
     
