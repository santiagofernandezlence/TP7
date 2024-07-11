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
  var energiaSable
  var tiempoEnLado
  var potenciaSable
  var tiempo = 0
  var suceso = 0
  
  method pasoDelTiempo() {
    tiempo += 1
  }
}

class Jedi inherits Maestros {
  var pazInterior = 1000
  
  method potenciaSable() = energiaSable * tiempoEnLado
  
  override method poder() = ((valentia + inteligencia) + (midiclorianos / 1000) + potenciaSable)
  
  method vivirSuceso(cargaEmocional) {
    pazInterior = pazInterior + cargaEmocional
    if (pazInterior <= 0) {
      return new Sith(valentia, inteligencia, midiclorianos, potenciaSable) // esto fue lo ultimo que hice pero me pone que esta mal y no se porque
    } else {
      return Jedi
    }
    // Retorna el mismo objeto Jedi si no cambia a Sith
  }
}

class Sith inherits Maestros {
  method potenciaSable() = (2 * energiaSable) + tiempoEnLado
  
  method poderSith() = ((valentia + inteligencia) + (midiclorianos / 1000)) + potenciaSable
}