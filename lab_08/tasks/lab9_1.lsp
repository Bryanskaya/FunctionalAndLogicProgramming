;Написать функцию, которая выбирает из заданного списка только числа между двумя заданными границами
(defun find-elements (lst left right)
	(remove-if-not #'(lambda (x) (< left x right)) lst)
)

(defun select-between (lst b1 b2)
	(cond ((null lst) nil)
		  ((not (and (numberp b1) (numberp b2)))(and (print "ERROR: wrong format of borders") nil))
		  ((= b1 b2)(and (print "ERROR: wrong format of borders (equal)") nil))
		  ((> b1 b2)(find-elements lst b2 b1))
		  ((> b2 b1)(find-elements lst b1 b2)))
)


;Написать функцию, вычисляющую декартово произведение двух своих списков-аргументов. 
(defun decart (lstx lsty)
	(mapcan #'(lambda (x)
				(mapcar #'(lambda (y)
						(list x y)) lsty)) lstx)
)

;Написать функцию, которая вычисляет сумму длин всех элементов списка
(defun count-length (lst len)
	(cond ((null lst) len)
		  ((atom (car lst))(count-length (cdr lst) (+ len 1)))
		  (t (count-length (cdr lst) (count-length (car lst) len))))
)

(defun count-list-length (lst)
	(count-length lst 0)
)


(defun count-list-length-2 (lst)
	(reduce #'(lambda (x y) 
				(+ x (cond ((null y) 1)
						   ((listp y) (count-list-length-2 y))
						   (t 1)))
			  )
		lst
		:initial-value 0
	)
)


;Используя рекурсию, написать функцию, которая по исходному списку строит список 
;квадратов чисел смешанного структурированного списка.
(defun find-square (lst)
	(cond ((null lst) t)
		  ((listp (car lst))(find-square (car lst)))
		  ((numberp (car lst))(and (rplaca lst (* (car lst) (car lst)))
								   (find-square (cdr lst))))
		  (t (find-square (cdr lst))))
	lst
)