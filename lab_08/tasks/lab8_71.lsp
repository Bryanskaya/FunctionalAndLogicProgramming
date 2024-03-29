(defun mult (lst n)
	(mapcar #'(lambda (x) (* x n))
			lst)
)

(defun mult-all (lst n)
	(mapcar #'(lambda (x) 
				(cond ((numberp x)(* x n))
					  ((listp x)(mult-all x n))
					  (t x)))
			  lst)
)

(defun mult-all-2 (num lst)
	(cond 	( (null lst) lst)
			( (listp (CAR lst)) 
				(cons 	(mult-all-2 num (CAR lst)) 
						(mult-all-2 num (CDR lst))))
			( (numberp (CAR lst))
				(cons 	(* num (CAR lst)) 
						(mult-all-2 num (CDR lst))))
			( t 
				(cons 	(CAR lst)
						(mult-all-2 num (CDR lst))))
	)
)

(defun mult-all-4 (num lst res)
	(cond	((null lst) res)
			((listp (car lst))(cons (mult-all-4 num (car lst) res) res))
			((numberp (car lst))(cons 	(cons (car lst) res) 
										(mult-all-4 num (cdr lst) res)))
	)
)


(defun mult-all-3 (num lst)
	(mult-all-4 num lst Nil)
)