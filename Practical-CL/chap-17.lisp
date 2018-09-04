(defclass bank-account ()
  ((customer-name
    :initarg :customer-name)
   (balance
    :initarg :balance
    :initform 0)))



(defparameter *account*
  (make-instance 'bank-account :customer-name "John Doe" :balance 1000))

(slot-value *account* 'balance)
(slot-value *account* 'customer-name)


; one way to define simpler setters is to overload setf
(defgeneric (setf customer-name) (value account))
(defmethod (setf customer-name) (value (account bank-account))
  (setf (slot-value account 'customer-name) value))

(setf (customer-name *account*) "Micki Mouse")


; on way to get simpler getters
(defgeneric customer-name (account))
(defmethod customer-name ((account bank-account))
  (slot-value account 'customer-name))

(customer-name *account*)


; alternative version of class definition
(defclass bank-account-v2 ()
  ((customer-name
    :initarg :customer-name
    :accessor customer-name)   
   (balance
    :initarg :balance
    :initform 0
    :reader balance)))

(defparameter *account-2*
  (make-instance 'bank-account-v2 :customer-name "Susi Novak" :balance 100))

(customer-name *account-2*)
(balance *account-2*)
(setf (customer-name *account-2*) "Susi 2")
; this does NOT work - no writer option
(setf (balance *account-2*) 200)
