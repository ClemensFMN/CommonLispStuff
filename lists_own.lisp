(defun my-sum (lst)
  (cond ((null lst) 0)
        (t (+ (car lst) (my-sum (rest lst))))))

(my-sum '())
(my-sum '(1 2 3))


(defun my-filter (lst pred)
  (cond ((null lst) '())
        ((funcall pred (car lst)) (cons (car lst) (my-filter (rest lst) pred)))
        (t (my-filter (rest lst) pred))))
    

(defun even? (x)
  (= 0 (mod x 2)))

(even? 2)
(even? 3)


(my-filter '(1 2 3 4 5 6 7 8 9 10) 'even?)
(my-filter '(1 2 3 4 5 6 7 8 9 10) #'(lambda (x) (> x 5)))


(defun my-range (a b)
  (cond ((> a b) '())
        (t (cons a (my-range (+ a 1) b)))))

(my-range 2 10)

(defun my-range-v2 (a b step)
  (cond ((> a b) '())
        (t (cons a (my-range-v2 (+ a step) b step)))))

(my-range-v2 2 10 2)
(my-range-v2 2 10 3)


(defun my-takewhile (lst pred)
  (cond ((null lst) '())
        ((funcall pred (car lst)) (cons (car lst) (my-takewhile (rest lst) pred)))
        (t '())))

(my-takewhile '(2 3 1 4 2 3 4) #'(lambda (x) (< x 4)))

