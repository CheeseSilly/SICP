#lang sicp
(#%require trace)
(#%require racket/pretty)

;1.1
10
(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)
(if (and (> b a) (< b (* a b)))
    b
    a)
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
(+ 2 (if (> b a) b a))
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))

;1.2
(/ (+ 5 4 (- 2
             (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7))
   )

;1.3
(define (squre x)
  (* x x)
  )
(define (f a b c)
  (cond ((and (< a b) (< a c)) (+ (squre b) (squre c)))
        ((and (< a b) (> a c)) (+ (squre b) (squre a)))
        ((and (< b a) (< b c)) (+ (squre a) (squre c)))
        ((and (< b a) (> b c)) (+ (squre a) (squre b)))
        )
  )
(f 1 2 3)

;1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b -1 2)
(a-plus-abs-b 1 2)

;1.5
;applicative-order evaluation : deal with these variables before unfold
;normal-order evaluation: deal with these variables after unfold has been done
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; (test 0 (p))

;1.6
;if:ture will eval then,or will eval else
;applicative-order evaluation! new-if is common func,will eval all formal first.
;so itll always eval,infinitely loop
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (square x)
  (* x x)
  )

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

; also there's not tail recursion(call)
; when sqrt-iter done,then eval cond
; but new-if need cond,when cond done,then new-if
; sqrt-iter need new-if,when new-if done,then sqrt-iter
; sqrt-iter->cond->new-if->sqrt-iter

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;(sqrt 2)

;Special forms are necessary to control evaluation.
;Eager evaluation prevents short-circuiting:But common func aint no this application
;Under call-by-value, arguments are evaluated before function application.


;1.7
(sqrt 2)

(define (good-enough?2 guess_new guess_old)
  (< (/ (abs (- guess_new guess_old)) guess_old) 0.001)
  )

(define (sqrt-iter1.7 guess x)
  (if (good-enough?2 guess (improve guess x))
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt1.7 x)
  (sqrt-iter1.7 1.0 x))

(sqrt1.7 0.00001)
(sqrt 0.00001)

;1.8
;x
;guess:cube root of x

(define (cube guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3)
  )

(define (cube-iter guess x)
  (if (good-enough?2 guess (cube guess x))
      guess
      (cube-iter (cube guess x) x)
      )
  )

(define (cube_root x)
  (cube-iter 1.0 x)
  )

(cube_root 27)