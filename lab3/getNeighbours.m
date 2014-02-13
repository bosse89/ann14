function [ nList ] = getNeighbours(m, p, d )
%getNeighbours Get a list of neighbours
%   getNeighbours returns a list with all neighbours
%   d distance away from point p (x,y) in a matrix 
%   with dimensions m (xsize,ysize)
    x = p(1);     y = p(2);
    xsize = m(1); ysize = m(2);
    i = 1;
    nList = [];
    for vy = max(0,(y-d)):min(ysize,(y+d))
       for vx = max(0,x-(d-abs(vy-y))):min(xsize,x+(d-abs(vy-y)))
          nList(i,1) = vx;
          nList(i,2) = vy;
          i = i+1;
       end
    end
end

