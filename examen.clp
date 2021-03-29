(deffacts datos
    (objetivo 13)
    (numeros 17 13 19 7 41 camino)
)

(defrule suma
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
=>
(assert(numeros $?ini $?mitad $?fin (+ ?num ?num2) camino $?camino ?num suma ?num2 ))

    (printout t "sum" crlf)
)

(defrule resta-mayor-primero
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
    (test(> ?num ?num2))
    (test(<> 0 (- ?num ?num2)))
=>
(assert(numeros $?ini $?mitad $?fin (- ?num ?num2) camino $?camino ?num resta ?num2 ))
    (printout t "rest-1" crlf)
)

(defrule resta-mayor-segundo
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
    (test(> ?num2 ?num))
    (test(<> 0 (- ?num2 ?num)))
=>
(assert(numeros $?ini $?mitad $?fin (- ?num2 ?num) camino $?camino ?num2 resta ?num ))
    (printout t "rest-2" crlf)
)

(defrule multiplicacion
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
=>
(assert(numeros $?ini $?mitad $?fin (* ?num2 ?num) camino $?camino ?num multiplica ?num2 ))
    (printout t "mult" crlf)
)

(defrule division-divisor-primero
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
    (test(= 0 (mod ?num ?num2)))
=>
(assert(numeros $?ini $?mitad $?fin (div ?num ?num2) camino $?camino ?num divide entre ?num2 ))
    (printout t "div-1" crlf)
)

(defrule division-divisor-segundo
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
    (test(= 0 (mod ?num2 ?num)))
=>
(assert(numeros $?ini $?mitad $?fin (div ?num2 ?num) camino $?camino ?num2 divide entre ?num ))
    (printout t "div-2!" crlf)
)

(defrule encontrado
    (declare (salience 50))
    (objetivo ?num_magico)
    (numeros ?num_magico camino $?camino)
=>
(halt)
)