(defun fn-1 (&rest args)
  (dolist (arg args)
    (print arg)))

(fn-1)
(fn-1 1)
(fn-1 1 2 3)

(defun fn-opt (a b &optional (c 3 c-supplied-p))
  (list a b c c-supplied-p))

(fn-opt 1 2)
(fn-opt 1 2 3)
(fn-opt 1 2 4)

(defun fn-key (&key a b c)
  (list a b c))


(fn-key)
(fn-key :a 1)
(fn-key :c 1)
