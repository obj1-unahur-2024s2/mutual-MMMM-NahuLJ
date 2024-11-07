class Viaje {
  const property idiomas 

  method implicaEsfuerzo()

  method sirveParaBroncearse()

  method cuantosDias()

  method esInteresante() = idiomas.size() > 1

  method esRecomendadaPara(unSocio) = 
    self.esInteresante() and unSocio.leAtrae(self) and not unSocio.actividadesRealizadas().contains(self)
}

class ViajeDePlaya inherits Viaje{
  const largoDePlaya

  override method implicaEsfuerzo() = largoDePlaya > 1200

  override method sirveParaBroncearse() = true

  override method cuantosDias() = largoDePlaya / 500
}

class ExcursionALaCiudad inherits Viaje {
  const cantAtracciones

  override method implicaEsfuerzo() = cantAtracciones.between(5, 8)

  override method sirveParaBroncearse() = false

  override method cuantosDias() = cantAtracciones * 0.5

  override method esInteresante() = super() or cantAtracciones == 5
}

class ExcursionACiudadTropical inherits ExcursionALaCiudad {

  override method sirveParaBroncearse() = true

  override method cuantosDias() = super() + 1
}

class SalidaDeTrekking inherits Viaje {
  const cantKmSenderos
  const cantDiasDeSolDelLugar

  override method implicaEsfuerzo() = cantKmSenderos > 80

  override method sirveParaBroncearse() = 
    cantDiasDeSolDelLugar > 200 or (cantDiasDeSolDelLugar.between(100, 200) and cantKmSenderos > 120)

  override method cuantosDias() = cantKmSenderos / 50

  override method esInteresante() = super() and cantDiasDeSolDelLugar > 140
}

class ClaseDeGimnasia inherits Viaje () {

  method initialize(){
    idiomas.clear()
    idiomas.add("español")
  }

  override method implicaEsfuerzo() = true

  override method sirveParaBroncearse() = false

  override method cuantosDias() = 1

  override method esRecomendadaPara(unSocio) = unSocio.edad().between(20, 30)
}