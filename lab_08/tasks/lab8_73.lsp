(defun f (lst)
	(cond ((null lst) nil)
		  ((and (listp (car lst)) (> (length (car lst)) 0)) (car lst))
		  (t (f (cdr lst))))
)

;------------------------------

(defun sum-list (lst sum)
	(cond ((null lst) sum)
		  ((numberp (car lst))(sum-list (cdr lst) (+ sum (car lst))))
		  ((listp (car lst))(sum-list (cdr lst) (sum-list (car lst) sum)))
		  (t (sum-list (cdr lst) sum))
	)
)

(defun find-sum-list(lst)
	(if (null lst)
		nil
	    (sum-list lst 0))
)