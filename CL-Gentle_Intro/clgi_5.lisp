(defun f1 (x y)
  (let ((v1 (+ x y)))
    (list x y v1)))

(f1 2 3)


(defun f2 (x y)
  (let ((v1 (+ x y))
	(v2 (- x y)))
    (list x y v1 v2)))

(f2 1 2)

(defun f3 (x y)
  (let* ((v1 (+ x y))
	 (v2 (+ 1 v1))) ; we want to access v1 here -> we need a let* binding
    (list x y v1 v2)))

(f3 1 2)
