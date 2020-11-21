; 1.4. Define a SUB2 function that subtracts two from its input.

(defun sub2 (x)
	(1- (1- x)))

; 1.5. Show how to write TWOP in terms of ZEROP and SUB2.

(defun twop (x)
	(zerop (sub2 x)))

; 1.6. The HALF function returns a number that is one-half of its input. Show how to define HALF two different ways.

(defun half (x)
	(/ x 2))

(defun half2 (x)
	(* x 1/2))

; 1.7. Write a  MULTI-DIGIT-P predicate that returns true if its input is greater than 9

(defun multi-digit-p (x)
	(> x 9))

; 1.8. What does this function do to a number?
; 
; Answer: This function negates the input number.

; 1.9 Write a predicate TWOMOREP that returns T if its first input is exactly two more than its second input. Use the ADD2 function in your definition of TWOMOREP.

(defun add2 (x)
	(1+ (1+ x)))

(defun twomorep (x y)
	(equal x (add2 y)))

; 1.10. Find a way to write the TWOMOREP predicate using SUB2 instead ofADD2.

(defun twomorep2 (x y)
	(equal (sub2 x) y))

; 1.11. The average of two numbers is half their sum. Write the AVERAGE function.

(defun average (x y)
	(/ (+ x y) 2))

; 1.12. Write a MORE-THAN-HALF-P predicate that returns T if its first input is more than half of its second input.

(defun more-than-half-p (x y)
	(> x (/ y 2)))

; 1.13. The following function returns the same result no matter what its input. What result does it return?
; -> NUMBERP -> SYMBOLP ->        or in LISP: (defun f (x) (symbolp (numberp x)))
; The result is always T, because NUMBERP that returns either of T or NIL, which both are symbols, therfore SYMBOLP always returns T.

; 1.15. Write a predicate NOT-ONEP that returns T if its input is anything other than one.

(defun not-onep (x)
	(not (equal 1 x)))

; 1.16. Write the predicate NOT-PLUSP that returns T if its input is not greater than zero.

(defun not-plusp (x)
	(not (> 0 x)))

; 1.17. Some earlier Lisp dialects did not have the EVENP primitive; they onlyhad ODDP. Show how to define EVENP in terms of ODDP.

(defun evenp (x)
	(not (oddp x)))

; 1.18. Under what condition does this predicate function return T?
; -> ADD1 -> ADD1 -> ZEROP ->          or in LISP (zerop (add1 (add1 x)))
; Answer: -2

; 1.19. What result does the function below produce when given the input NIL? What about the input T? Will all data flow through this function unchanged? What result is produced for the input RUTABAGA?
; -> NOT -> NOT ->          or in LISP (not (not x))
; 
; Answer: Any input other than NIL will return T. This is happens because first NOT turns NIL into T, and any non-NIL into NIL, then second NOT turns in into either T ot NIL. For input of RUTABAGA the ruslt will be T.

; 1.20. Atruth functionis a function whose inputs and output are truth values, that is, true or false. NOT is a truth function. (Even though NOT accepts other inputs besides T or NIL, it only cares if its input is true or not.) Write XOR, the exclusive-or truth function, which returns T when one of its inputs is NIL and the other is T, but returns NIL when bothare NIL or both are T. (Hint: This is easier than it sounds.)

(defun xor (x y)
	(not (equal x y)))

; 1.21. What is wrong with each of these functions?
; -> ZEROP -> ADD1 ->     ZEROP returns a symbol, but ADD1 expects a number as input
; => + -> EQUAL ->        EQUAL expects two inputs
; => NOT -> SYMBOLP ->    NOT expects only one input

; 1.22. Are all predicates functions? Are all functions predicates?
; Answer: All predicates are funtions, but not functions are predicates.

; 1.23. Which built-in predicates introduced in this chapter have names that do not end in ‘‘P’’?
; Answer: EQUAL, NOT, >, <

; 1.24. Is NUMBER a number? Is SYMBOL a symbol?
; Answer: NUMBER is not a number - it is a symbol. SYMBOL is a symbol.

; 1.25. Why is FALSE true in Lisp?
; Answer: FALSE is a symbol and not equal to NIL therefore it is T (true).

; 1.26. True or false: (a) All predicates accept T or NIL as input; (b) all predicates produce T or NIL as output.
; Answer: a) false; b) true

; 1.27. Give an example of the use of EVENP that would cause a wrong-type-input error. Give an example that would cause a wrong-number-of-inputs error.
; Answer: (EVENP some-number), (EVENP 2 3 4)
