function [ x ] = cycle( x , y )
    if x <= 0
        x = cycle(y+x,y);
    end
    if x > y
        x = cycle(x-y,y);
    end
end

