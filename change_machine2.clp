(defrule c(i ?z&~EOF $?y)=>(format t"%d cents:%n"?z)(progn$(?a ?y)(and(>(bind ?l(div ?z ?a))0)(format t"%d x %d cents%n"?l ?a))(bind ?z(mod ?z ?a)))(format t"%n")(assert(i(read)$?y)))
(progn(assert(i(read)25 10 5 1))(run)(exit))
