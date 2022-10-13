import marcas.*

class Persona {
	var property peso
	const property jarras = []
	var property escuchaMusicaTradicional
	var property nivelAguante
	
	method estaEbria() = self.litrosAlcohol() * peso > nivelAguante	
	
	// Devuelve la suma total de litros de las jarras.
	method litrosAlcohol() = jarras.sum({j=>j.litros()})
	
	method marcasDeCervezasQueGustan() = jarras
	
	// Agrega una jarra a la lista de jarras.
	method comproJarra(unaJarra) = jarras.add(unaJarra)
	
	// Devuelve lista de marcas de cervezas de las jarras.
	method marcasDeJarras() = self.marcasDeCervezasQueGustan().map({j=>j.marca()})
	
	// Devuelve booleano. True si hay marca x, false en caso contrario.
	method hayMarca(unaMarca) = self.marcasDeJarras().contains(unaMarca)
}

class PersonaBelga inherits Persona {
	
	 override method marcasDeCervezasQueGustan() = jarras.filter({j=>j.marca().lupulos() > 4})
}

class PersonaCheca inherits Persona {
	
	override method marcasDeCervezasQueGustan() = jarras.filter({j=>j.marca().graduacionAlcoholica() > 0.08})
}

class PersonaAlemana inherits Persona {
}
