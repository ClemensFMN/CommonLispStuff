(defparameter *board*
    (vector (vector '(1) '(3) '(6))
	    (vector '(2) '(5) '(8))))

*board*


(defun get-board-pos (row col)
  (elt
   (elt *board* row) col))

(get-board-pos 1 2)


(defun uneq (x y)
  (not (= x y)))

(uneq 2 3)

(defun coords-row-neighbours (row col)
  (loop for i from 0 to 9 when (uneq i col) collect (list row i)))

(coords-row-neighbours 2 4)


(defun coords-col-neighbours (row col)
  (loop for i from 0 to 9 when (uneq i row) collect (list i col)))

(coords-col-neighbours 2 4)

