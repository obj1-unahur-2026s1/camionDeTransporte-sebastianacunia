
object camion {
    const cargaCamion = []

    method cargarCosa(cosa) {
        cargaCamion.add(cosa)
    }
    method descargarCosa(cosa) {
        cargaCamion.remove(cosa)
    }
    method pesoTotal() = 1000 + self.pesoCarga()

    method pesoCarga() = cargaCamion.sum({c => c.peso()})

    method pesosCargaSonPares() = cargaCamion.all({c => c.even()})

    method pesoDeCosa(peso) {
        return cargaCamion.any({c => c.peso() == peso})
    }

    method primerCosaConPeligrosidad(peligrosidad){
        return cargaCamion.find({c => c.nivelPeligrosidad() == peligrosidad})
    }

    method superaPeligrosidad(peligrosidad){
        return cargaCamion.filter({c => c.nivelPeligrosidad() > peligrosidad})
    }

    method facilitarControles(cosa){
        return cargaCamion.filter({c => c.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
    }

    method excedePesoPermitido(){
        return self.pesoTotal() > 2500
    }

    method puedeCircular(peligrosidadPermitida){
        return not self.excedePesoPermitido() && not cargaCamion.any({c => c.nivelPeligrosidad() > peligrosidadPermitida})
    }
}