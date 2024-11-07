import viajes.*
class Socio {
  const property actividadesRealizadas = #{}
  const maximoDeActividades
  var edad
  const idiomasQueHabla 

  method adoraElSol() = actividadesRealizadas.all({act => act.sirveParaBroncearse()})

  method actividadesEsforzadas() = actividadesRealizadas.filter({act => act.implicaEsfuerzo()})

  method registrarActividad(unaActividad){
    if (maximoDeActividades == actividadesRealizadas.size()){
      self.error("Se llego al limite de actividades")
    }
    actividadesRealizadas.add(unaActividad)
  }

  method leAtrae(unaActividad)

  method edad() = edad
}

class SocioTranquilo inherits Socio{

  override method leAtrae(unaActividad) = unaActividad.cuantosDias() >= 4
}

class SocioCoherente inherits Socio{

  override method leAtrae(unaActividad) = 
    if(self.adoraElSol()) unaActividad.sirveParaBroncearse() else unaActividad.implicaEsfuerzo()
}

class SocioRelajado inherits Socio{
  
  override method leAtrae(unaActividad) = idiomasQueHabla.any({idioma => unaActividad.idiomas().contains(idioma)})
}