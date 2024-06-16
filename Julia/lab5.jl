sqr_2(x) = x*x

@time sqr(3) #tempo de execução da função sqr



@code_typed sqr(3) #tipo de retorno da função sqr

sqr("foo") # É possivel :)

@code_typed sqr("foo") #tipo de retorno da função sqr

@code_llvm sqr(3) #código llvm da função sqr

foo(a) = sqr(a+1)*2 

foo(1)

@code_llvm foo(1) #código llvm da função foo

srq(x) = 42


fact(n) = n == 0 ? 1 : n*fact(n-1)

fact(1000) # Vai dar zero escede o tamanho do inteiro ou seja do argumento


#Different sintax for the same function
function fact(n)
    if n == 0
        return 1
    else
        return n*fact(n-1)
    end
end


#Julia only has expressions 

#foo (..)
#   For I .....
#     If [A]
#       return ..
#

# Try do this it's fun
let a = 1
    a + 3
end + 1


let a = 2
    let a = 1
        a + 3 # a = 1 from the inner let
    end + a # a = 2 from the outer let
end


begin
    println("foo")
    println("bar")
    1 + 2
end


#Alternative

(println("foo"); println("bar"); 1 + 2)


1 => 2

1 => 2 => 3 => 4 => 5


[1, 2 ,3, 4]


(1, 2, 3, 4)

(1, "ss", 3, 4 )

[1, 2, 3, 4.0]

[1, 2, 3, 4.0, "foo"]
