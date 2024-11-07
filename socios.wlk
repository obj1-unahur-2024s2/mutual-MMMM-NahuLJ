import viajes.*
class Socio {
  const property actividadesRealizadas 
  const maximoDeActividades

  method adoraElSol() = actividadesRealizadas.all({act => act.sirveParaBroncearse()})

  method actividadesEsforzadas() = actividadesRealizadas.filter({act => act.implicaEsfuerzo()})

  method registrarActividad(unaActividad){
    if (maximoDeActividades == actividadesRealizadas.size()){
      self.error("Se llego al limite de actividades")
    }
    actividadesRealizadas.add(unaActividad)
  }
}