import viajes.*

class Socio{
	const property actividades = #{}
	const maximoDeViajes
	var property actividadesRealizadas = 0
	const property edad
	const idiomas = #{}
	
	method realizarActividad(actividad) {
		if(actividadesRealizadas == maximoDeViajes)
		{self.error("No puede hacer más viajes")}
		else
		{actividades.add(actividad)
		actividadesRealizadas ++}
	}
	method esAdoradorDelSol() = actividades.all({a=>a.sirveParaBroncearse()})
	method actividadesEsforzadas() = actividades.filter({a=>a.implicaEsfuerzo()})
	method actividadQueLeAtrae(actividad)
}

class SocioTranquilo inherits Socio{
	override method actividadQueLeAtrae(actividad) = actividad.actividadTranquila()
}

class SocioCoherente inherits Socio{
	override method actividadQueLeAtrae(actividad) {
		return if(self.esAdoradorDelSol())
		{actividad.sirveParaBroncearse()}
		else {actividad.implicaEsfuerzo()}
	} 
}