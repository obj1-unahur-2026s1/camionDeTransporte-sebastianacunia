object cosas {
    
}
object knightRider {
    method peso() = 500
    method nivelPeligrosidad() = 10
}
object bumblebee {
    method peso() = 800

    var estaTransformadoEnAuto = true

    method nivelPeligrosidad() {
        return if (estaTransformadoEnAuto) 15 else 30
        }

    method estaTransformadoEnAuto() { return true
    }

    method transformar() {
        estaTransformadoEnAuto = not estaTransformadoEnAuto
        }
}
object paqueteLadrillos {
    var cantLadrillos = 10

    method cantLadrillos() = cantLadrillos
    method cargarLadrillos(cantidad) {
        cantLadrillos += cantidad
    }
    method descargarLadrillos(cantidad) {
        cantLadrillos -= cantidad
    }
    method peso() = self.cantLadrillos() * 2
    method nivelPeligrosidad() = 2
}
object arenaAGranel {
    var peso = 1000

    method peso() = peso
    method nivelPeligrosidad() = 1

    method cargarArena(pesoArena) {
        peso += pesoArena
    }
    method descargarArena(pesoArena) {
        peso -= pesoArena
    }
}
object bateriaAntiaerea {
    var tieneMisiles = false

    method peso() = if (tieneMisiles) 300 else 200
    method nivelPeligrosidad() = if (tieneMisiles) 100 else 0

    method cargarMisiles() {
        tieneMisiles = true
    }
    method descargarMisiles() {
        tieneMisiles = false
    }
}
object contenedorPortuario {
    const carga = []

    method peso() = 100 + carga.sum({c => c.peso()})
    method nivelPeligrosidad() = if (carga.isEmpty()) 0 else carga.max({c => c.nivelPeligrosidad()})
    
    method cargarCosa(cosa) {
        carga.add(cosa)
    }
    method descargarCosa(cosa) {
        carga.remove(cosa)
    }
}

object residuosRadioactivo {
    var peso = 0
    method peso() = peso
    method nivelPeligrosidad() = 200

    method agregarResiduosRadioactivos(cantidad) {
        peso += cantidad
    }

    method quitarResiduosRadioactivos(cantidad) {
        peso -= cantidad
    }
}

object embalajeDeSeguridad {
    var cobertura = bateriaAntiaerea

    method peso() = cobertura.peso()

    method nivelPeligrosidad() = cobertura.nivelPeligrosidad() / 2

    method cambiarCobertura(cosa) {
        cobertura = cosa
        }
}