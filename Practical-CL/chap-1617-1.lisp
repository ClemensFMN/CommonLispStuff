(defclass bank-account ()
  ((customer-name :initarg :customer-name)
   (balance
    :initarg :balance
    :initform 0)))

(defparameter *ba1*
  (make-instance 'bank-account
		 :customer-name "Clemens Novak"
		 :balance 100))

(defgeneric deposit (account amount))

(defmethod deposit ((account bank-account) amount)
  (incf ; increment
   (slot-value account 'balance) ; retrieve the current balace
   amount)) ; and increment

(slot-value *ba1* 'customer-name)
(slot-value *ba1* 'balance)
(deposit *ba1* 20)


