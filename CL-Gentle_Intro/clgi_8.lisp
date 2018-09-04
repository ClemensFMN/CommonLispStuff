(defun any-even (xs)
  (cond ((null xs) nil)
	((evenp (first xs)) t)
	(t (any-even (rest xs)))))

(any-even '(1))
(any-even '(2))
(any-even '(1 2 3))

(defun all-even (xs)
  (cond ((null xs) nil)  ; one of the stop cases -> return nil for an empty list
	((oddp (first xs)) nil) ; if an element is odd, stop & return nil
	((if (= 1 (length xs)) (evenp (first xs)))) ; other stop case: last item in list & even -> true
	(t (all-even (rest xs))))) ; otherwise -> continue with rest of list

(all-even '(1))
(all-even '(2))
(all-even '(2 4))
(all-even '(2 1))
(all-even '(1 2 1))


(defun laugh (n)
  (cond ((zerop n) '())
	(t (cons 'ha (laugh (- n 1))))))

(laugh 5)
(laugh 0)



(defun my-nth (n xs)
  (cond ((zerop n) (first xs))
	(t (my-nth (- n 1) (rest xs)))))

(my-nth 2 '(1 2 3 4))

(defun count-up (n)
  (defun count-up-int (cnt n)
    (cond ((= cnt n) nil)
	  (t (cons cnt
		   (count-up-int (+ 1 cnt) n)))))
  (count-up-int 0 n))

(count-up 10)


(defun pairings (lst1 lst2)
  (cond ((null lst1) '())
	(t (cons (list (first lst1) (first lst2))
		 (pairings (rest lst1) (rest lst2))))))

(pairings '(1 2 3) '(10 11 12))


(defun my-mapcar (f xs)
  (cond ((null xs) '())
	(t (cons (funcall f (first xs))
		 (my-mapcar f (rest xs))))))

(my-mapcar #'(lambda (x) (+ x 1)) '(1 2 3))
