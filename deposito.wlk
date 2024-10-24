import bicicleta.*
class Deposito{
  const property bicicletas

  method bicisRapidas() = bicicletas.filter({bicicleta => bicicleta.velocidadCrucero() > 25})

  method marcas() = bicicletas.map({bicicleta => bicicleta.marca()}).asSet()

  method esNocturno() = bicicletas.all({bicicleta => bicicleta.tieneLuz()})

  method tieneBiciQuePuedaLlevar(unPeso) = bicicletas.any({bicicleta => bicicleta.carga() > unPeso})

  method marcaDeLaBiciMasRapida() = self.biciMasRapida().marca()

  method biciMasRapida() = bicicletas.max({bicicleta => bicicleta.velocidadCrucero()})

  method cargaTotalDeLasBicisLargas() = self.bicisLargas().sum({bicicleta => bicicleta.carga()})

  method bicisLargas() = bicicletas.filter({bicicleta => bicicleta.largo() > 170})

  method cantidadBicisSinAccesorios() = bicicletas.count({bicicleta => bicicleta.accesorios().size() == 0})

  method bicisCompanierasDe(unaBici) =  
    bicicletas.filter({bicicleta => self.sonCompanieras(unaBici, bicicleta) and unaBici != bicicleta})

  method sonCompanieras(unaBici, otraBici) = 
    unaBici.marca() == otraBici.marca() and (unaBici.largo() - otraBici.largo()).abs() <= 10
  
  method hayCompanieras() = bicicletas.any({bicicleta => not self.bicisCompanierasDe(bicicleta).isEmpty()})

  method parejasDeCompanieras(){
    const listaParejas = []
    bicicletas.forEach({bicicleta => 
      if (not self.bicisCompanierasDe(bicicleta).isEmpty() and 
      not listaParejas.contains([self.bicisCompanierasDe(bicicleta).first(), bicicleta])) 
          listaParejas.add([bicicleta, self.bicisCompanierasDe(bicicleta).first()])
      })

    return listaParejas
  } 

  method seHizoLaLuz(){
    const listaAuxiliar = [] + bicicletas
    var fueVistaLaPrimeraConLuz = false
    bicicletas.forEach({bicicleta => 
      if(not bicicleta.tieneLuz() and not fueVistaLaPrimeraConLuz)
        listaAuxiliar.remove(listaAuxiliar.first())
      else
        fueVistaLaPrimeraConLuz = true
      })

    return listaAuxiliar.all({bicicleta => bicicleta.tieneLuz()})
  }

}