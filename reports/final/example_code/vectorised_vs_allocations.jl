f(x,y) = sum(x*y)

function g(x,y)
    s = 0
    for i = 1:1000
        for j = 1:1000
            s += x[i,j]*y[j]
        end
    end
    return s
end

function g(s,x,y)
    for i = 1:1000
        for j = 1:1000
            s += x[i,j]*y[j]
        end
    end
end


global a = rand(1000, 1000)
global b = rand(1000)

sum(a*b)
f(a,b)
g(a,b)
s = 0
g(s, a, b)

t1() = @time sum(a*b)
t2() = @time f(a,b)
t3() = @time g(a,b)

s = 0
t4() = @time g(s, a, b)

t1() 
t2() 
t3() 

s = 0
t4() 
