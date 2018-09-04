(setq a (make-hash-table))

(setf (gethash 'color a) 'red)
(setf (gethash 'name a) 'Clemens)

(gethash 'color a)
