(setq a 1)

; everything is quoted
`(1 a)
; a is evaluated
`(1 ,a)
; a nested, but complete S-expression is evaluated
`(1 ,(+ 2 3))

(setq b '(1 2 3))

; this produces a nested list
`(1 ,b)
; this "splices", i.e. it inserts b into the list one level above
`(1 ,@b)


(make-list 5 :initial-element 1)


; we write our own add macro: completely stupid, but neverthless
; (own-add 3 4) shall translate to (+ 3 1 1 1 1)

(defmacro own-add (a b)
  (let ((one-seq (make-list b :initial-element 1))) ; create the list of ones upfront
    `(+ ,a ,@one-seq))); build up the expression; we need to splice-in the one-seq!

(macroexpand-1 '(own-add 3 4))

(own-add 3 4)


(defun verbose-func-2 (f x y)
  (progn
    (format t "Input Values: ~a,~a" x y)
    (let ((res (funcall f x y)))
      (format t "Output: ~a" res)
      res)))


(verbose-func-2 #'+ 4 5)


(defun verbose-func-2-v2 (f x y)
    ((format t "Input Values: ~a,~a" x y)
    (let ((res (funcall f x y)))
      (format t "Output: ~a" res)
      res)))
