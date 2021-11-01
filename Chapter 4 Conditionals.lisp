; 4.1. Write a function MAKE-EVEN that makes an odd number even by adding one to it. If the input to MAKE-EVEN is already even, it should be returned unchanged.
(defun make-even (x)
  (if (evenp x) x (1+ x)))

; 4.2. Write a function FURTHER that makes a positive number larger by adding one to it, and a negative number smaller by subtracting one from it. What does your function do if given the number 0?
(defun further (x)
  (if (< x 0)
      (1- x)
      (1+ x)))

; 4.3 Recall the primitive function NOT: It returns NIL for a true input and T for a false one. Suppose Lisp didn’t have a NOT primitive. Show how to write NOT using just IF and constants (no other functions). Call your function MY-NOT.
(defun my-not (x) (if x nil t))

; 4.4 Write a function ORDERED that takes two numbers as input and makes a list of them in ascending order. (ORDERED 3 4) should return the list (3 4). (ORDERED 4 3) should also return (3 4), in other words, the first and second inputs should appear in reverse order when the first is greater than the second.
(defun ordered (a b)
  (if (< a b) (list a b) (list b a)))

; 4.5. For each of the following calls to COMPARE, write ‘‘1,’’ ‘‘2,’’ or ‘‘3’’ to indicate which clause of the COND will have a predicate that evaluates to true.
; __3__ (compare 9 1)
; __2__ (compare (+ 2 2) 5)
; __1__ (compare 6 (* 2 3))

; 4.6. Write a version of the absolute value function MY-ABS using COND instead of IF.
(defun my-abs (x)
  (cond ((< x 0) (- x))
        (t x)))

; 4.7. For each of the following COND expressions, tell whether the parenthesization is correct or incorrect. If incorrect, explain where the error lies.
; (cond (symbolp x) ’symbol
;       (t ’not-a-symbol))
; => Incorrect parenthesis on first test-and-consequent
; (cond ((symbolp x) ’symbol)
;       (t ’not-a-symbol))
; => Correct
; (cond ((symbolp x) (’symbol))
;       (t ’not-a-symbol))
; => Incorrect parenthesis on first condition consequent
; (cond ((symbolp x) ’symbol)
;       ((t ’not-a-symbol)))
; => Incorrect parenthesis on last test-and-consequent

