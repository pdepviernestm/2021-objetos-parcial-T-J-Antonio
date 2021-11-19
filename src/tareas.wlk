class Tarea {
	method horasNecesarias(actor)
	
	method aplicar(actor) {
		if (not actor.puedeHacer(self))
			self.error("No hay suficientes horas disponibles")
	}
}

class IrAUnDestino inherits Tarea {
	const destino
	
	override method horasNecesarias(actor) = actor.horasHasta(destino)
	
	override method aplicar(actor) {
		super(actor)
		actor.moverse(destino)
	}
}

object irAlMasCercano inherits Tarea {
	override method horasNecesarias(actor) = actor.horasHasta(actor.masCercano())
	
	override method aplicar(actor) {
		super(actor)
		actor.moverse(actor.masCercano())
	}
}

class UsarInstrumento inherits Tarea {
	const instrumento
	const receptor
	
	override method horasNecesarias(actor) = instrumento.horasNecesarias(actor)
	
	override method aplicar(actor) {
		super(actor)
		if (actor.lugarActual() != receptor.lugarActual()) {
			self.error("El receptor está en otro lado")
		}
		actor.restarHoras(instrumento.horasNecesarias(actor))
		instrumento.hacerEfecto(receptor)
	}
}

class Itinerario {
	const listaTareas = new List()
	const encargados = new Set()
	
	method hacerItinerario() = encargados.forEach{ habitante => habitante.realizarLista(listaTareas) }
	
	method elMasEficaz() = encargados.max{ habitante => habitante.tareasHechas() }
}