(ql:quickload "iterate")

(iterate:iter (iterate:for i from 1 to 10)
        (iterate:collect i))


(iterate:iter (iterate:for el in '(1 2 3 4 5 6 7 8 9))
        (if (oddp el)
            (iterate:collect el)))

(defun uneq (x y)
  (not (= x y)))

(uneq 4 5)

(iterate:iter (iterate:for el in '(1 2 3 4 5 6 7 8 9))
        (if (uneq el 3)
            (iterate:collect el)))