; 4.8. Write EMPHASIZE3, which is like EMPHASIZE2 but adds the symbol VERY onto the list if it doesn’t know how to emphasize it. For example, EMPHASIZE3 of (LONG DAY) should produce (VERY LONG DAY). What does EMPHASIZE3 of (VERY LONG DAY) produce?
(defun emphasize3 (x)
  (cond ((equal (first x) 'good) (cons 'great (rest x)))
        ((equal (first x) 'bad) (cons 'awful (rest x)))
        (t (cons 'very x))))
; (EMPHASIZE3 '(VERY LONG DAY)) => '(VERY VERY LONG DAY)

; 4.9 Type in the following suspicious function definition:
; (defun make-odd (x)
;   (cond ((not (oddp x)) (+ x 1))
;         (t x)))
; What is wrong with this function? Try out the function on the numbers 3, 4, and -2. Rewrite it so it works correctly.
; => The Conditional test are put in wrong order causing the first condition to be always fulfilled.
(defun make-odd (x)
   (cond ((not (oddp x)) (+ x 1))
         (t x)))

; 4.10. Write a function CONSTRAIN that takes three inputs called X, MAX, and MIN. If X is less than MIN, it should return MIN; if X is greater than MAX, it should return MAX. Otherwise, since X is between MIN and MAX, it should return X. (CONSTRAIN 3 -50 50) should return 3. (CONSTRAIN 92 -50 50) should return 50. Write one version using COND and another using nested IFs.
(defun constrain-cond (x max min)
  (cond ((< min x) min)
        ((> max x) max)
        (t x)))
(defun constrain-if (x max min)
  (if (< min x) min (if (> max x) max x)))

; 4.11 Write a function FIRSTZERO that takes a list of three numbers as input and returns a word (one of ‘‘first,’’ ‘‘second,’’ ‘‘third,’’ or ‘‘none’’) indicating where the first zero appears in the list. Example: (FIRSTZERO ’(3 0 4)) should return SECOND. What happens if you try to call FIRSTZERO with three separate numbers instead of a list of three numbers, as in (FIRSTZERO 3 0 4)?
(defun firstzero (a b c)
  (cond ((zerop a) 'first)
        ((zerop b) 'second)
        ((zerop c) 'third)
        (t 'none)))

; 4.12 Write a function CYCLE that cyclically counts from 1 to 99. CYCLE called with an input of 1 should return 2, with an input of 2 should return 3, with an input of 3 should return 4, and so on. With an input of 99, CYCLE should return 1. That’s the cyclical part. Do not try to solve this with 99 COND clauses!
(defun cycle (x)
  (cond ((< x 99) (1+ x))
        (t 1)))

; 4.13 Write a function HOWCOMPUTE that is the inverse of the COMPUTE function described previously. HOWCOMPUTE takes three numbers as input and figures out what operation would produce the third from the first two. (HOWCOMPUTE 3 4 7) should return SUM-OF. (HOWCOMPUTE 3 4 12) should return PRODUCT-OF. HOWCOMPUTE should return the list (BEATS ME) if it can’t find a relationship between the first two inputs and the third. Suggest some ways to extend HOWCOMPUTE.
(defun howcompute (x y z)
  (cond ((equal z (+ x y)) 'sum-of)
        ((equal z (* x y)) 'product-of)
        (t '(beats me))))

; 4.14. What results do the following expressions produce? Read the evaluation rules for AND and OR carefully before answering.
; (and ’fee ’fie ’foe) => 'foe
; (or ’fee ’fie ’foe) => 'fee
; (or nil ’foe nil) => 'foe
; (and ’fee ’fie nil) => nil
; (and (equal ’abc ’abc) ’yes) => 'yes
; (or (equal ’abc ’abc) ’yes) => t

; 4.15. Write a predicate called GEQ that returns T if its first input is greater than or equal to its second input.
(defun geq (x y)
  (or (equal x y)
      (> x y)))

; 4.16. Write a function that squares a number if it is odd and positive, doubles it if it is odd and negative, and otherwise divides the number by 2.
(defun sq-or-dbl-or-div (x)
  (cond ((and (oddp x) (> x 0)) (* x x))
        ((and (oddp x) (< x 0)) (* x 2))
        (t (/ x 2))))

; 4.17. Write a predicate that returns T if the first input is either BOY or GIRL and the second input is CHILD, or the first input is either MAN or WOMAN and the second input is ADULT.
(defun gender-age (a b)
  (or (and (or (equal a 'boy)
               (equal a 'girl))
            (equal b 'child))
      (and (or (equal a 'man)
               (equal a 'woman))
            (equal b 'adult))))

; 4.18. Write a function to act as referee in the Rock-Scissors-Paper game. In this game, each player picks one of Rock, Scissors, or Paper, and then both players tell what they picked. Rock ‘‘breaks’’ Scissors, so if the first player picks Rock and the second picks Scissors, the first player wins. Scissors ‘‘cuts’’ Paper, and Paper ‘‘covers’’ Rock. If both players pick the same thing, it’s a tie. The function PLAY should take two inputs, each of which is either ROCK, SCISSORS, or PAPER, and return one of the symbols FIRST-WINS, SECOND-WINS, or TIE. Examples: (PLAY ’ROCK ’SCISSORS) should return FIRST-WINS. (PLAY ’PAPER ’SCISSORS) should return SECOND-WINS.
(defun play (a b)
  (cond ((equal a b) 'tie)
        ((or (and (equal a 'rock)
                  (equal b 'scissors))
             (and (equal a 'scissors)
                  (equal b 'paper))
             (and (equal a 'paper)
                  (equal b 'rock)))
        'first-wins)
        ((or (and (equal b 'rock)
                  (equal a 'scissors))
             (and (equal b 'scissors)
                  (equal a 'paper))
             (and (equal b 'paper)
                  (equal a 'rock)))
        'second-wins)
        (t 'unknown-move)))

; 4.19. Show how to write the expression (AND X Y Z W) using COND instead of AND. Then show how to write it using nested IFs instead of AND.
(cond ((not x) nil)
      ((not y) nil)
      ((not z) nil)
      (t w))

(if x (if y (if z w)))

; 4.20. Write a version of the COMPARE function using IF instead of COND. Also write a version using AND and OR.
(defun compare-if (x y)
  (if (equal x y)
      'number-are-the-same
      (if (< x y)
          'first-is-smaller
          'first-is-bigger)))

(defun compare-andor (x y)
  (or (and (equal x y) 'numbers-are-the-same)
      (and (< x y) 'first-is-smaller)
      'first-is-bigger))

; 4.21. Write versions of the GTEST function using IF and COND.
(defun gtest-if (x y)
  (if (> x y) t
      (if (zerop x) t
          (zerop y))))

(defun gtest-cond (x y)
  (cond ((> x y) t)
        ((zerop x) t)
        (t (zerop y))))

; 4.22. Use COND to write a predicate BOILINGP that takes two inputs, TEMP and SCALE, and returns T if the temperature is above the boiling point of water on the specified scale. If the scale is FAHRENHEIT, the boiling point is 212 degrees; if CELSIUS, the boiling point is 100 degrees. Also write versions using IF and AND/OR instead of COND.
(defun boilingp (temp scale)
  (or (and (equal scale 'celsius)
           (> temp 100))
      (and (equal scale 'fahrenheit)
           (> temp 212))))

; 4.23. The WHERE-IS function has four COND clauses, so WHERE-IS-2 needs three nested IFs. Suppose WHERE-IS had eight COND clauses. How many IFs would WHERE-IS-2 need? How many ORs would WHERE-IS-3 need? How many ANDs would it need?
; For N number of COND clauses, we would need N-1 number of IF statements, or we would need 1 OR and N-1 AND conditionals. So 7 COND clauses can be replaced by 7 IFs, or by 1 AND plus 7 ORs.

; 4.24. Why are conditionals important?
; They allow us to program logic which behaviours depend on input conditions.

; 4.25. What does IF do if given two inputs instead of three?
; The third input becomes NIL.

; 4.26. COND can accept any number of clauses, but IF takes at most three inputs. How is it then that any function involving COND can be rewritten to use IF instead?
; Any COND statement can be rewritten using nested IF statements.

; 4.27. What does COND return if given no clauses, in other words, what does (COND) evaluate to?
; NIL

; 4.28. We can usually rewrite an IF as a combination of AND plus OR by following this simple scheme: Replace (IF test true-part false-part) with the equivalent expression (OR (AND test true-part) false-part). But this scheme fails for the expression (IF (ODDP 5) (EVENP 7) ’FOO). Why does it fail? Suggest a more sophisticated way to rewrite IF as a combination of ANDs and ORs that does not fail.
; -> That is because if the test return a truthy value, it always returns the true-part regardless of what it is.
; (or (and test true-part)
;     (and (not test)) false-part)

; 4.29. Write versions of LOGICAL-AND using IF and COND instead of AND.
(defun LOGICAL-AND-IF (a b)
  (if a (if b t)))

(defun LOGICAL-AND-COND (a b)
  (cond (a (cond (b t)))))

; 4.30. Write LOGICAL-OR. Make sure it returns only T or NIL for its result.
(defun LOGICAL-OR-IF (a b)
  (if a t (if b t nil)))

(defun LOGICAL-OR-COND (a b)
  (cond (a t)
        (b t)
        (t nil)))

; 4.31. Is NOT a conditional? Is it a boolean function? Do you need to write a LOGICAL-NOT function?
; -> NOT is a boolean function that always evaluates its input.

; 4.32. Construct a truth table for LOGICAL-OR.
; ->
;  x  |  y  | (LOGICAL-OR x y)
;   t |   t | t
;   t | nil | t
; nil |   t | t
; nil | nil | nil

; 4.33. Imagine a LOGICAL-IF function that works like IF does, except it always takes exactly three inputs, and its outputs are limited to T or NIL. How many lines are in its truth table?
; -> There are eight row, becaus ethe number of rows is equal to 2 to power of number of inputs.

; 4.34. Write down the truth table for LOGICAL-IF.
;   a |   b |   c | (LOGICAL-IF a b c)
;   t |   t |   t | t
;   t |   t | nil | t
;   t | nil |   t | nil
;   t | nil | nil | nil
; nil |   t |   t | t
; nil |   t | nil | nil
; nil | nil |   t | t
; nil | nil | nil | nil

; 4.35. Write down the DeMorgan equations for the three-input versions of AND and OR.
; ->
; (and a b c) = (not (or (not a) (not b) (not c)))
; (or a b c) = (not (and (not a) (not b) (not c)))

; 4.36. The NAND function (NAND is short for Not AND) is very commonly found in computer circuitry. Here is a definition of NAND. Write down its truth table.
; (defun nand (x y) (not (and x y)))
; ->
;   x |   y | (nand x y)
;   t |   t | nil
;   t | nil | t
; nil |   t | t
; nil | nil | t

; 4.37. NAND is called a logically complete function because we can construct all other boolean functions from various combinations of NAND. For example, here is a version of NOT called NOT2 contructed from NAND:
; (defun not2 (x) (nand x x))
; Construct versions of LOGICAL-AND and LOGICAL-OR by putting together NANDs. You will have to use more than one NAND in each case.
; ->
(defun logical-and (a b)
  (nand (nand a b) (nand a b)))
(defun logical-or (a b)
  (nand (nand a a) (nand b b)))

; 4.38. Consider the NOR function (short for Not OR). Can you write versions of NOT, LOGICAL-AND, NAND, and LOGICAL-OR by putting NORs together?
; ->
(defun not2 (a)
  (nor a a))
(defun logical-and (a b)
  (nor (nor a a) (nor b b)))
(defun logical-or (a b)
  (nor (nor a b) (nor a b)))
(defun nand (a b)
  (nor (nor (nor a a) (nor b b))
       (nor (nor a a) (nor b b))))

; 4.39. Is LOGICAL-AND logically complete the way NAND and NOR are?
; No, because we can't build NOT using it.