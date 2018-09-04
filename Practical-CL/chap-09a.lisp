; having several "commands" in a function is allowed

(defun f1 (x)
  (format t "~a" x) ; and this makes sense - we print the input value before we calculate
  (+ x 3)) ; and return the calculated value

(f1 3)

; this does NOT make sense (at least not the first line)
(defun f2 (x)
  (+ x 4)
  (+ x 1))

(f2 1)

; this one is fun
(defun f3 (x f)
  (format t "Input=~a" x) ; displays the input value
  (let ((result (funcall f x))) ; calls the supplied function with the supplied value
    (format t "Output=~a" result) ; output the result
    result)) ; return the result

(f3 1 #'(lambda (x) (+ x 1)))
