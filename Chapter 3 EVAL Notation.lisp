; 3.1. What does (NOT (EQUAL 3 (ABS -3))) evaluate to?
; Answer: NIL

; 3.2. Write an expression in EVAL notation to add 8 to 12 and divide the result by 2.
; Answer: (/ (+ 12 8) 2)

; 3.3. You can square a number by multiplying it by itself. Write an expression in EVAL notation to add the square of 3 and the square of 4.
; (+ (* 3 3) (* 4 4))

; 3.4. Draw an evaltrace diagram for each of the following expressions.
; (- 8 2) => 6
; (not (oddp 4)) => T
; (> (* 2 5) 9) => T
; (not (equal 5 (+ 1 4))) => NIL

; 3.5. Write definitions for HALF, CUBE, and ONEMOREP using DEFUN. (The CUBE function should take a number n as input and return n^3.)
(defun half (x) (/ x 2))
(defun cube (n) (* (* n n) n))
(defun onemorep (x y) (= (1+ x) y))

; 3.6. Define a function PYTHAG that takes two inputs, x and y, and returns the square root of x^2+y^2. You may recognize this as Pythagoras’s formula for computing the length of the hypotenuse of a right triangle given the lengths of the other two sides. (PYTHAG 3 4) should return 5.0.
(defun pythag (x y) (sqrt (+ (* x x) (* y y))))

; 3.7. Define a function MILES-PER-GALLON that takes three inputs, called INITIAL-ODOMETER-READING, FINAL-ODOMETER-READING, and GALLONS-CONSUMED, and computes the number of miles traveled per gallon of gas.
(defun miles-per-gallon (initial-odometer-reading final-odometer-reading gallons-consumed)
  (/ (- final-odometer-reading initial-odometer-reading) gallons-consumed))

; 3.8. How would you define SQUARE in box notation?
; Answer: The input wire would split into two inputs that go into multiplication operation

; 3.9. The following expressions evaluate without any errors. Write down the results.
; (cons 5 (list 6 7)) => (5 6 7)
; (cons 5 ’(list 6 7)) => (5 list 6 7)
; (list 3 ’from 9 ’gives (- 9 3)) => (3 from 9 gives 6)
; (+ (length ’(1 foo 2 moo)) (third ’(1 foo 2 moo))) => 6
; (rest ’(cons is short for construct)) => (is short for construct)

; 3.10. The following expressions all result in errors. Write down the type of error that occurs, explain how the error arose (for example, missing quote, quote in wrong place), and correct the expression by changing only the quotes.
(third (the quick brown fox)) => 
(list 2 and 2 is 4) => 
(+ 1 ’(length (list t t t t))) => 
(cons ’patrick (seymour marvin)) =>
(cons ’patrick (list seymour marvin)) =>

; 3.11. Define a predicate called LONGER-THAN that takes two lists as input and returns T if the first list is longer than the second.
(defun longer-than (a b) (> (length a) (length b)))

; 3.12. Write a function ADDLENGTH that takes a list as input and returns a new list with the length of the input added onto the front of it. If the input is (MOO GOO GAI PAN), the output should be (4 MOO GOO GAI PAN). What is the result of (ADDLENGTH (ADDLENGTH ’(A B C)))?
(defun addlength (a) (cons (length a) a))

; 3.13. Study this function definition:
; (defun call-up (caller callee) (list ’hello callee ’this ’is caller ’calling))
; How many arguments does this function require? 2
; What are the names of the arguments? caller, callee
; What is the result of (CALL-UP ’FRED ’WANDA)? '(hello WANDA this is FRED calling)

; 3.14. Here is a variation on the CALL-UP function from the previous problem. What is the result of (CRANK-CALL ’WANDA ’FRED)?
; (defun crank-call (caller callee) ’(hello callee this is caller calling)) => ’(hello callee this is caller calling)

; 3.15. Consider the following function, paying close attention to the quotes:
; (defun scrabble (word)
;   (list word ’is ’a ’word))
; The symbol WORD is used two different ways in this function. What are they? Symbol, variable.
; What is the result of (SCRABBLE ’AARDVARK)? => (AARDVARK is a word)
; What is the result of (SCRABBLE ’WORD)? => (WORD is a word)

; 3.16. Here’s a real confuser:
; (defun stooge (larry moe curly)
;   (list larry (list ’moe curly) curly ’larry))
; What does the following evaluate to? It will help to write down what value each variable is bound to and, of course, mind the quotes!
; (stooge ’moe ’curly ’larry) => (moe (moe larry) larry larry)

; 3.17. Why can’t the special symbols T or NIL be used as variables in a function definition? (Consider the evaluation rule for T and NIL versus the rule for evaluating ordinary symbols.)
; T and NIL, as well as numbers, are self-evaluating

