(deffacts datos
    (objetivo 21)
    (numeros 5 3 8 14 7 62 41 camino)
)

(defrule suma
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
=>
(assert(numeros $?ini $?mitad $?fin (+ ?num ?num2) camino $?camino ))

    (printout t "sum!" crlf)
)

(defrule resta-mayor-primero
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
    (test(> ?num ?num2))
=>
(assert(numeros $?ini $?mitad $?fin (- ?num ?num2) camino $?camino ))
    (printout t "rest1!" crlf)
)

(defrule resta-mayor-segundo
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
    (test(> ?num2 ?num))
=>
(assert(numeros $?ini $?mitad $?fin (- ?num2 ?num) camino $?camino ))
    (printout t "rest2" crlf)
)

(defrule multiplicacion
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
=>
(assert(numeros $?ini $?mitad $?fin (* ?num2 ?num) camino $?camino ))
    (printout t "mult!" crlf)
)

(defrule division-divisor-primero
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
    (test(mod ?num ?num2))
=>
(assert(numeros $?ini $?mitad $?fin (div ?num ?num2) camino $?camino ))
    (printout t "div1!" crlf)
)

(defrule division-divisor-segundo
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
    (test(mod ?num2 ?num))
=>
(assert(numeros $?ini $?mitad $?fin (div ?num2 ?num) camino $?camino ))
    (printout t "div2!" crlf)
)

(defrule encontrado
    (declare (salience 50))
    (objetivo ?num_magico)
    (numeros ?num_magico camino $?camino)
=>
(halt)
)