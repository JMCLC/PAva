:(1+2)

dump(:(1+2))

Struct Expr
  head::Symbol
  args::Array{Any,1}
end

Struct Foo
    bar
    baz
end

F = Foo(1,"hi") -> bar = 1, baz = "hi"

F.bar -> 1
F.baz -> "hi"

+(1, 2, 3, 4, 5)

1 + 2 + 3 + 4 + 5

(:(1 + 2)).head

(:(1 + 2)).args

(:(a + b)).args 

(:(a + b*c)).args

:(+(1,2))


Expr(:call, [:+, 1, 2])


Expr(:call, :+, 1, 2)

Expr(:call, :+, 1, Expr(:call, :*, 2, 3))


eval(Expr(:call, :+, 1, Expr(:call, :*, 2, 3)))

let a = 1, b = 2,
    eval(Expr(:call, :+, a, b))
end

not(b) = b ? false : true 

not(true) 
not(false)

and(a, b) = a ? b : false

and(true, true)

and(true, false)

and(false, true)

and(false, false)


safe_division(x, y) = and(not(y == 0), x/y)

safe_division(6,2)

safe_division(6,0)

safe_sqrt(x) = and(x >= 0, sqrt(x))

safe_sqrt(4)

safe_sqrt(-4)

JAVA note  

Boolean a 

Boolean b

a && b

Foo() && bar()

not that good 

but 

foo() & bar()


and(a1,b1) = eval(b1) ? eval(a1) : false

x = 4


and(:(x >= 0), :(sqrt(x)))

x = -4

and(:(x >= 0), :(sqrt(x)))


safe_sqrt(x) = and(:(x >= 0), :(sqrt(x)))



macro and(b1, b2)
    eval(b1) ? eval(b2) : false
end

and(:(x >= 0), :(sqrt(x)))

dump(:(a > b ? a : b))

Para fazer condicionadas temos de fazer dump para sacar as informação que precisamos



function and(b1, b2)
    Expr(: (b1, b2, false))
end

and(:(x >= 0), :(sqrt(x)))

safe_sqrt(x) = and(:(x >= 0), :(sqrt(x)))

macro and(b1, b2)
    Expr(:if, b1, b2, false)
end

x = 4

and(:(x >= 0), :(sqrt(x)))

safe_sqrt(x) = @and(x >= 0, sqrt(x))

safe_sqrt(4)

safe_sqrt(-4)


Quando estamos a desenvolver macros temos de ver o código que estamos a gerar

macro and(b1,b2)
    esc(:(b1 ? b2 : false))
end

@macroexpand @and(x >= 0, sqrt(x))


macro and(b1, b2)
    esc(:($b1, $b2, false))
end 

Meta.parse("a + b")

a = 2

b = 4

eval(Meta.parse("a + b"))

