import marcas.*

class CarpaCervecera{
	const property cantidadPersonasAdmitidas
	var property personasAdentro = []
	var property tienenBandaTradicional = false
	const property jarras = [] 
	const property marca
	
	// Agrega una jarra a la lista jarras.
	method agregarJarra(unaMarca) = jarras.add(unaMarca)
	
	// Punto 6. Devuelve boolean. True si la persona al entrar no supera límite y si no está ebria. False en caso contrario.
	method puedeIngresarPersonaACarpa(unaPersona) = personasAdentro.size() < cantidadPersonasAdmitidas 
	and	not unaPersona.estaEbria()
	
	// Punto 8. Agrega una persona a la lista de personas adentro de la carpa si cumple condiciones.
	// En caso contrario, si no cumple condiciones, tira un error.
	method agregarPersonaACarpa(unaPersona) {
		if (self.puedeIngresarPersonaACarpa(unaPersona))  personasAdentro.add(unaPersona)
		else self.error("No puede ingresar a la carpa")
		}
	
	// Punto 9. Sirve una jarra a una persona, siempre y cuando esté en la carpa.
	// En caso contrario, si no está, tira un error.
	// Crear jarra en la acción, con la marca de la carpa y la capacidad en litros.//MOD creo la jarra en metodo
	method servirJarraAPersona(unaPersona, capacidad) {
		if (personasAdentro.contains(unaPersona)) unaPersona.jarras().add(new Jarra(marca=self.marca(), litros=capacidad, carpa=self))
		else self.error("La persona no está en la carpa")
	}
	
	// Punto 10. Devuelve la cantidad de ebrios que tienen todas jarras de 1 litro ó más.
	method cantidadEbriosEmpedernidos() = personasAdentro.count({ p => p.estaEbria() and 
		p.sonTodasJarrasDe1LitroOMas() })
		
	//  Punto 10. Saber si una carpa es homogénea: la condición es que todas las personas que están son de la misma nacionalidad.
	method esHomogenea() = personasAdentro.all({
		persona => personasAdentro.first().nacionalidad() == persona.nacionalidad()
	})
	
	// Punto 15. Con el dato agregado en el punto anterior, obtener para una carpa los asistentes que a los que no se les ha 
	//servido cerveza en esa carpa (aunque posiblemente sí en otras).
	method asistentesQueNoSeLesSirvio(){ return
		personasAdentro.filter({
			persona => !persona.seSirvioEn(self)
		})
	}
	
}

	
