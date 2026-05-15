object cosas {
    
}
object knightRider {
    method peso() = 500
    method nivelPeligrosidad() = 10
    method bultosQueOcupa() = 1
    method consecuenciaDeCarga() {}
}
object bumblebee {
    method peso() = 800
    method nivelPeligrosidad() = if (estaTransformadoEnAuto) 15 else 30
    method bultosQueOcupa() = 2
    method consecuenciaDeCarga() { self.transformarseEnRobot() }

    var estaTransformadoEnAuto = true


    method estaTransformadoEnAuto() {
        return estaTransformadoEnAuto
    }

    method transformarseEnRobot() {
        estaTransformadoEnAuto = false
    }
    method transformarseEnAuto() {
        estaTransformadoEnAuto = true
    }
}
object paqueteLadrillos {
    var cantLadrillos = 10

    method peso() = self.cantLadrillos() * 2
    method nivelPeligrosidad() = 2
    method bultosQueOcupa() = if (self.cantLadrillos() <= 100) 1 else if ( self.cantLadrillos() <= 300) 2 else 3
    method consecuenciaDeCarga() { self.cargarLadrillos(12) }

    method cantLadrillos() = cantLadrillos

    method cargarLadrillos(cantidad) {
        cantLadrillos += cantidad
    }

    method descargarLadrillos(cantidad) {
        cantLadrillos -= cantidad
    }

}
object arenaAGranel {
    var peso = 1000

    method peso() = peso
    method nivelPeligrosidad() = 1
    method bultosQueOcupa() = 1
    method consecuenciaDeCarga() { self.descargarArena(10) }

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
    method bultosQueOcupa() = if (tieneMisiles) 2 else 1
    method consecuenciaDeCarga() { self.cargarMisiles() }

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
    method bultosQueOcupa() = 1 + carga.sum({c => c.bultosQueOcupa()})
    method consecuenciaDeCarga() { carga.first().consecuencia() }

    
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
    method bultosQueOcupa() = 1
    method consecuenciaDeCarga() { self.agregarResiduosRadioactivos(15) }

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
    method bultosQueOcupa() = 2
    method consecuenciaDeCarga() {}

    method cambiarCobertura(cosa) {
        cobertura = cosa
        }
}