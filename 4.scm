(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

; 1
(print
  (atom? (quote 14)))
; #t

; 2
(print
  (atom? 14))
; #t

; 3
(print
  (atom? -3))
; #t

; 4
(print
  (atom? 3.1415))
; #t

; 6
(define add1
  (lambda (n)
    (+ n 1)))

(print
  (add1 67))
; 68

; 8
(define sub1
  (lambda (n)
    (- n 1)))

(print
  (sub1 5))
; 4

; 9
(print
  (zero? 0))
; #t

;12
(define myadd
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else (add1 (myadd n (sub1 m)))))))

; 11
(print
  (myadd 46 12))
; 58

; 18
(define mysub
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else (sub1 (mysub n (sub1 m)))))))

; 15
(print
  (mysub 14 3))
; 11

; 17
(print
  (mysub 18 25))
; -7

; 50
(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else (myadd (car tup) (addtup (cdr tup)))))))

; 25
(print (addtup (quote(3 5 2 8))))
; 18

; 57
(define myprod
  (lambda (n m)
    (cond
      ((zero? m) 0)
      (else (myadd n (myprod n (sub1 m)))))))

; 51
(print (myprod 5 3))
; 15

; 52
(print (myprod 13 4))
; 52

; 82
(define myadd_for_tuple
  (lambda (tup1 tup2)
    (cond
      ((and (null? tup1) (null? tup2)) (quote ()))
      (else
        (cons (myadd (car tup1) (car tup2))
              (myadd_for_tuple (cdr tup1) (cdr tup2)))))))

; 73
(print (myadd_for_tuple (quote(3 6 9 11 4)) (quote(8 5 2 0 7))))
; (11 11 11 11 11)

; 74
(print (myadd_for_tuple (quote(2 3)) (quote(4 6))))
; (6 9)

; 100
(define myadd_for_tuple2
  (lambda (tup1 tup2)
    (cond
      ((and (null? tup1) (null? tup2)) (quote ()))
      ((null? tup1) tup2)
      ((null? tup2) tup1)
      (else
        (cons (myadd (car tup1) (car tup2))
              (myadd_for_tuple2 (cdr tup1) (cdr tup2)))))))

(print (myadd_for_tuple2 (quote(3 7)) (quote(4 6 8 1))))
; (7 13 8 1)

(define myadd_for_tuple3
  (lambda (tup1 tup2)
    (cond
      ((null? tup1) tup2)
      ((null? tup2) tup1)
      (else
        (cons (myadd (car tup1) (car tup2))
              (myadd_for_tuple3 (cdr tup1) (cdr tup2)))))))

(print (myadd_for_tuple3 (quote(3 7 8 1)) (quote(4 6))))
; (7 13 8 1)

; 109
(define gt1
  (lambda (n m)
    (cond
      ((zero? m) #t)
      ((zero? n) #f)
      (else (gt1 (sub1 n) (sub1 m))))))

; 103
(print (gt1 12 133))
; #f

; 104
(print (gt1 120 11))
; #t

; 110
(print (gt1 3 3))
; #t

; 125
(define gt2
  (lambda (n m)
    (cond
      ((zero? n) #f)
      ((zero? m) #t)
      (else (gt2 (sub1 n) (sub1 m))))))

(print (gt2 3 3))
; #f

; 129
(define lt
  (lambda (n m)
    (cond
      ((zero? m) #f)
      ((zero? n) #t)
      (else (lt (sub1 n) (sub1 m))))))

(print (lt 2 3))
; #t

(print (lt 3 2))
; #f

(print (lt 2 2))
; #f

(print "; 130")
(define eq
  (lambda (n m)
    (cond
      ((gt2 n m) #f)
      ((lt n m) #f)
      (else #t))))

(print (eq 5 5))
; #t

(print (eq 4 5))
; #f

(print (eq 5 4))
; #f

(print "; 135: myexpt")

(define myexpt
  (lambda (n m)
    (cond
      ((zero? m) 1)
      (else (myprod n (myexpt n (sub1 m))))
    )
  )
)

(print (myexpt 2 3))
; 8

(print "; 140: myquotient")

(define myquotient
  (lambda (n m)
    (cond
      ((lt n m) 0)
      (else (add1 (myquotient (mysub n m) m)))
    )
  )
)

(print "; (myquotient 7 3) returns:")
(print (myquotient 7 3))
; 2

(print "; (myquotient 15 4) returns:")
(print (myquotient 15 4))
; 3

(print "; 145: length")

(define length
  (lambda (lat)
    (cond
      ((null? lat) 0)
      (else (add1 (length (cdr lat))))
    )
  )
)

(print "; (length '(hotdogs with mustard sauerkraut and pickles)) returns:")
(print (length '(hotdogs with mustard sauerkraut and pickles)))
; 6

(print "; 148: pick")

(define pick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (car lat))
      (else (pick (sub1 n) (cdr lat)))
    )
  )
)

(print "; (pick 4 '(lasagna spaghetti ravioli macaroni meatball)) returns:")
(print (pick 4 '(lasagna spaghetti ravioli macaroni meatball)))
; macaroni

(print "; 150: removing-pick")
; zero? を使ったリストの再帰 (rember は、null? を使ったリストの再帰だった)
(define removing-pick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (cdr lat))
      (else (cons 
              (car lat)
              (removing-pick (sub1 n) (cdr lat))
            )
      )
    )
  )
)

(print "; (removing-pick 3 '(hotdog with hot mustard)) returns:")
(print (removing-pick 3 '(hotdog with hot mustard)))
; (hotdog with mustard)

(print "; 154: no-nums")

(define no-nums
  (lambda (lat)
    (cond
      ((null? lat) (quote ()))
      (else (cond
              ((number? (car lat)) (no-nums (cdr lat)))
              (else (cons
                      (car lat)
                      (no-nums (cdr lat))
                    )
              )
            )
      )
    )
  )
)

(print "; (no-nums '(5 pears 6 prunes 9 dates)) returns:")
(print (no-nums '(5 pears 6 prunes 9 dates)))
; (pears prunes dates)

(print "; 155: all-nums")

(define all-nums
  (lambda (lat)
    (cond
      ((null? lat) (quote ()))
      (else
        (cond
          ((number? (car lat)) (cons
                                 (car lat)
                                 (all-nums (cdr lat))
                               )
          )
          (else (all-nums (cdr lat)))
        )
      )
    )
  )
)

(print "; (all-nums '(5 pears 6 prunes 9 dates)) returns:")
(print (all-nums '(5 pears 6 prunes 9 dates)))
; (5 6 9)
