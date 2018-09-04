(setf *gl-sum* 0) ; define global variable

(defun sum-lst (xs)
  (dolist (elem xs) ; iterate over the list
    (incf *gl-sum* elem))) ; and increment the global var

(sum-lst '(1 2 3))
*gl-sum* ; inspect the global var or the effect of the function


(defun sum-lst-2 (xs)
  (let ((var-sum 0)) ; define a local var
    (dolist (elem xs) ; iterate over the list
      (incf var-sum elem)) ; and increment the local var
    var-sum)) ; return the local var

(sum-lst-2 '(1 2 3))


(defun my-range (n)
  (let ((res-lst '())) ; local var is an empty list
    (dotimes (i n)
      (push i res-lst)) ; we repeatedly push an element onto it
    res-lst)) ; and return the list

(my-range 10)

    

