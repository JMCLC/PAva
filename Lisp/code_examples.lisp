(defun factorial (n) (if (= n 0)
    1
    (* n ( !(- n 1)))))

#To execute the function example:

    (factorial 5)
 
    The output will be 120.


( defun addtwo (a b) (+ a b) )

#To execute the function example:

    (addtwo 5 6)
 
    The output will be 11. 


(defun tailfact (n &optional (intermidiate 1)) 
    (if (= n 0)
        (return-from tailfact intermidiate)
    (tailfactorial (- n 1) (* n intermidiate))))


