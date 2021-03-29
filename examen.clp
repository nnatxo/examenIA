(deffacts datos
    (objetivo 21)
    (numeros 5 3 8 14 7 camino)
)

(defrule robot-paquete-almacen
    (declare (salience 50))
    (objetivo ?num_magico)
    (numeros $?ini ?num_magico $?fin camino $?camino)
=>
(
    halt()
)

(defrule suma
    (numeros $?ini ?num $?mitad ?num2 $?fin camino $?camino)
=>
(
    assert(robot ?rx =(- ?ry 1) =(+ ?rprof 1) paquete ?pq entregado ?entregado))
)

(defrule abajo
    (maxprof ?maxprof)
    (cuadricula ?X ?Y)
    (robot ?rx ?ry ?rprof paquete ?pq entregado ?entregado)
    (not (obstaculo ?rx =(+ ?ry 1)))
    (test(> ?maxprof ?rprof))
    (test(!= ?ry ?Y))
=>
(assert(robot ?rx (+ ?ry 1) (+ ?rprof 1) paquete ?pq entregado ?entregado))
)