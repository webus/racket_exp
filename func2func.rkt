#lang racket
(define (func1 x) x);принимает на вход х и возвращает х
(func1 10)
(define (func2) "func2");просто возвращает func2
(func2)
(define x (func1 func2));теперь x - это объект экземпляра функции func2
(x)
x

(define (MyObject field1 field2) ;  объект у которого при конструировании будут две переменные field1 и field2  
    (let ((f1 field1) ; инициализация внутренней переменной f1, с помощью field1
          (f2 field2)) ; ...
    (define (get-f1) f1) ; вернуть значение внутреннего поля f1
    (define (get-f2) f2) ; ...
    (define (set-f1 x) (set! f1 x)) ; присваиваем f1 значение x
    (define (set-f2 x) (set! f2 x)) ; ...
    ; далее идет самое интересное
    (define (dispatch m)    ; функция диспетчирования функций в нашем объекте
          (cond ((eq? m 'get-f1) get-f1) ; если m равно get-f1, то возвращается функция get-f1
                ((eq? m 'set-f1) set-f1) ; ...
                ((eq? m 'get-f2) get-f2) ; ...
                ((eq? m 'set-f2) set-f2) ; ...
          )
    )
dispatch)) ; тут мы в функции MyObject возвращаем функцию диспетчирования 

(define Obj1 (MyObject " Hello " " world!!! ")) ; теперь Obj1 экземпляр

(display ((Obj1 'get-f1))) ; тут ф-ия display что-то типа printf, а двойные скобки
; в ((Obj1 'get-f1)) надо писать для того, чтобы вычислялась функция get-f1
(display ((Obj1 'get-f2))) ; аналогично
(newline)    ; переход на новую строку
; результатом будет " Hello world!!! "

(define Obj2 (MyObject " Hello " " habra!!! ")) ;
; результат: "Hello  Hello  habra!!!  world!!!"

(display ((Obj1 'get-f1))) 
(display ((Obj1 'get-f2))) 
(newline)    
(display ((Obj2 'get-f1))) 
(display ((Obj2 'get-f2))) 
(newline)
; результатом будет "Hello world!!!"
; и "Hello habra!!!" 

(define func-list (list (Obj1 'get-f1) (Obj2 'get-f1) (Obj2 'get-f2) (Obj1 'get-f2)))

(map (lambda (x) (display (x))) func-list)
; результат: «Hello Hello habra!!! world!!!»

;http://habrahabr.ru/post/144598/
(map (lambda (x) (+ x x)) (list 1 2 3 4 5))
