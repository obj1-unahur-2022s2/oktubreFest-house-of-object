import marcas.*
import carpas.*

class Persona {
	var property peso
	const property jarras = []
	var property escuchaMusicaTradicional
	var property nivelAguante
	
	// Agrega una jarra a la lista de jarras.
	method comproJarra(unaJarra) = jarras.add(unaJarra)
		
	// Punto 2. Devuelve la suma total de litros de las jarras que ingirió la persona.
	method totalAlcohol() = jarras.sum({j=>j.litros()})
	
	// Punto 3. Devuelve true si está ebria, false en caso contrario.
	method estaEbria() = self.totalAlcohol() * peso > nivelAguante	

	// Punto 4.
	method marcasDeCervezasQueGustan() = jarras
	
	// Punto 4. Devuelve lista de marcas de cervezas de las jarras.
	method marcasDeJarras() = self.marcasDeCervezasQueGustan().map({j=>j.marca()})
	
	// Punto 4. Devuelve booleano. True si hay marca x, false en caso contrario.
	method hayMarca(unaMarca) = self.marcasDeJarras().contains(unaMarca)
	
	// Punto 5. Devuelve boolean. True si la persona quiere entrar a una carpa, false en caso contrario.
	method quiereEntrarPersonaACarpa(unaPersona, unaCarpa) = self.hayMarca(unaCarpa.marca()) and 
	escuchaMusicaTradicional == unaCarpa.tienenBandaTradicional()
	
	// Punto 7. Devuelve boolean. True si quiere entrar a la carpa y lo dejan entrar. False en caso contrario. 
	method puedeIngresarPersonaACarpa(unaPersona, unaCarpa) = unaCarpa.puedeIngresarPersona(unaPersona)
	
	// Punto 10. Devuelve true si todas las jarras son de 1 litro o más. False en caso contrario.
	method sonTodasJarrasDe1LitroOMas() = jarras.all({ j => j.litros() >= 1})
	
	// Punto 11. Devuelve boolean. True si la persona compró todas jarras del país del que proviene.
	method esPatriota(unaPersona) = jarras.all({j => j.marca().paisOrigen() == unaPersona})
}

class PersonaBelga inherits Persona {
	
	// Punto 4.
	 override method marcasDeCervezasQueGustan() = jarras.filter({j=>j.marca().lupulos() > 4})
}

class PersonaCheca inherits Persona {
	
	// Punto 4.
	override method marcasDeCervezasQueGustan() = jarras.filter({j=>j.marca().graduacionAlcoholica() > 0.08})
}

class PersonaAlemana inherits Persona {
	
	// Punto 5. super() and cantidad par de personas en la carpa (antes de entrar ellos).
	override method quiereEntrarPersonaACarpa(unaPersona,unaCarpa) = super(unaPersona,unaCarpa) and 
	unaCarpa.cantidadPersonasAdmitidas() % 2 == 0
	
}
