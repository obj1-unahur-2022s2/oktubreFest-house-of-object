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

	// Punto 4. ¿POR QUE DEVUELVE JARRAS?
	method marcasDeCervezasQueGustan() = jarras
	// MOD el punto 4 me parece que es esto
	method leGustasUna(marca)	
	// Punto 4. Devuelve lista de marcas de cervezas de las jarras. MOD, aca estaba usando marcasDeCervezasQueGustan, que es lo mismo que jarras
	method marcasDeJarras() = jarras.map({j=>j.marca()})
	
	// Punto 4. Devuelve booleano. True si hay marca x, false en caso contrario.
	method hayMarca(unaMarca) = self.marcasDeJarras().contains(unaMarca)
	
	// Punto 5. Devuelve boolean. True si la persona quiere entrar a una carpa, false en caso contrario.MOD ajusto condiciones
	method quiereEntrarPersonaACarpa(unaCarpa) = self.leGustasUna(unaCarpa.marca())//self.hayMarca(unaCarpa.marca()) 
												&& escuchaMusicaTradicional == unaCarpa.tienenBandaTradicional()
	
	// Punto 7. Devuelve boolean. True si quiere entrar a la carpa y lo dejan entrar. False en caso contrario. MOD me paso como param
	method puedeIngresarPersonaACarpa(unaCarpa) = unaCarpa.puedeIngresarPersonaACarpa(self)
	
	// Punto 10. Devuelve true si todas las jarras son de 1 litro o más. False en caso contrario.
	method sonTodasJarrasDe1LitroOMas() = jarras.all({ j => j.litros() >= 1})
	
	// Punto 11. Devuelve boolean. True si la persona compró todas jarras del país del que proviene.MOD, saco persona y comparo con nacionalidad
	method esPatriota() = jarras.all({j => j.marca().paisOrigen() == self.nacionalidad()})
	// Punto 12. Saber si dos personas son compatibles. La condición es que considerando las marcas de compró cada uno, hay más coincidencias 
	//(o sea, marcas que compraron los dos), que diferencias (o sea, marcas que compró uno y el otro no).
	method esCompatibleCon(otraPersona) = self.CantidadDeMarcasQueComparteCon(otraPersona) 
										> self.CantidadDeMarcasQueNoComparteCon(otraPersona)
	// Tiene una Marca revision de punto 4
	method tiene(unaMarca) = jarras.any({
		marca => marca == unaMarca
	})
	// Cantidad de marcas que comparte
	method CantidadDeMarcasQueComparteCon(otraPersona) { return
		jarras.count({
			marca => otraPersona.tiene(marca)
		})
	}
	// Cantidad de marcas que no Comparte
	method CantidadDeMarcasQueNoComparteCon(otraPersona) { return
		jarras.count({
			marca => !otraPersona.tiene(marca)
		})
	}
	
	// Se sirvio en una carpa dedterminada punto 15
	method seSirvioEn(unaCarpa) = jarras.any({
		jarra => jarra.carpa() == unaCarpa
	})
	
	// Punto 16 Saber, para una persona, si está entrando en el vicio. 
	// La condición es que cada jarra que compró tiene la misma capacidad, o más, que la anterior.
	method estaEntrandoAlVicio() { 
			//const numeroMax = self.jarras().size() - 1 
			return	(1..jarras.size() -1).all({
							indice => jarras.get(indice).litros() >= jarras.get(indice - 1).litros()
					})
	} 
	// MOD: Devuelvo la nacionalidad agregue metodo abstracto
	method nacionalidad()
	
	
}

class PersonaBelga inherits Persona {
	// Punto 4.
	 //override method marcasDeCervezasQueGustan() = jarras.filter({j=>j.marca().lupulos() > 4})	 
	 override method nacionalidad() = "Belgica" //Agragado
	 override method leGustasUna(marca)	= marca.lupulos() > 4 //Agregue esto
}

class PersonaCheca inherits Persona {	
	// Punto 4.MOD. puse la graduacion segun se modifico en la marca saco el metodo de abajo porque el enunciado dice marca no marcas
	//override method marcasDeCervezasQueGustan() = jarras.filter({j=>j.marca().graduacion() > 0.08})
	override method nacionalidad() = "Republica Checa" //Agragado
	override method leGustasUna(marca)	= marca.graduacion() > 0.08 //Agregue esto
}

class PersonaAlemana inherits Persona {
	
	// Punto 5. super() and cantidad par de personas en la carpa (antes de entrar ellos).
	override method quiereEntrarPersonaACarpa(unaCarpa) = super(unaCarpa) 
	and unaCarpa.personasAdentro().size() % 2 == 0 //MOD. Cambie esto	
	//unaCarpa.cantidadPersonasAdmitidas() % 2 == 0
	override method nacionalidad() = "Alemania"	//Agragado
	override method leGustasUna(marca)	= true //Agregue esto
}
