import viajes.*
class Socio {
  const actividadesRealizadas 
  const maximoDeActividades

  method esAdoradorDelSol() = actividadesRealizadas.all({act => act.sirveParaBroncearse()})

  method actividadesEsforzadas() = actividadesRealizadas.filter({act => act.implicaEsfuerzo()})

  method registrarActividad(unaActividad){
    if (maximoDeActividades == actividadesRealizadas.size() + 1){
      self.error("Se llego al limite de actividades")
    }
    actividadesRealizadas.add(unaActividad)
  }
}