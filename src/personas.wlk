import marcas.*

class Persona {
	var property peso
	const property jarras = []
	var property escuchaMusicaTradicional
	var property nivelAguante
	
	method estaEbria() = self.litrosAlcohol() * peso > nivelAguante	
	method litrosAlcohol() = jarras.sum({j=>j.litros()})
	
	method marcasDeCervezasQueGustan() = jarras
	
	method comproJarra(unaJarra) = jarras.add(unaJarra)
	
	method marcasDeJarras() = self.marcasDeCervezasQueGustan().map({j=>j.marca()})
	method hayMarca(unaMarca) = self.marcasDeJarras().contains(unaMarca)
}

class PersonaBelga inherits Persona {
	
	// Cervezas con más de 4 gramos de lúpulo por litro. Recorrido en jarras.
	 override method marcasDeCervezasQueGustan() = jarras.filter({j=>j.marca().lupulos() > 4})
	 

}

class PersonaCheca inherits Persona {
	// Cervezas de más de 8 % de graduación. Recorrido en jarras.
	 override method marcasDeCervezasQueGustan() = jarras.filter({j=>j.marca().graduacionAlcoholica() > 0.08})
}

class PersonaAlemana inherits Persona {
	
}
