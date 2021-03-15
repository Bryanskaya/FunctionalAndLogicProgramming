(defun compare (lst1 lst2)
	(mapcar #'(lambda (x) 
				(if (member x lst2 :test #'equal) t)) lst1)
)

(defun set-equal (lst1 lst2)
	(and (every #'(lambda(x) (eql x T))(compare lst1 lst2))
	     (every #'(lambda(x) (eql x T))(compare lst2 lst1)))
)

;---------------------------
(defun compare-2 (lst1 lst2)
	(cond ((null lst1) t)
		  ((member (car lst1) lst2 :test #'equal)(compare-2 (cdr lst1) lst2))
	)
)

(defun set-equal-2(lst1 lst2)
	(and (compare-2 lst1 lst2)
	     (compare-2 lst2 lst1))
)