class Deposito{
  const property bicicletas

  method bicisRapidas() = bicicletas.filter({bicicleta => bicicleta.velocidadCrucero() > 25})

  method marcas() = bicicletas.map({bicicleta => bicicleta.marca()}).asSet()

  method esNocturno() = bicicletas.all({bicicleta => bicicleta.tieneLuz()})

  method tieneBiciQuePuedaLlevar(unPeso) = bicicletas.any({bicicleta => bicicleta.carga() > unPeso})
}