import marcas.*

class Persona {
	var property peso
	var property jarras = []
	var property escuchaMusicaTradicional = true
	var property nivelAguante
	
	method estaEbria() = self.litrosAlcohol() * peso > nivelAguante
	
	// Agregar método que calcule litros de las jarras.
	method litrosAlcohol() = 10	// Hacer sum de jarras.
	
	// Recorrido por las jarras.
	// method marcasDeCervezasQueGustan() =
}

class PersonaBelga inherits Persona {
	
	// Cervezas con más de 4 gramos de lúpulo por litro. Recorrido en jarras.
	// override method marcasDeCervezasQueGustan() =
}

class PersonaCheca inherits Persona {
	// Cervezas de más de 8 % de graduación. Recorrido en jarras.
	// override method marcasDeCervezasQueGustan() =
}

class PersonaAlemana inherits Persona {
}
