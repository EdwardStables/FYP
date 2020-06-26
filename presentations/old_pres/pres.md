# Static Optimisation in Julia

---
# Aim

- Develop packages that offer native optimisation algorithms in Julia

- Packages should be performant and easy to understand/extend

- Packages should be well tested and documented

---
# Why Julia?

- Fast - approaches C in some situations

- Easy to write - can express algorithms at a high level

- Feature rich - language allows for many ways of expressing programs


---
# Optimisation in Julia

- Mature optimisation community 

- Very interesting packages for interfacing with algorithms (`JuMP`, `MathOptInterface`)


---

# The Packages 

Each implements a framework for the development of a class of algorithms:

- Row Action Methods (e.g. Hildreth's Algorithm)

- Direct Search (e.g. MADS)

---
# Row Action Methods

---
# Row Action Methods

- Class of algorithms that operate on one row of a problem matrix at a time.

- Suited to very large, sparse problems. 

- Doesn't appear to be any available software packages for these algorithms.

---
# `RowActionMethods.jl`

- Interface with `MathOptInterface`

- Abstract away interfaces and performance critical operations

- Include Hildreth's algorithm as an example algorithm

---
# Algorithm API 1
<table>
  <tr>
    <th>Function/Struct</th>
    <th>Operation</th>
  </tr>
  <tr>
    <td><pre>ModelFormulation</pre></td>
    <td>Supertype that all problem structs inherit from</td>
  </tr>
  <tr>
    <td><pre>GetModel</pre></td>
    <td>Return an instance of the problem struct</td>
  </tr>
  <tr>
    <td><pre>Iterate!</pre></td>
    <td>Perform one iteration of the algorithm</td>
  </tr>
  <tr>
    <td><pre>SetObjective!</pre></td>
    <td>Add an objective function to the problem struct</td>
  </tr>
</table>

---
# Algorithm API 2

<table>
  <tr>
    <th>Function/Struct</th>
    <th>Operation</th>
  </tr>
  <tr>
    <td><pre>BuildModel!</pre></td>
    <td>Form internal variables once problem is defined</td>
  </tr>
  <tr>
    <td><pre>IsEmpty!</pre></td>
    <td>Define if the problem struct is empty</td>
  </tr>
  <tr>
    <td><pre>VariableValue</pre></td>
    <td>Return the internal variable values</td>
  </tr>
  <tr>
    <td><pre>ObjectiveValue</pre></td>
    <td>Return the final objective cost</td>
  </tr>
</table>

---
# Creating an algorithm
Just need to implement the `iterate!` function:

    !julia
    function Iterate!(model::HildrethModel)
        λ = model.λ
        model.λ_old = copy(λ)
        H = model.H
        K = model.K
    
        for (i,l) in enumerate(λ)
            w = (H[i:i,:] * λ)[1] - H[i,i] * l
            w += K[i]
            w /= -H[i,i]
            λ[i] = max(0, w)
        end
    end
---
# Things handled by the package

- Linear constraint storage 
- In-place reformulation of constraints
- Status tracking (iterations, number of constraints, variables, termination reasons)
- `MathOptInterface` integration

---
# Progress

- Base framework is in place

- Constraint modification works well

- Base compatibility with `MathOptInterface` is done

---

# Next Steps

- Increased testing and code optimisation

- Improving the compatibility with `MathOptInterface` for general reformulation

- Benchmarking

---
# Direct Search

---
# Direct Search

- Derivative free class of algorithms

- Suited to functions that are expensive to evaluate and/or noisy

- Main implementation in the NOMAD software package

---
# General Direct Search Algorithm

- Define a mesh of points in the search space
- `search` stage generates points on mesh via an arbitrary strategy
- `poll` stage is a well defined exploration of the space around the incumbent point
- Mesh size is varied depending on outcome of `search` and `poll`

---
# `DirectSearch.jl`

- Easily attach objective and constraint functions
- Load and save current optimisation status 
- Be able to add custom implementations of each stage
- Customise operation by overriding inbuilt functions

---
# Sections

- Main customisable areas:
    - `search` point generation
    - `poll` direction and point generation
- Additional Customisation:
    - Function calling (distributed etc.)
- Constant:
    - Caching
    - Report generation
---
# Progress

- LTMADS Algorithm is implemented
- Framework for custom `search` and `poll` steps are in place
- Simple report generation
- Robust caching
- Distributed function evaluation

---
# Next Steps
- Constraints
- Expanding cache contents
- Formalise report format
- Load report data
- Benchmarking 

---
# Questions?
