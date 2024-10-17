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
}