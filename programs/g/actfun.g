# See page 400 of the manual.
actfun:=function(x,h) 
    return Image(p[1],h)^-1*x*Image(p[2],h);
end;

