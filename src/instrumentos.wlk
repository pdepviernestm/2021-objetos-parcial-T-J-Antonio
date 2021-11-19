class Instrumento {
	method horasNecesarias(actor)
	
	method hacerEfecto(receptor)
}

object kairosecto inherits Instrumento {
	override method horasNecesarias(actor) = 1
	
	override method hacerEfecto(receptor) {
		receptor.detenerTiempo()
	}
}

class BaculoDeSombras inherits Instrumento {
	const destino
	
	override method horasNecesarias(actor) = (actor.horasDisponibles() / 2).roundUp()
	
	override method hacerEfecto(receptor) {
		receptor.teletransportar(destino)
	}
}