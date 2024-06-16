(Defun SQR (x) (* x x))

(mapcar #'sqr (List 1 2 3)) -> (1 4 9)

(mapcar (lambda(x)(+ 1 (* 2 x))) (List 1 2 3)) -> (3 5 7)


(Defun sum_new (f a b)
    (If (> a b)
        0
        (+ (funcall f a) (sum_new f (+ a 1) b))))


(sum_new (lambda (x) (+ 1 (* 2 x))) 1 10) = 120

(sum_new (lambda (x) (+ 1 (* 2 x))) 1 3) = 15

(defun double(x) (+ x x))

(defun reflexive(Name Op)
    (list 'defun (list Name 'x))(list Op 'x 'x))

(reflexive 'double '+) -> retorna o corpo da função e não declara a função. Objetivo errado mas resultado do codigo interessante

(defun reflexive (Name Op)
  (eval `(defun ,Name (x) (,Op x x))))

(reflexive 'Bolacha '+) -> cria uma função chamada bolacha na qual aplica a dupla soma do valor dado 

Extra uso de macros porque eval é sus no :common-lisp

(defmacro reflexive (Name Op)
  `(defun ,Name (x) (,Op x x)))

(reflexive Bolacha +) -> cria uma função chamada bolacha na qual aplica a dupla soma do valor dado sem plicas de ser 
                        uma propriedade das macros que assumo logo que os argumentos são simbolos 

(bolacha 4) -> 8