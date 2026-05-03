#lang sicp

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

(test 0 (p))
