# Projection returns a stored projection function of a direct 
# or semidirect product. It thus applies only to the full product.
# However, as it is a homomorphism, it of course can be applied 
# to any subgroup of the product, so you could take for example

proj:=Projection(G1xG2,1);
Image(proj,HxK);

# If you want to restrict the projection to the subgroup 
# (primarily of relevance for computing pre-images) you could use

rest:=RestrictedMapping(proj,HxK);

intsub:=IntermediateSubgroups(G1xG2, HxK);
S:=intsub.subgroups[1];
Projection(S, 1);  # returns an error, as above.

# Is there is command for changing the current working directory in GAP?
# In the IO package there is IO_chdir if you are working under Unix.
