class Jarra {
	const property litros
	const property marca
	
	method contenidoDeAlcohol() = litros * marca.graduacionAlcoholica()
}

class Cerveza {
	const property cantLupos
	const property paisOrigen
	var property graduacionAlcoholica
	
	method graduacion() = graduacionAlcoholica
}

class CervezaRubia inherits Cerveza {
}

class CervezaNegra inherits Cerveza {
	var property graduacionReglamentaria
	
	override method graduacion() = graduacionReglamentaria.min(cantLupos * 2)
}

class CervezaRoja inherits CervezaNegra {
	override method graduacion() = super() * 1.25
}