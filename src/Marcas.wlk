class Cerveza {
	const property cantlupos
	
	const property paisOrigen
	
	var property gradAlcholica
	
	const property graduReglamentaria
	
	method graduacion()
}

class CervezaRubia inherits Cerveza{
	
	override method graduacion(){
	return gradAlcholica
	}
	
}

class CervezaNegra inherits Cerveza{
	
	override method graduacion(){
	return graduReglamentaria.min(cantlupos*2)
	}
}

class CervezaRoja inherits Cerveza{
	
	override method graduacion(){
	return gradAlcholica
	}
}