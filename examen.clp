(deffacts datos
    (objetivo 21)
    (numeros 5 3 8 14 7 camino)
)

(defrule suma
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
=>
(assert(numeros $?ini $?mitad $?fin (+ ?num ?num2) camino $?camino ))
)

(defrule resta-mayor-primero
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
    (test(> ?num ?num2))
=>
(
    assert(numeros $?ini $?mitad $?fin (- ?num ?num2) camino $?camino )
))

(defrule resta-mayor-segundo
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
    (test(> ?num2 ?num))
=>
(
    assert(numeros $?ini $?mitad $?fin (- ?num2 ?num) camino $?camino )
))

(defrule multiplicacion
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
=>
(
    assert(numeros $?ini $?mitad $?fin (* ?num2 ?num) camino $?camino )
))

(defrule division-divisor-primero
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
    (test(mod ?num2 ?num))
=>
(
    assert(numeros $?ini $?mitad $?fin (* ?num2 ?num) camino $?camino )
))

(defrule division-divisor-segundo
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
=>
(
    assert(numeros $?ini $?mitad $?fin (* ?num2 ?num) camino $?camino )
))

(defrule encontrado
    (declare (salience 50))
    (objetivo ?num_magico)
    (numeros $?ini ?num_magico $?fin camino $?camino)
=>
(halt)
)