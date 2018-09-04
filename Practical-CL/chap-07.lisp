(dotimes (i 5)
  (print i))

; some attempt to use a normal variable and update it within the loop
(let ((sum 0))
  (dotimes (i 5)
    (setf sum (+ sum i)))
  sum)

; now inside a function...
(defun sum-ints (n)
  (let ((sum 0))
    (dotimes (i (+ n 1))
      (setf sum (+ sum i)))
    sum)) ; this one feels a bit strange; I thought I need to provide sum one level "further up; i.e. one ) later...

(sum-ints 5)


(loop for i from 1 to 10 collecting i)

(loop for i from 1 to 10 sum i)
