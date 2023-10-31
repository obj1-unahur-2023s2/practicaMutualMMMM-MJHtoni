import socio.*

class Viajes{
	const property idioma = #{}
	
	method sirveParaBroncearse() = true
	method implicaEsfuerzo() = true
	method diasDeActividad()
	method esInteresante() = idioma.size() >= 2
	method actividadTranquila() = self.diasDeActividad() >= 4
	method esRecomendable(socio) {
		return self.esInteresante() and socio.actividadQueLeAtrae(self) and socio.actividades().all({a=>a != self})
	}
}

class ViajeDePlaya inherits Viajes{
	var largo
	
	override method diasDeActividad() = largo/500
	override method implicaEsfuerzo() {
		return largo > 1200
	}
}

class ExcursionACiudad inherits Viajes{
	var cantidadDeAtracciones
	
	override method diasDeActividad() = cantidadDeAtracciones/2
	override method implicaEsfuerzo() {
		return cantidadDeAtracciones.between(5,8)
	}
	override method sirveParaBroncearse() = false
}

class ExcursionACiudadTropical inherits ExcursionACiudad{
	override method diasDeActividad() = super() + 1
	override method sirveParaBroncearse() = true
	override method esInteresante() = super() or cantidadDeAtracciones == 5
}

class SalidaDeTrekking inherits Viajes{
	var kilometrosDeSendero
	var diasDeSolPorAnio
	
	override method diasDeActividad() = kilometrosDeSendero / 50
	override method implicaEsfuerzo() {
		return kilometrosDeSendero > 80
	}
	override method sirveParaBroncearse() {
		return diasDeSolPorAnio > 200 or (diasDeSolPorAnio.between(100,200) && kilometrosDeSendero > 120)
	}
	override method esInteresante() = super() and diasDeSolPorAnio > 140
}

class Gimnasia inherits Viajes{
	override method idioma() {
		return if (idioma.any({i=>i!="Espaniol"}))
			{self.error("Solo se usa Español")}
				else{"Espaniol"}
	}
	override method diasDeActividad() = 1
	override method sirveParaBroncearse() = false
	override method esRecomendable(socio) = socio.edad().between(20,30)
}
