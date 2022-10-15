import carpas.*

class Cerveza {
	const property lupulos
	const property paisOrigen
	
	//MOD cambie de property a setter y el getter lo deje sin cuerpo para sobreescribir y hacer la clase abstracta
	//method graduacionAlcoholica(unaGraduacionAlcoholica){graduacionAlcoholica = unaGraduacionAlcoholica} 
	method graduacion()
}

class CervezaRubia inherits Cerveza {
	var graduacionAlcoholica
	method graduacionAlcoholica(graduacion){graduacionAlcoholica=graduacion}
	override method graduacion() = graduacionAlcoholica
}

class CervezaNegra inherits Cerveza {	
	override method graduacion() = graduacionReglamentaria.graduacion().min(lupulos * 2)
}

class CervezaRoja inherits CervezaNegra {
	
	override method graduacion() = super() * 1.25
}

class Jarra {
	const property litros
	const property marca
	// Agrego para punto 14 y que no se rompan los test anteriores
	const property carpa = new CarpaCervecera(cantidadPersonasAdmitidas = 100, 
											  marca = new CervezaRubia(lupulos = 10,
																	   paisOrigen= "",
																	   graduacionAlcoholica = 0.4
											   		  )
						  )
	// Punto 1. Contenido de alcohol de la jarra.MOD se cambio por graduacion
	method contenidoDeAlcohol() = litros * marca.graduacion()
}

object graduacionReglamentaria {
	var property graduacion = 0.8
}



