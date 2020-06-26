function my_add_function(a::Int, b::Int)
    return a + b
end

function my_add_function(a::String, b::String)
    return a * b
end

function my_add_function(a::String, b::Int)
    return a * string(b)
end

my_add_function(1, 2)
> 3
my_add_function("hello ", "world")
> "hello world"
my_add_function("hello ", 2)
> "hello 2"


