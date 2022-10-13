class Cerveza {
	const property lupulos
	const property paisOrigen
	var property graduacionAlcoholica
	
	method graduacion() = graduacionAlcoholica
}

class CervezaRubia inherits Cerveza {
	
}

class CervezaNegra inherits Cerveza {
	var property graduacionReglamentaria
	
	override method graduacion() = graduacionReglamentaria.min(lupulos * 2)
}

class CervezaRoja inherits CervezaNegra {
	override method graduacion() = super() * 1.25
}

class Jarra {
	const property litros
	const property marca
	
	method contenidoDeAlcohol() = litros * marca.graduacionAlcoholica()
}



