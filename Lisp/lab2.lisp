(setq s (cons (cons 1 (cons 2 3)) (cons 4 5)))


(car(car s)) = 1

(caar s)

(car (cdr (car s))) = 2

(cadar s)

(cdr (cdr (car s))) = 3

(cddar s)

(car (cdr s)) = 4

(cadr s)

(cdr (cdr s)) = 5

(cddr s)

(setq l (cons 1 (cons 2 (cons 3 (cons 4 Nil)))))

(car l) = 1

(cdr l) = (2 3 4)

(cddr l) = (3 4)

(caddr l) = 4


(defun Lenght (v)
  (if (eq v nil)
      0
    (+ 1 (Lenght (cdr v)))))

or

(defun Lenght (v)
  (if (null v)
      0
    (1+ (Lenght (cdr v)))))

or

# empty does not exist in my clisp
(defun Lenght (v)
  (if (empty v)
      0
    (1+ (Lenght (rest v)))))


(defun fold (c i l) 
  (if (null l)
      i
    (funcall c (first l) (fold c i (rest l)))))

(fold #'+ 0 '(1 2 3 4)) = 10

(fold #'* 1 '(1 2 3 4)) = 24

(fold #'cons nil '(1 2 3 4)) = (1 2 3 4)



(defun append_lists(l1 l2)
  l2
  (cons (first l1) (append (rest l1) l2)))