; 3.18. Name two advantages of EVAL notation over box notation.
; It's easier to type on a computer compared to the box notation, and it's used for both code and data.

; 3.19. Evaluate each of the following lists. If the list causes an error, tell what the error is. Otherwise, write the result of the evaluation.
; (cons ’grapes ’(of wrath)) => (grapes of wrath)
; (list t ’is ’not nil) => (t is not nil)
; (first ’(list moose goose)) => (list)
; (first (list ’moose ’goose)) => (moose)
; (cons ’home (’sweet ’home)) => Error: Undefined function: sweet

; 3.20. Here is a mystery function:
; (defun mystery (x)
;   (list (second x) (first x)))
; What result or error is produced by evaluating each of the following?
; (mystery ’(dancing bear)) => (bear dancing)
; (mystery ’dancing ’bear) => Error: Invalid number of arguments: got 2, wanted 1
; (mystery ’(zowie)) => (nil zowie)
; (mystery (list ’first ’second)) => (second first)

; 3.21. What is wrong with each of the following function definitions?
; (defun speak (x y) (list ’all ’x ’is ’y)) => Variables should not be quoted
; (defun speak (x) (y) (list ’all x ’is y)) => Function can't take two argument lists
; (defun speak ((x) (y)) (list all ’x is ’y)) => Argument list variables should not be in separate parenthesis, variables should not be quoted

; 3.22. The exercises below may be done in any order. What’s most important is that you get comfortable with using the computer. You don’t have to solve all of these problems; feel free to experiment and improvise on your own if you like.
; a. Find out how to run Lisp on your computer, and start it up.
; b. For each following expression, write down what you think it evaluates to or what kind of error it will cause. Then try it on the computer and see.
; (+ 3 5) => 8
; (3 + 5) => 3 is not a valid function name
; (+ 3 (5 6)) => a list is not a valid argument to + function
; (+ 3 (* 5 6)) => 33
; ’(morning noon night) => (morning noon night)
; (’morning ’noon ’night) => morning is not a function
; (list ’morning ’noon ’night) => (morning noon night)
; (car nil) => nil
; (+ 3 foo) => unbound variable foo
; (+ 3 ’foo) => foo is not a valid argument to + function
; c. Here is an example of the function MYFUN, a strange function of two inputs.
; (myfun ’alpha ’beta) ⇒ ((ALPHA) BETA)
; Write MYFUN. Test your function to make certain it works correctly.
(defun myfun (a b) (list (list a) b))
; d. Write a predicate FIRSTP that returns T if its first argument (a symbol) is equal to the first element of its second argument (a list). That is, (FIRSTP ’FOO ’(FOO BAR BAZ)) should return T. (FIRSTP ’BOING ’(FOO BAR BAZ)) should return NIL.
(defun firstp (a b) (equal a (car b)))
; e. Write a function MID-ADD1 that adds 1 to the middle element of a three-element list. For example, (MID-ADD1 ’(TAKE 2 COOKIES)) should return the list (TAKE 3 COOKIES). Note: You are not allowed to make MID-ADD1 a function of three inputs. It has to take a single input that is a list of three elements.
(defun mix-add1 (a) (list (car a) (1+ (cadr a)) (caddr a)))
; f. Write a function F-TO-C that converts a temperature from Fahrenheit to Celsius. The formula for doing the conversion is: Celsius temperature = [5×(Fahrenheit temperature - 32)]/9. To go in the opposite direction, the formula is: Fahrenheit temperature = (9/5× Celsius temperature) + 32.
(defun f-to-c (f) (/ (* 5 (- f 32)) 9))
(defun c-to-f (c) (+ 32 (* (/ 9 5) c)))
; g. What is wrong with this function? What does (FOO 5) do?
; (defun foo (x) (+ 1 (zerop x))) => invalid argument type passed to + function as a result of zerop predicate

; 3.23. Write each of the following functions in Church’s lambda notation: DOUBLE, SQUARE, ONEMOREP.
; double: λx.(x*2)
; square: λx.(x*x)
; onemorep: λxy.(y=x+1)

; 3.24. Assume we have defined the following functions:
; (defun alpha (x) (bravo (+ x 2) (charlie x 1)))
; (defun bravo (y z) (* y z))
; (defun charlie (y x) (- y x))
; Suppose we now evaluate (ALPHA 3). Show the resulting creation and use of variables X, Y, and Z by drawing an evaltrace diagram.

; 3.25 What do each of the following expressions evaluate to?
; (list 'cons t nil) => (cons t nil)
; (eval (list 'cons t nil)) => (t)
; (eval (eval (list 'cons t nil))) => undefined function t
; (apply #'cons '(t nil)) => (t)
; (eval nil) => nil
; (list 'eval nil) => (eval nil)
; (eval (list 'eval nil)) => (nil)