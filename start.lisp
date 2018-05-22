(defun my-func (x)
  (+ x 1))

(my-func 4)

(defun my-func-2 (x)
  (cond ((= x 0) (+ x 1))
        ((> x 0) x)
        (t 0)))

(defun my-func-3 (x y)
  (+ x y))

(defun my-factorial (n)
  (cond ((= n 0) 1)
        (t (* n (my-factorial (- n 1))))))

(defun make-adder (n)
  #'(lambda (x) (+ x n)))


(setq add1 (make-adder 1))

(funcall add1 1)


(let ((x 1) (y 10))
  (progn
    (format t "x=~d, y=~d" x y)
    (let ((x 5))
      (format t "x=~d, y=~d" x y))))


(mapcar #'(lambda (x) (+ x 1)) '(1 2 3 4))

(defun tmp (f lst)
       (funcall f (car lst)))

(defun my-map (f lst)
  (cond ((null lst) nil)
        (t (cons (funcall f (car lst)) (my-map f (cdr lst))))))


(defun my-reverse (lst)
  (defun int-func (lst acc)
    (cond ((null lst) acc)
          (t (int-func (cdr lst) (cons (car lst) acc)))))
  (int-func lst nil))
