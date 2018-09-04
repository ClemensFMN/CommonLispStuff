; this does nothing but return the bloody list
`(+ 1 2)

; neither does this anything useful
`(+ 1 (+ 4 5))

; here the , takes care that the nested expression is evaluated
`(+ 1 ,(+ 4 5))



; a simple macro building up a list
(defmacro m1 ()
  `(a b c))

; here we see that the macro creates a list expression
(macroexpand-1 '(m1))

; if we evaluate it, it complains that b is not defined - I assume that first parameters are evaluated (b and c) and then the function (in this case a) would be evaluated.
(m1)

; now it complinas about missing c
(let ((b 1))
  (m1))

; now it doesn't find the function a
(let ((b 1) (c 2))
  (m1))

; a non-working attempt to define a as a function
(let ((a #'+) (b 1) (c 2))
  (m1))


(defun add (in1 in2)
  (+ in1 in2))

; the , takes care that the expression is evaluated, the ' takes care that the symbol is taken(?)
(defmacro m2 ()
  `(,'add b c))

(macroexpand-1 '(m2))

(let ((b 1) (c 2))
  (m2))

(defmacro m3 ()
  `(+ b c))

(macroexpand-1 '(m3))

(let ((b 1) (c 2))
  (m3))

; this macro takes a non-nested expression and multiplies the elements
(defmacro to-mul (ex)
  `(* (second ,ex) (third ,ex)))

(to-mul '(+ 2 3))

; this tries to exchange + to * in an expression
(defmacro add-to-mul (ex)
  `(subst '* '+ ,ex))

; I wonder why it does not evaluate the expression
(add-to-mul '(+ 3 4))
; it works recursivley, if we use subst instead of substitute
(add-to-mul '(+ 3 4 (+ 1 2)))
