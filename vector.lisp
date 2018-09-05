(defparameter *board*
    (vector (vector '(1) '(3) '(6))
	    (vector '(2) '(5) '(8))))

*board*


(defun get-board-pos (row col)
  (elt
   (elt *board* row) col))

(get-board-pos 1 2)

