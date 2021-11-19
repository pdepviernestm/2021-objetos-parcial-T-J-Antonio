import lugares.*

class Habitante {
	var lugarActual
	const property velocidadCiudad
	const property velocidadCampo
	var horasDisponibles
	var tareasHechas = 0
	
	method lugarActual() = lugarActual
	
	method horasDisponibles() = horasDisponibles
	
	method tareasHechas() = tareasHechas
	
	method horasHasta(destino) = lugarActual.viaje(destino, self)
	
	method masCercano() = self.destinosPosibles().min{ destino => self.horasHasta(destino) }
	
	method destinosPosibles() = lugares.filter{ lugar => lugarActual.seConectaA(lugar) }

	method moverse(destino) {
		self.restarHoras(self.horasHasta(destino))
		lugarActual = destino
	}
	
	method puedeHacer(tarea) = tarea.horasNecesarias(self) <= horasDisponibles
	
	method realizar(tarea) = tarea.aplicar(self)
	
	method detenerTiempo() {
		horasDisponibles += 3
	}
	
	method teletransportar(destino) {
		lugarActual = destino
	}
	
	method restarHoras(horas) {
		horasDisponibles -= horas
	}
	
	method realizarLista(tareas) {
		tareas.forEach{ tarea => 
			try {
				self.realizar(tarea)
				tareasHechas++
			}
			catch e {}
		}
	}
}

const jim = new Habitante(
	lugarActual = casaJim,
	velocidadCiudad = 90,
	velocidadCampo = 9,
	horasDisponibles = 7
)

const clara = new Habitante(
	lugarActual = casaClara,
	velocidadCiudad = 10,
	velocidadCampo = 10,
	horasDisponibles = 5
)

const aja = new Habitante(
	lugarActual = museo,
	velocidadCiudad = 12,
	velocidadCampo = 12,
	horasDisponibles = 7
)