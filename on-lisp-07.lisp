(mapcar #'signum '(-4 0 4))

(defmacro nif (expr pos-out zero-out neg-out)
  `(case (signum ,expr)
     (1 ,pos-out)
     (0 ,zero-out)
     (-1 ,neg-out)))

(macroexpand-1 '(nif 5 `pos `zero `neg))

(nif 5 `pos `zero `neg)

