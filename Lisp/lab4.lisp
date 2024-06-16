(List '+ 1 2) -> (+ 1 2)

(Eval (List '+ 1 2)) -> 3


(Let ((x 2))
    (Eval (Let ((x 1))
            (List '+ x 1)))) -> 3


(defun devide-or-false (x y)
    (and (not (= y 0)) (/ x y)))

(devide-or-false 270 32) -> 135/16 = 8.4375

(devide-or-false 270 0) -> nil

(defun and_1 (e1 e2)
    (if e1 
        e2
        nil))

(and_1 1 2) -> 2

(and_1 1 0) -> 0

(and_1 0 1) -> 1

(and_1 0 0) -> 0

(and_1 1 (List 'devide-or-false 3 1)) -> (devide-or-false 3 1)

(and_1 1 (devide-or-false 3 0)) -> nil

(and_1 (devide-or-false 3 1) (devide-or-false 2 0)) -> nil

(and_1 (devide-or-false 3 0) (devide-or-false 2 1)) -> nil


(defun and_2 (e1 e2)
    (if (Eval e1)
        (Eval e2)
        nil)) -> It can be used with any type of data


(and_2 (List 'and_1 1 2) (List 'and_1 1 2)) -> 2

(and_2 (List 'and_1 1 2) (List 'and_1 1 1)) -> 1

(and_2 (List 'and_1 1 2) (List 'and_1 0 0)) -> 0

(and_2 (List 'and_1 1 2) (List 'devide-or-false 3 1)) -> 3

(and_2 (List 'and_1 1 0) (List 'devide-or-false 3 0)) -> nil

(and_2 (List 'and_1 1 2) (List 'devide-or-false 6 1)) -> 6

(and_2 (List 'and_1 6 1) (List 'devide-or-false 4 1)) -> 4

(and_2 (List 'and_1 1 0) (List 'devide-or-false 3 2)) -> 3/2

(and_2 2 8) -> 8


(defun not_1(e) 
    (if e
        nil
        t))

(not_1 1) -> nil

(not_1 (devide-or-false 3 1)) -> nil

(not_1 (devide-or-false 3 0)) -> t


(defun and_3 (e1 e2)
    (if e1
        (Eval e2)
        nil))

(defun devide-or-false_2 (x y)
    (if (not (= y 0))
        (/ x y)
        nil))


(and_3 (devide-or-false_2 3 1) (List 'devide-or-false_2 2 1)) -> 2

(and_3 (devide-or-false_2 3 1) (List 'devide-or-false_2 2 0)) -> nil

(and_3 (devide-or-false_2 3 0) (devide-or-false 3 1)) -> nil

(and_3 (devide-or-false_2 3 1) (not_1 (devide-or-false 3 0))) -> t

(and_3  (not_1 (devide-or-false 3 0)) (devide-or-false_2 3 1)) -> 3

(and_3  (not_1 (devide-or-false 3 0)) (not_1 (devide-or-false_2 3 1))) -> nil

(and_3  (not_1 (devide-or-false 3 0)) (not_1 (devide-or-false_2 6 0))) -> t


(defmacro and_4 (e1 e2)
    `(if ,e1
        ,e2
        nil))

(and_4 (devide-or-false_2 3 1) (devide-or-false_2 2 1)) -> 2

(and_4 (devide-or-false_2 3 1) (devide-or-false_2 2 0)) -> nil

(and_4 (devide-or-false_2 3 0) (devide-or-false 3 1)) -> nil

(and_4 (devide-or-false_2 3 3) (devide-or-false_2 3 1)) -> 3

(defmacro or_1 (e1 e2)
    `(if ,e1
        ,e1
        ,e2))

(or_1 1 2) -> 1

(or_1 0 2) -> 2

(or_1 (devide-or-false_2 3 1) (devide-or-false_2 2 1)) -> 3

(or_1 (devide-or-false_2 3 1) (devide-or-false_2 2 0)) -> 3

(or_1 (devide-or-false_2 3 0) (devide-or-false 3 0)) -> nil

(or_1 (devide-or-false_2 3 2) (not_1 (devide-or-false_2 3 0)))

(or_1 (not_1 (devide-or-false_2 3 0)) (not_1 (devide-or-false_2 6 0))) -> t


(defmacro or_2 (e1 e2)
    '(let ((R e1))
        (if R
            R
            'e2)))

(or_2 (List 'devide-or-false_2 3 1) (List 'devide-or-false_2 2 1)) -> (LET ((R E1)) (IF R R 'E2))

(or_2 (devide-or-false_2 3 1) (devide-or-false_2 2 0)) -> (LET ((R E1)) (IF R R 'E2))

(defmacro or_3 (e1 e2)
    (Let ((R (gensym)))
        `(let ((,R ,e1))
            (if ,R
                ,R
                ,e2))))

(or_3 (devide-or-false_2 3 1) (devide-or-false_2 2 1)) -> 3

(or_3 (devide-or-false_2 3 0) (devide-or-false_2 2 0)) -> nil

(or_3 (devide-or-false_2 3 1) (devide-or-false_2 2 0)) -> 3

(or_3 (devide-or-false_2 3 0) (devide-or-false_2 2 1)) -> 2

(or_3 (not_1 (devide-or-false_2 3 1) ) (List 'not_1 (devide-or-false_2 2 0))) -> (NOT_1 NIL)

(or_3 (not_1 (devide-or-false_2 3 1) ) (List 'not_1 (devide-or-false_2 2 1))) -> (NOT_1 2)

(or_3 (List 'not_1 (devide-or-false_2 3 1) ) (List 'not_1 (devide-or-false_2 2 1))) -> (NOT_1 3)

(or_3 (List 'not_1 (devide-or-false_2 3 0) ) (List 'not_1 (devide-or-false_2 2 0))) -> (NOT_1 NIL)

(or_3 (not_1 (devide-or-false_2 3 1) ) (not_1 (devide-or-false_2 2 1))) -> nil

(or_3 (not_1 (devide-or-false_2 3 0) ) (not_1 (devide-or-false_2 2 0))) -> t

(or_3 (not_1 ( List 'devide-or-false_2 3 0) ) (not_1 (devide-or-false_2 2 0))) -> t

(or_3 (not_1 ( List 'devide-or-false_2 3 0) ) (not_1 (List 'devide-or-false_2 2 0))) -> nil

