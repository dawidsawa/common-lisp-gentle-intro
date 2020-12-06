; 2.8. Show how to write MY-THIRD using FIRST and two RESTs.

(defun my-third (x)
	(first (rest (rest x))))

; 2.9. Show how to write MY-THIRD using SECOND.

(defun my-second (x)
	(first (rest x)))

(defun my-third2 (x)
	(my-second (rest x)))

; 2.10. Draw the cons cell representation of the list (((PHONE HOME))), which has three levels of parentheses. What is the CAR of this list? What is the CDR?
; Answer:
; (((PHONE HOME))) -> CAR -> ((PHONE HOME))
; (((PHONE HOME))) -> CDR -> NIL

; 2.11. Draw the cons cell representation of the list (A (TOLL) ((CALL))).
; Answer:
; (A (TOLL) ((CALL))) -> CAR -> A
; (A (TOLL) ((CALL))) -> CDR -> ((TOLL) ((CALL)))

; 2.12. What C...R name does Lisp use for the function that returns the fourth element of a list? How would you pronounce it?
; Answer: CADDDR

; 2.13. Write down tables similar to the one above to illustrate how to get to each word in the list (((FUN)) (IN THE) (SUN)).
; Answer:
; (((FUN)) (IN THE) (SUN)) -> CAAAR -> FUN
; (((FUN)) (IN THE) (SUN)) -> CDAAR -> IN
; (((FUN)) (IN THE) (SUN)) -> CDADR -> THE
; (((FUN)) (IN THE) (SUN)) -> CDDAR -> SUN

; 2.14. What would happen if you tried to explain the operation of the CAADR function on the list ((BLUE CUBE) (RED PYRAMID) by reading the As and Ds from left to right instead of from right to left?

; 2.15.Using the list ((A B) (C D) (E F)), fill in the missing parts of this table.
; Function | Result
; CAR      | (A B )
; CDDR
; CADR
; CDAR
;  | B
; CDDAR
;  | A
; CDADDR
; F

; 2.16. What does CAAR do when given the input (FRED NIL)?

; 2.17. Fill in the results of the following computations.
; (POST NO BILLS) -> CAR -> POST
; (POST NO BILLS) -> CDR -> (NO BILLS)
; ((POST NO) BILLS) -> CAR -> (POST NO)
; (BILLS) -> CDR ->  NIL
; (BILLS) -> CAR -> BILLS
; (POST (NO BILLS)) -> CDR -> (NO BILLS)
; ((POST NO BILLS)) -> CDR -> NIL
; NIL -> CAR -> NIL

; 2.18. Write a function that takes any two inputs and makes a list of them using CONS.

(defun my-function (x y)
	(cons x y))

; 2.19. Fill in the results of the following computations.
; Answer:
; (LIST FRED AND WILMA) -> (FRED AND WILMA)
; (LIST FRED (AND WILMA) -> (FRED (AND WILMA))
; (CONS FRED (AND WILMA) -> (FRED AND WILMA)
; (CONS NIL NIL) -> (NIL)
; (LIST NIL NIL) -> (NIL NIL)

; 2.20. What results are returned by the following?
; Answer:
; (LIST NIL) -> (NIL)
; (LIST T NIL) -> (T NIL)
; (CONS T NIL) -> (T)
; (CONS (T) NIL) -> ((T))
; (LIST (IN ONE EAR AND) (OUT THE OTHER)) -> ((IN ONE EAR AND) (OUT THE OTHER))
; (CONS (IN ONE EAR AND) (OUT THE OTHER)) -> ((IN ONE EAR AND) OUT THE OTHER)


; 2.21. Write a function that takes four inputs and returns a two-element nested list. The first element should be a list of the first two inputs, and thesecond element a list of the last two inputs.

(defun four-two (a b c d)
	(list (cons a b) (cons c d)))

; 2.22. Suppose we wanted to make a function called DUO-CONS that added two elements to the front of a list. Remember that the regular CONS function adds only one element to a list. DUO-CONS would be a function of three inputs. For example, if the inputs were the symbol PATRICK, the symbol SEYMOUR, and the list (MARVIN), DUO-CONS would return the list (PATRICK SEYMOUR MARVIN). Show how to write the DUO-CONS function.
 
 (defun duo-cons (a b c)
 	(cons a (cons b c)))


; 2.23. TWO-DEEPER is a function that surrounds its input with two levels of parentheses. TWO-DEEPER of MOO is ((MOO)). TWO-DEEPER of (BOW  WOW) is (((BOW  WOW))). Show how to write TWO-DEEPER using LIST. Write another version using CONS.

(defun two-deeper-a (x)
	(list (list x)))

(defun two-deeper-b (x)
	(cons (cons x nil) nil))


; 2.24. What built-in Lisp function would extract the symbol NIGHT from thelist (((GOOD)) ((NIGHT)))?
; Answer: CAAADR

; 2.25. Why do cons cells and the CONS function share the same name?
; Answer: CONS function constructs new cons cell out of two passed arguments.

; 2.26. What do these two functions do when given the input (A B C)?
; Answer:
; (A B C) -> CDR -> LENGTH -> 2
; (A B C) -> LENGTH -> CDR -> Error, not a list

; 2.27. When does the internal representation of a list involve more cons cells than the list has elements?
; Answer: In case of empty list or nested list. 

; 2.28. Using just CAR and CDR, is it possible to write a function that returns the last element of a list, no matter how long the list is? Explain.
; Answer: No, it's not possible to do that using only CAR and CDR for a list of unknown size.

; 2.29. Write a function UNARY-ADD1 that increases a unary number by one.
(defun unary-add1 (x)
  (cons 'x x))

; 2.30. What does the CDDR function do to unary numbers?
; Answer: CDDR substracts 2 from unary number

; 2.31. Write a UNARY-ZEROP predicate.
(defun unary-zerop (x)
  (null x))

; 2.32. Write a UNARY-GREATERP predicate, analogous to the > predicate on ordinary numbers.
(defun unary-greaterp (x y)
  (greater (length x) (length y)))

; 2.33. CAR can be viewed as a predicate on unary numbers. Instead of returning T or NIL, CAR returns X or NIL. Remember that X or any other non-NIL object is taken as true in Lisp. What question about a unary number does CAR answer?
; Answer: Whether the unary number is greater than zero

; 2.34. Write an expression involving cascaded calls to CONS to construct the dotted list (A B C . D).
(cons 'a (cons 'b (cons 'c 'd)))

; 2.35. Draw the dotted list ((A . B) (C . D)) in cons cell notation. Write an expression to construct this list.
(cons (cons 'a 'b) (cons 'c 'd))

; 2.36. Prove by contradiction that this list cannot be constructed using just CONS. Hint: Think about the order in which the cells are created. #1=(A B C . #1#)
; Answer: To construct a circular list we need to pass the first and last elements as arguments to the right most CONS, i.e., the first cons cell would have to be constructed before the last con cell which is not how LISP evaluates.

