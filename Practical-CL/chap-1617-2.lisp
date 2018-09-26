; helper point class for 2d points
(defclass point ()
  ((x
    :initarg :x
    :accessor x)
   (y
    :initarg :y
    :accessor y)))

(defparameter *p*
  (make-instance 'point :x 1 :y 2))

(x *p*)
(y *p*)
(setf (x *p*) 10)

; define a super class 
(defclass shape () ())

; with a subclass rectanlge
(defclass rectangle (shape)
  ((left-lower
    :initarg :left-lower
    :accessor left-lower)
   (right-upper
    :initarg :right-upper
    :accessor right-upper)))

(defparameter *rect*
  (make-instance 'rectangle
		 :left-lower (make-instance 'point :x 2 :y 1)
		 :right-upper (make-instance 'point :x 10 :y 5)))

(x (left-lower *rect*))

(defclass circle (shape)
  ((center
    :initarg :center
    :accessor center)
   (radius
    :initarg :radius
    :accessor radius)))

(defparameter *circ*
  (make-instance 'circle
		 :center (make-instance 'point :x 1 :y 2)
		 :radius 4))


; a generic area function -> careful with the parameter
(defgeneric area (shape))

; specialize the method for rectangles. Careful: Parameter name is shape (& NOT ectangle)
(defmethod area ((shape rectangle))
  (let ((delta-x (abs (- (x (left-lower shape)) (x (right-upper shape)))))
	(delta-y (abs (- (y (left-lower shape)) (y (right-upper shape))))))
    (* delta-x delta-y)))

(defmethod area ((shape circle))
  (* pi (radius shape) (radius shape)))

(area *rect*)

(area *circ*)

(defgeneric scale (shape factor))

(defmethod scale ((shape circle) factor)
  (setf (radius shape) (* factor (radius shape))))

(scale *circ* 2)
  
(radius *circ*)

; whatever the "right" thing to do for a rectangle (move right-upper point by scale factor?)
(defmethod scale ((shape rectangle) factor)
  factor)

(scale *rect* 3)
