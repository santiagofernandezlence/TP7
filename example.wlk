import vm

class Planeta {
  const habitantes = []
  
  method poder() = habitantes.sum({ habitante => habitante.poder() })
}

class Habitantes {
  const valentia
  const inteligencia
  
  method poder() = valentia + inteligencia
}

class Soldados inherits Habitantes {
  const equipamientos = []
  
  method potencia() {
    const equipamientosUtiles = equipamientos.filter(
      { equipamiento => equipamiento.esUtil() }
    ) // aca me dice si el arma es util
    const potenciaArmas = equipamientosUtiles.sum(
      { equipamiento => equipamiento.potencia() }
    ) // aca me esta dando la potencia de las armas utiles
    return potenciaArmas
  }
  
  override method poder() = super() + self.potencia()
  //agrego el metodo poder de los habitantes (con el super) mas el de la potencia 
}

class Arma {
  var potencia
  var desgastado
  
  method potencia() = potencia
  
  method esUtil() = (potencia > 10) and (!desgastado)
}

class Maestros inherits Soldados {
  var midiclorianos
  var energiaSable // no creo la clase porque no me parece necesario separarlo de maestro
  var tiempoEnLado
  var potenciaSable
  var tiempo = 0
  var suceso = 0
  var pazInterior = 1000
  var lado 

  method pasoDelTiempo() {
    tiempo += 1
  }
  
  override method poder() = ((valentia + inteligencia) + (midiclorianos / 1000)) + potenciaSable
  
  method energiaSable() = energiaSable
  
  method tiempoEnLado() = tiempoEnLado
  
  method cambiarPazInterior(cargaEmocional) {
    pazInterior += cargaEmocional
  }
  
  method pazInterior() = pazInterior

  method setLado(unLado) {lado = unLado}
}
object jedi {
  method potenciaSable(maestro) = maestro.energiaSable() * maestro.tiempoEnLado()
  
  method vivirSuceso(cargaEmocional, maestro) {
    maestro.cambiarPazInterior(cargaEmocional)
    if (maestro.pazInterior() <= 0) {
     maestro.setLado(sith)
    }
  }
}
object sith {
  method potenciaSable(maestro) = 2 * maestro.energiaSable() + maestro.tiempoEnLado()
    method vivrSuceso(cargaEmocional, maestro) {
      maestro.cambiarPazInterior(cargaEmocional)
    }
  }
