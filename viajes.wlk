class Actividad {
  const property idiomas = #{}

  method implicaEsfuerzo()

  method sirveParaBroncearse()

  method cuantosDias()

  method esInteresante() = idiomas.size() > 1

  method esRecomendadaPara(unSocio) = 
    self.esInteresante() and unSocio.leAtrae(self) and not unSocio.actividadesRealizadas().contains(self)
}

class ViajeDePlaya inherits Actividad{
  const largoDePlaya

  override method implicaEsfuerzo() = largoDePlaya > 1200

  override method sirveParaBroncearse() = true

  override method cuantosDias() = largoDePlaya / 500
}

class ExcursionALaCiudad inherits Actividad {
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

class SalidaDeTrekking inherits Actividad {
  const cantKmSenderos
  const cantDiasDeSolDelLugar

  override method implicaEsfuerzo() = cantKmSenderos > 80

  override method sirveParaBroncearse() = 
    cantDiasDeSolDelLugar > 200 or (cantDiasDeSolDelLugar.between(100, 200) and cantKmSenderos > 120)

  override method cuantosDias() = cantKmSenderos / 50

  override method esInteresante() = super() and cantDiasDeSolDelLugar > 140
}

class ClaseDeGimnasia inherits Actividad {

  method initialize(){
    idiomas.clear()
    idiomas.add("español")
  }

  override method implicaEsfuerzo() = true

  override method sirveParaBroncearse() = false

  override method cuantosDias() = 1

  override method esRecomendadaPara(unSocio) = unSocio.edad().between(20, 30)
}

class TallerLiterario inherits Actividad () {
  const property libros = []

  override method idiomas() = libros.map({libro => libro.idioma()}).asSet().asList()

  override method cuantosDias() = libros.size() + 1

  override method implicaEsfuerzo() = 
    self.hayAlgunLibroConMasDe500() or (self.todosLosLibrosSonDelMismoAutor() and libros.size() > 1)

  method hayAlgunLibroConMasDe500() = libros.any({libro => libro.cantPaginas() > 500}) 

  override method sirveParaBroncearse() = false

  method todosLosLibrosSonDelMismoAutor(){
    const primerAutor = libros.first().nombreAutor()

    return libros.all({libro => libro.nombreAutor() == primerAutor})
  }

  override method esRecomendadaPara(unSocio) = unSocio.idiomasQueHabla().size() > 1
}

class Libro {
  const idioma
  const cantPaginas
  const nombreAutor

  method idioma() = idioma

  method cantPaginas() = cantPaginas

  method nombreAutor() = nombreAutor
}