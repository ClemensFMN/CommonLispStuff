

(defun pm-val (x)
  (list x (- x)))

(pm-val 3)
(pm-val -4)

(defun my-abs (x)
  (cond ((< x 0) (- x))
        (t x)))

(my-abs -3)
(my-abs 3)

(defun pm-val-2 (x)
  (list (- (my-abs x)) (my-abs x)))

(mapcan #'pm-val-2 '(1 2 3))

; simle find in a list
(defun my-find (val lst)
  (cond ((null lst) nil)
        ((= val (car lst)) t)
        (t (my-find val (cdr lst)))))


(my-find 2 '(1 2 3 4))
(my-find 20 '(1 2 3 4))

; more abstract as it allows the user to provide the test function
(defun my-find-2 (fn lst)
  (cond ((null lst) nil)
        ((funcall fn (car lst)) t)
        (t (my-find-2 fn (cdr lst)))))
  

(my-find-2 #'(lambda (x) (= x 2)) '(1 2 3 4))
(my-find-2 #'(lambda (x) (= x 20)) '(1 2 3 4))
(my-find-2 #'(lambda (x) (> x 2)) '(1 2 3 4))

; returning the index of the first match
(defun my-find-ind (val lst)
  (defun intrnl (pos val lst)
    (cond ((null lst) nil)
          ((= val (car lst)) pos)
          (t (intrnl (+ 1 pos) val (cdr lst)))))
  (intrnl 0 val lst))

(my-find-ind 2 '(1 2 3 4))
(my-find-ind 1 '(1 2 3 4))
(my-find-ind 5 '(1 2 3 4))

;returning a list of indices of all matches
(defun my-find-ind* (val lst)
  (defun intrnl (pos pos-acc val lst)
    (cond ((null lst) (reverse pos-acc))
          ((= val (car lst)) (intrnl (+ 1 pos) (cons pos pos-acc) val (cdr lst))) 
          (t (intrnl (+ 1 pos) pos-acc val (cdr lst)))))
  (intrnl 0 nil val lst))

(my-find-ind* 2 '(1 2 3 4))
(my-find-ind* 1 '(1 2 3 4))
(my-find-ind* 5 '(1 2 3 4))
(my-find-ind* 2 '(1 2 3 4 2))

; retrieve largest element (based on predicate function fn) of a list
(defun my-most (fn lst)
  (if (null lst); list nil -> stop
      (values nil nil)
      (let* ((max-el (car lst)) ; set first element to max
             (max-val (funcall fn max-el)))
        (dolist (obj (cdr lst)) ; iterate over remainder of the list
          (let ((cur-val (funcall fn obj)))
            (when (> cur-val max-val) ; check if we are better than current maximum
              (setq max-val cur-val; if yes, update max-val and max-element
                    max-el obj))))
        (values max-el max-val))))

(my-most #'max '(1 2 3))
(my-most #'max '(1 20 3))
(my-most #'length `((1 2 3) (1 2)))
(my-most #'length `((1 2 3) (1 2) (1 2 3 4)))


(do ((nums nil) ; init variables are an empty list
     (i 2 (+ 0.5 i))) ; and the value i = 2 which is increemented by 0.5 in every loop
    ((> i 5) (nreverse nums)) ; stop criteria is i>5 and afterwards we reverse the list
  (push i nums)) ; in every loop iteration, we add i to the list

(defun my-range (start stop incr)
  (do ((nums nil)
       (i start (+ incr i)))
      ((> i stop) (nreverse nums))
    (push i nums)))

(my-range 1 3 0.5)
  
