; testing the output - below format function outputs one of the values within [] depending whether the first argument to format is T or Nil
; the second argument is simply printed
(format t "~:[FAIL~;pass~] ... ~a~%" T "some text")
(format t "~:[FAIL~;pass~] ... ~a~%" Nil "some text")


(defun report-result (result form)
  (format t "~:[FAIL~;pass~] ... ~a~%" result form))

; code duplication
(report-result (= (+ 1 2) 3) '(= (+ 1 2) 3))

; use a macro
(defmacro check (form)
  `(report-result ,form ',form))

(check (= (+ 1 2) 3))

; use a better macro to reduce typing - basically, we wrap several tests into a progn
; for every test, we execute a report-result
(defmacro check-v2 (&body forms)
  `(progn
     ,@(loop for f in forms collect `(report-result ,f ',f))))

(macroexpand-1 '(check-v2
  (= (+ 1 2) 3)
  (= (+ 1 1) 3)))

(check-v2
  (= (+ 1 2) 3)
  (= (+ 1 1) 3))

; this new version displays things and returns the result
(defun report-result-v2 (result form)
  (format t "~:[FAIL~;pass~] ... ~a~%" result form)
  result)

; that's a macro defined in chapter 8 (Section macro-writing macros)
(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for n in names collect `(,n (gensym)))
     ,@body))

; we combine several (generic) expressions; if one of them returns NIL, the whole thing returns NIL
; it's like AND but does NOT shortcircuit
(defmacro combine-result (&body forms)
  (with-gensyms (result)
    `(let ((,result t))
       ,@(loop for f in forms collect `(unless ,f (setf ,result nil)))
       ,result)))

; same as previous check-vs, but use combine-result instead of progn
(defmacro check-v3 (&body forms)
  `(combine-result
     ,@(loop for f in forms collect `(report-result-v2 ,f ',f))))

; and try it out...
(check-v3
  (= (+ 1 2) 3)
  (= (+ 1 1) 3))
