; defining a global list with 10 elements
(defparameter *x* (make-array 10))

; printing the list in good old imperative style
(dotimes (i 10)
  (print (elt *x* i)))

; and setting elements in good old imperative style
(dotimes (i 10)
  (setf (elt *x* i) i))

; we can do this also via a loop construct
(defparameter *x2* (loop for i to 10 collect i))

; using a do loop to build a loop from A to B is complicated...
(do ((i 1 (1+ i)))
    ((>= i 5))
  (print i))

; ... why not practise and use a macro?
(defmacro loop-a-b (a b var &rest body)
  `(do ((,var ,a (1+ ,var)))
       ((>= ,var ,b))
    ,@body))

(macroexpand-1 '(loop-a-b 1 5 i (print i)))

(loop-a-b 1 5 i (progn 
                  (print i)
                  (print (1+ i))
                  (print "XXX")))

; loop is already there and simplifies things for us...
(loop for i from 1 to 10
  do
    (print i))

; adding conditions to the loop
; either this way
(loop for i from 1 to 10 do
  (when (evenp i)) (print i))

; or this way
(loop for i from 1 to 10 
  when (evenp i) collect i)

; find all indices of lst with value = val
(defun findi (lst val)
  (loop for i from 0 to (1- (length lst))
    when (= val (elt lst i)) collect i))

(findi #(1 2 3 4 3 2 1) 2)

; find all indices of lst with pred list-item = true
(defun findip (lst pred)
  (loop for i from 0 to (1- (length lst))
    when (funcall pred (elt lst i)) collect i))

(findip #(1 2 3 4 3 2 1) (lambda (x) (= x 2)))
(findip #(1 2 3 4 3 2 1) (lambda (x) (> x 2)))

; find indices and values of lst with pred list-item = true
(defun findivp (lst pred)
  (loop
     for item in lst ; iterate over the list
     for i from 0    ; and in parallel, create an index
        when (funcall pred item)
           collect (list i item))) ; when(pred item = true) , collect i item in a list

(findivp '(1 2 3 4 3 2 1) (lambda (x) (> x 2)))
       
(loop for i from 0 to 5
     collect i)

(loop for i from 0 to 5
   for j from 0 to 5
	  collect (list i j)) ; NOT a nested loop

; NESTED LOOP - from https://stackoverflow.com/questions/40812080/nested-loops-using-loop-macro-in-common-lisp
(loop for x from 1 to 5
      append (loop for y from 1 to 5
                   collect (list x y)))
