(progn(while(neq(bind ?z(read))EOF)do(format t"%d cents:%n"?z)(progn$(?a(create$ 25 10 5 1))(and(>(bind ?l(div ?z ?a))0)(format t"%d x %d cents%n"?l ?a))(bind ?z(mod ?z ?a)))(format t"%n"))(exit))
