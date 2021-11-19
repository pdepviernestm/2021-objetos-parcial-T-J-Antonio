import habitantes.*
import senderos.*

class Lugar {
	method seConectaA(unLugar) = senderos.any{ sendero => sendero.origen() == self and sendero.destino() == unLugar }

	method encontrarConexion(unLugar) {
		if (not self.seConectaA(unLugar)) {
			self.error("No hay conexiones a ese lugar")
		}
		return senderos.find{ sendero => sendero.origen() == self and sendero.destino() == unLugar }
	}
	
	method viaje(destino, habitante) {
		const senderoAUsar = self.encontrarConexion(destino)
		return senderoAUsar.tiempoADestino(habitante)
	}
}

// No se definen propiedades de los lugares puesto que se definen en los senderos
const casaJim = new Lugar()
const casaClara = new Lugar()
const mercado = new Lugar()
const museo = new Lugar()

const lugares = #{casaJim, casaClara, mercado, museo}

