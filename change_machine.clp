; problem0.clp
; Written by Joshua Scoggins 
; Fuck golfing! Elegance ftw!

(deffacts offsets
          (start line t)
          (capacities 25 10 5 1))

(defrule startup
         ?f <- (start line ?router)
         =>
         (retract ?f)
         (assert (readline ?router -> (readline ?router))))

(defrule create-line
         ?f <- (readline ?router -> ?current-line&~EOF)
         (capacities $?coins)
         =>
         (retract ?f)
         (bind ?input (string-to-field ?current-line))
         (assert (readline ?router -> (readline ?router))
                 (compute-change ?input $?coins -> (format nil "%d cents:%n" ?input))))

(defrule terminate-line
         ?f <- (readline ?router -> EOF)
         =>
         (retract ?f))

(defrule compute-capacities
         ?f <- (compute-change ?remainder ?coin $?rest -> ?str)
         =>
         (retract ?f)
         (bind ?d (div ?remainder ?coin))
         (assert (compute-change (- ?remainder (* ?d ?coin)) $?rest -> (if (> ?d 0) then
                                                                         (format nil "%s%d x %d cents%n" ?str ?d ?coin)
                                                                         else ?str))))

(defrule finished-computation
         ?f <- (compute-change ?remainder -> ?str)
         =>
         (retract ?f)
         (printout t ?str crlf))

(reset)
(run)
(exit)
