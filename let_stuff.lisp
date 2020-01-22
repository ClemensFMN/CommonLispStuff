(defun f1 (x)
  (let ((y (+ x 1))) ; introduce a local binding y
    (+ y 1)))

(f1 2) ; => 4

(defun f2 (x y)
  (let ((t1 (+ x 1))
	(t2 (* y 10)))
    (+ t1 t2)))

(f2 1 2) ; => 22

(defun f3 (x)
  (let* ((t1 (+ x 1))   ; let* introduced bindings...
	 (t2 (+ 1 t1))) ; ... which can be used in the next binding
    (+ t1 t2)))

(f3 2) ; => (2+1) + (1+(2+1)) = 7

(defun f4 (x)
  (let ((t1 (+ x 1)))    ; alternative is to use nested let bindings
    (let ((t2 (+ 1 t1)))
      (+ t1 t2))))

(f4 2) ; => 7
