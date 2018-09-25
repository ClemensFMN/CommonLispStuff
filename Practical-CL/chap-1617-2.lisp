(defclass point ()
  ((x :initarg :x)
   (y :initarg :y)))

(defparameter *p*
  (make-instance 'point :x 0 :y 2))


(defclass shape () ())

(defclass rectangle (shape)
  ((left-lower :initarg :left-lower)
   (right-upper :initarg :right-upper)))

(defparameter *rect*
  (make-instance 'rectangle
		 :left-lower (make-instance 'point :x 0 :y 0)
		 :right-upper (make-instance 'point :x 10 :y 5)))

(defgeneric area (shape))


