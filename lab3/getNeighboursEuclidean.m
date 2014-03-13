function [ nList ] = getNeighboursEuclidean(m, p, r )
%getNeighbours Get a list of neighbours
%   getNeighboursEuclidean returns a list with all neighbours
%   d Euclidean distance away from point p (x,y) in a matrix 
%   with dimensions m (xsize,ysize)
    x = p(1);     y = p(2);
    xsize = m(1); ysize = m(2);
    i = 1;
    nList = [];
    for a = max(1,x-r):min(xsize,x+r)
        for b = max(1,y-r):min(ysize,y+r)
            if (a-x)^2+(b-y)^2 <= r^2
                nList(i,1) = a;
                nList(i,2) = b;
                i = i+1;
            end
        end
    end
end

