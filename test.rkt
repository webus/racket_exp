#lang racket
(require net/url xml)
(require xml/path)

(define doc (read-xml (get-pure-port (string->url "http://search.twitter.com/search.atom?&q=#arkh"))))
(define tree-doc (xml->xexpr (document-element doc)))

;(display-xml tree-doc)
;(se-path*/list '(updated) tree-doc)
;(se-path*/list '(uri) tree-doc)
(se-path*/list '(id) tree-doc)

(define (together s1 s2)
  (string-append s1 s2))
(define (html s)
  (string-append "<html>" s "</html>"))
(define (head s)
  (string-append "<head>" s "</head>"))
(define (body s)
  (string-append "<body>" s "</body>"))
(define (html5 s)
  (string-append "<!doctype html>" s))

;(html5 (html (together (head "34") (body "45"))))