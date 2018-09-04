(defvar *big-list* '(1 2 3 4 5 6 7 8 9 10 11 12))

; we have to use x in the clauses as the lambda uses x
; -> this does not work
(remove-if-not (where (< y 7) (> y 2)) *big-list*)

; we should simplify the clause in that we say (x < 7) instead of (< x 7)
; use gensym and rework every clause so that the symbol provided by gensym is used

; start simple
(defmacro rework-fixed ()
  `#'(lambda (x) (< x 7)))

(remove-if-not (rework-fixed) *big-list*)

(defmacro rework-var (val)
  `#'(lambda (x) (< x ,val)))

(remove-if-not (rework-var 9) *big-list*)

(defmacro rework-var-gensym (val)
  (let ((x (gensym)))
    `#'(lambda (x) (< x ,val))))

(remove-if-not (rework-var-gensym 9) *big-list*)





; now rework a clause: clause = (x < 7) => #'(lambda (x) (< x 7))
(defmacro rework-clause-simple (clause)
  `#'(lambda (x) ( ,(second clause) x ,(third clause))))

(macroexpand-1 '(rework-clause-simple (x < 7)))
(rework-clause-simple (x < 7))

(remove-if-not (rework-clause-simple (x < 7)) *big-list*)

(defmacro rework-clause-gensym (clause)
  (let ((x (gensym)))
    `#'(lambda (x) (,(second clause) x ,(third clause)))))

(remove-if-not (rework-clause-gensym (x < 7)) *big-list*)



(defmacro rework-clause-where (clause)
  `(,(second clause) x ,(third clause)))

(macroexpand-1 '(rework-clause-where (x < 7)))


; if we think of using this in where, we e.g. have where (x < 7) (x > 2)
; we want to have #'lambda(and (rework-clause-simple (x < 7)) (rework-clause-simple (x > 2)))

; let's start simple: 2 clauses
(defmacro where-v1 (clause-1 clause-2)
  `#'(lambda (x) (and (rework-clause-where ,clause-1) (rework-clause-where ,clause-2))))

(remove-if-not (where-v1 (x < 7) (x > 2)) *big-list*)


; this should be the general case but does not work...
(defmacro where-v2 (&rest clause-list)
  `#'(lambda (x) (and (mapcar rework-clause-where ,clause-list))))

(macroexpand '(remove-if-not (where-v2 (x < 7) (x > 2)) *big-list*))

(remove-if-not (where-v2 (x < 7) (x > 2)) *big-list*)



