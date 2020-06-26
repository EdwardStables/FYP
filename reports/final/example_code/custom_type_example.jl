abstract type Node end

struct BinaryNode <: Node
    left_child::Node
    right_child::Node
end

struct NaryNode <: Node
    children::Vector{Node}
end

struct EndNode <: Node
    val::Int
end

function TraverseTree(t::BinaryNode)
    TraverseTree(t.left_child)
    TraverseTree(t.right_child)
end

function TraverseTree(t::NaryNode)
    map(TraverseTree, t.children)
end

function TraverseTree(t::EndNode)
    println(t.val)
end
