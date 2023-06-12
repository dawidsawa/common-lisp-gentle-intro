; 5.1. Rewrite function POOR-STYLE to create a new local variable Q using LET, instead of using SETF to change P. Call your new function GOOD-STYLE.
(defun good-style (p)
  (let ((q (+ p 5)))
    (list 'result 'is q)))

; 5.2. What is a side effect?
; Answer: It is something the function does besides returning a value. 

; 5.3. What is the difference between a local and global variable?
; Answer: Variables are visiable only within their lexical scope and are visible in more narrow scope, but never outside of their scope. Global variables are placed in the global scope making them omnipresent.

; 5.4. Why must SETF be a macro function instead of a regular function?
; Answer: This is because it does not evaluate its first argument.

; 5.5. Are LET and LET* equivalent when you are only creating one local variable?
; Answer: Yes, they are. LET* is used when creating more than one and they are dependant on variables created in the same LET* call.

; 5.6. This keyboard exercise is about dice. We will start with a function to throw one die and end up with a program to play craps. Be sure to include a documentation string for each function you write.
; a. Write a function THROW-DIE that returns a random number from 1 to 6, inclusive. Remember that (RANDOM 6) will pick numbers from 0 to 5. THROW-DIE doesn't need any inputs, so its argument list should be NIL.
(defun throw-die nil
  "Rolls a D6 die."
  (1+ (random 6)))
; b. Write a function THROW-DICE that throws two dice and returns a list of two numbers: the value of the first die and the value of the second. We'll call this list a "throw". For example, (THROW-DICE) might return the throw (3 5), indicating that the first die was a 3 and the second a 5.
(defun throw-dice nil
  "Rolls two D6 dice."
  (list (throw-die) (throw-die)))
; c. Throwing two ones is called "snake eyes"; two sixes is called "boxcars." Write predicates SNAKE-EYES-P and BOXCARS-P that take a throw as input and return T if the throw is equal to (1 1) or (6 6), respectively.
(defun snake-eyes-p (throw)
  "Checks whether a throw is two ones."
  (equal throw '(1 1)))
(defun boxcars-p (throw)
  "Checks whether a throw is two sixes."
  (equal throw '(6 6)))
; d. In playing craps, the first throw of the dice is crucial. A throw of 7 or 11 is an instant win. A throw of 2, 3, or 12 is an instant loss (American casino rules). Write predicates INSTANT-WIN-P and INSTANT-LOSS-P to detect these conditions. Each should take a throw as input.
(defun instant-win-p (throw)
  "Checks whether throw has a value of 7 or 11 for an instant win."
  (let
    ((value (+ (first throw) (second throw))))
    (member value '(7 11))))
(defun instant-loss-p (throw)
  "Checks whether throw has a value of 2, 3 or 12 for an instant loss."
  (let
    ((value (+ (first throw) (second throw))))
    (member value '(2 3 12))))
; e. Write a function SAY-THROW that takes a throw as input and returns either the sum of the two dice or the symbol SNAKE-EYES or BOXCARS if the sum is 2 or 12. (SAY-THROW '(3 4)) should return 7. (SAY-THROW '(6 6)) should return BOXCARS.
(defun say-throw (throw)
  "Says the name of the throw or its value."
  (cond
      ((snake-eyes-p throw) 'snake-eyes)
      ((boxcars-p throw) 'boxcars)
      (t (+ (first throw) (second throw)))))
; f. If you don't win or lose on the first throw of the dice, the value you threw becomes your "point", which will be explained shortly. Write a function (CRAPS) that produces the following sort of behavior. Your solution should make use of the functions you wrote in previous steps.
; > (craps)
; (THROW 1 AND 1 -- SNAKEYES -- YOU LOSE)
; > (craps)
; (THROW 3 AND 4 -- 7 -- YOU WIN)
; > (craps)
; (THROW 2 AND 4 -- YOUR POINT IS 6)
(defun craps nil
  "Plays craps and tells whether you've got an instant win, instant loss, or your points"
  (let* ((throw (throw-dice))
         (throw-value (+ (first throw) (second throw))))
  (append
    (list 'throw (first throw) 'and (second throw) '-- (say-throw throw) '-- )
    (cond
      ((instant-win-p throw) '(you win))
      ((instant-loss-p throw) '(you lose))
      (t (list 'your 'point 'is throw-value))))))
; g. Once a point has been established, you continue throwing the dice until you either win by making the point again or lose by throwing a 7. Write the function TRY-FOR-POINT that simulates this part of the game, as follows:
; > (try-for-point 6)
; (THROW 3 AND 5 -- 8 -- THROW AGAIN)
; > (try-for-point 6)
; (THROW 5 AND 1 -- 6 -- YOU WIN)
; > (craps)
; (THROW 3 AND 6 -- YOUR POINT IS 9)
; > (try-for-point 9)
; (THROW 6 AND 1 -- 7 -- YOU LOSE)
(defun try-for-point (point)
  "Plays craps and tells whther you've got an instant win, instant loss, desired point, or lost."
  (let* ((throw (throw-dice))
         (throw-value (+ (first throw) (second throw))))
  (append
    (list 'throw (first throw) 'and (second throw) '-- (say-throw throw) '-- )
    (cond
      ((equal point throw-value) '(you win))
      ((equal 7 throw-value) '(you lose))
      (t '(throw again))))))
