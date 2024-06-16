(defun factorial (n) (if (= n 0)
    1
    (* n ( !(- n 1)))))