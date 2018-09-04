(defvar *big-list* '(1 2 3 4 5 6 7 8 9 10 11 12))


; in order to filter stuff from the list, we provide a predicate function (as lambda)
(remove-if-not #'(lambda (x) (< x 7)) *big-list*)

; if we want multiple conditions, we need to AND the conditions together BEFORE we pack them into the lambda...
(remove-if-not #'(lambda (x) (and (< x 7)  (= (mod x 2) 0))) *big-list*)

; this does NOT work... although I don't get why :-(
(remove-if-not (and #'(lambda (x) (< x 7)) #'(lambda (x) (= (mod x 2) 0))) *big-list*)

; what we would like to do is to have a where command which takes a list of predicate functions and filters the list
; i.e. this 
; (remove-if-not (where (< x 7) (= (mod x 2) 0)) *big-list*)
; creates this
; (remove-if-not #'(lambda (x) (and (< x 7)  (= (mod x 2) 0))) *big-list*)


; the simple case with just one clause; the backtick ensures that everything is taken literally, the comma ensures that clause is actually evaluated
(defmacro where-simple (clause)
  `#'(lambda (x) ,clause))

(macroexpand-1 '(where-simple (< x 7)))
(remove-if-not (where-simple (< x 7)) *big-list*)

; the stupid case for two clauses - same principle as above
(defmacro where-2 (clause1 clause2)
  `#'(lambda (x) (and ,clause1 ,clause2)))

(macroexpand-1 '(where-2 (< x 7) (> x 2)))

(remove-if-not (where-2 (< x 7) (> x 2)) *big-list*)

; being clever and slightly changing the when syntax: when takes a list of clauses which can be simply evaluated using @, 
(defmacro where-n (clause-lst)
  `#'(lambda (x) (and ,@clause-lst)))

(macroexpand '(where-n ((< x 7) (> x 2))))
(remove-if-not (where-n ((< x 7) (> x 2))) *big-list*)

; that's the final thing to do... takes an unlimited number of clauses and builds up the "correct" lambda function
; &rest packs (the potentially many arguments) into a list and the ,@ causes this list to be merged into the enclosing list
(defmacro where (&rest clause-lst)
  `#'(lambda (x) (and ,@clause-lst)))

(macroexpand '(where (< x 7) (> x 2)))
(remove-if-not (where (< x 7) (> x 2)) *big-list*)

; some stuff to optimize further: see chap-03a.lisp

;=====================================================

; I can also use a normal function
(defun less-10-p (x) (< x 10))
; and use it to filter the list
(remove-if-not #'less-10-p *big-list*)

(defun even-p (x) (= (mod x 2) 0 ))

(and (less-10-p 4) (even-p 4))
(and (less-10-p 5) (even-p 5))
(and (less-10-p 10) (even-p 10))

; but squeezing in a second predicate does not work(??)
; maybe some short-circuiting breaks things...???
(remove-if-not (and #'less-10-p #'even-p) *big-list*)

; but we can combine the predicate
(defun combine-p (x) (and (less-10-p x) (even-p x)))
; and use it to filter...
(remove-if-not #'combine-p *big-list*)

(defun less-val-x (x val) (< x val))

(defun combine-2-p (x) (and (less-val-x x 10) (even-p x)))

(remove-if-not #'combine-2-p *big-list*)

