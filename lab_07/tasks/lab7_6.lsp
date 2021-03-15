(defun my-nthcdr (lst n)
	(cond ((= n 0) lst)
		  (t (my-nthcdr (cdr lst) (- n 1)))
	)
)

(defun first-n-elements (lst n)
	(cond ((= n 0) nil)
		  (t (append (cons (car lst) nil)(first-n-elements (cdr lst) (- n 1))))
	)
)

(defun my-length (lst)
	(cond ((null lst) 0)
		  (t (+ 1 (my-length (cdr lst))))
	)
)

(defun swap-to-left (lst n)
	(cond ((null lst) nil)
		  ((< n 0)(print "ERROR: wrong number (<0)"))
		  ((> n (my-length lst))(swap-to-left lst (- n (my-length lst))))
		  (t (append (my-nthcdr lst n) 
			         (first-n-elements lst n)))
	)
)

(defun swap-to-right (lst n)
	(cond ((null lst) nil)
		  ((< n 0)(print "ERROR: wrong number (<0)"))
		  ((> n (my-length lst))(swap-to-right lst (- n (my-length lst))))
		  (t (append (my-nthcdr lst (- (my-length lst) n)) 
					 (first-n-elements lst (- (my-length lst) n))))
	)
)