(setf *gl-sum* 0)


(defun sum-lst (xs)
  (dolist (elem xs)
    (incf *gl-sum* elem)))

(sum-lst '(1 2 3))
*gl-sum*


(defun sum-lst-2 (xs)
  (let ((var-sum 0))
    (dolist (elem xs)
      (incf var-sum elem))
    var-sum))


(sum-st '(1 2 3))

    

