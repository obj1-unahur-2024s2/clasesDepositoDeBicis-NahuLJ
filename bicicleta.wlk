class Bicicleta{
  const rodado 
  const largo 
  const marca 
  const accesorios

  method altura() = rodado * 2.5 + 15

  method velocidadCrucero() = if (self.altura() > 120) rodado + 6 else rodado + 2

  method carga() = accesorios.sum({accesorio => accesorio.carga()})

  method peso() = rodado / 2 + self.pesoDeLosAccesorios()

  method pesoDeLosAccesorios() = accesorios.sum({accesorio => accesorio.peso()})

  method tieneLuz() = accesorios.any({accesorio => accesorio.esLuminoso()})

  method cantidadDeAccesoriosLivianos() = accesorios.count({accesorio => accesorio.peso() < 1})
}
