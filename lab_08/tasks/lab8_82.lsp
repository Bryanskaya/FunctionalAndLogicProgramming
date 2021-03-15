(defun f1 (lst)
	(mapcar #'(lambda (x) (- x 10)) lst)
)

(defun f2 (lst)
	(cond ((null lst) nil)
		  (t (cons (- (car lst) 10) (f2 (cdr lst)))))
)