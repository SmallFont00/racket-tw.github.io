#lang pollen

◊(require pollen/unstable/pygments)

◊h1{Quick Start}

racket 有一個奇特的怪僻，就是每個檔案都必須標明自己的

◊highlight['racket]{#lang xxx}

，一開始只要先記得

◊highlight['racket]{#lang racket}

就可以了。

◊h3{常見的值與表達式}

racket 作為一個實用的程式語言，自然有熟悉的概念出現，下面就簡單條列一些常見的值與表達式吧：

◊highlight['racket]{
;;; 註解是用 ; 為開頭
"我是字串" ; 字串
#t ; True
#f ; False
1 ; Integer
3.14 ; Float
4/3 ; Real
3+4i ; Complex
e ; 不是，我就只是叫 e 的變數 XD

'(1 2 3) ; Listof Integer，也可以寫
(list 1 2 3) ; 兩邊有微妙的差別但暫時還沒有很重要

(λ (x) x) ; lambda，也有人翻譯叫匿名函數，也可以寫成
(lambda (x) x) ; 但在 racket 內建 IDE DrRacket 裡面打出 λ 只需要按 command+\ 非常容易
(define x 1) ; 定義變數
(define (id x) x) ; 定義函數，也可以寫成
(define id (λ (x) x)) ; 但並不會比較好讀 :)

(set! x 2) ; 重綁定 x(a.k.a. 賦值)

(f a b c) ; 函數呼叫，函數是 f，參數是 a b c
}

◊h3{小技巧}

作為 Lisp 的主要分支之一，racket 到處都是 () [] 等 S expression，並且稱呼 define 等特殊的表達式為 form。
分辨函數與 form 在 racket 中並不容易，但影響其實不大，因為很少有人會需要弄清楚兩者的差別。
[] 與 () 可以隨意替換使用，這有助於改善可讀性。例如 match 這個用來做 pattern matching 的 form：

◊highlight['racket]{
(match t
  [(t:1 _ _ _) #t]
  [(t:3 a _ c) (a c)]
  [_ #f])
}

在 racket 中有兩點需要特別注意：

1. 急切求值，簡單來說就是運算會馬上發生，與 ◊em{Haskell} 成為對比。
2. 沒有 return，也沒有 exception。

等等，看到第二點先別急著說這什麼垃圾 www，雖然沒有內建 return 或是 exception，但 racket 提供了更強大的工具 ◊em{continuation}：

◊highlight['racket]{
(define (foo x)
  (let/cc return
    (when (string? x)
      (return x))
    1))
(foo 1)
;;; 1
(foo "a")
;;; "a"
(foo 'a)
;;; 1
}

雖然在這個案例裡面內建 return 的語言更方便，但 ◊em{continuation} 提供了更多功能，不過這邊就不深入介紹，之後再另開文章寫這個 XD。

◊h3{總結}

希望這段超短教學可以讓讀者看懂一些 racket 的程式了，如果覺得有哪些資訊也應該放進這篇裡面可以寄信(◊author-mail)告訴我，
如果有想了解的內容但還沒有相關教學可以 ◊link["https://github.com/racket-tw/racket-tw.github.io/issues/new"]{開新 issue}。

◊p{}

◊author 編輯
