(defun make-even (x)
  (if (evenp x) x (+ x 1)))

(make-even 2)
(make-even 3)

(defun ordered (x y)
  (if (< x y) (list x y) (list y x)))

(ordered 3 4)
(ordered 4 3)

(defun my-abs (x)
  (cond ((< x 0) (- x))
	(t x)))

(my-abs -2)
(my-abs 2)
(my-abs 0)


