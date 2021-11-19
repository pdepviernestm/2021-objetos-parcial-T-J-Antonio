import lugares.*

class Sendero {
	const property origen
	const property destino
	const distancia
}

class SenderoUrbano inherits Sendero {
	const trafico
	
	method tiempoADestino(habitante) = (distancia / habitante.velocidadCiudad() * trafico).roundUp()
}

class SenderoRural inherits Sendero {
	method tiempoADestino(habitante) = (distancia / habitante.velocidadCampo()).roundUp()
}

const sendero1 = new SenderoUrbano(
	origen = casaJim,
	destino = casaClara,
	distancia = 5,
	trafico = 1
)

const sendero2 = new SenderoUrbano(
	origen = casaClara,
	destino = casaJim,
	distancia = 5,
	trafico = 1
)

const sendero3 = new SenderoRural(
	origen = casaJim,
	destino = mercado,
	distancia = 35
)

const sendero4 = new SenderoUrbano(
	origen = casaClara,
	destino = mercado,
	distancia = 15,
	trafico = 4
)

const sendero5 = new SenderoRural(
	origen = mercado,
	destino = casaClara,
	distancia = 15
)

const sendero6 = new SenderoUrbano(
	origen = mercado,
	destino = museo,
	distancia = 15,
	trafico = 2
)

const sendero7 = new SenderoRural(
	origen = museo,
	destino = casaJim,
	distancia = 40
)

const senderos = #{sendero1, sendero2, sendero3, sendero4, sendero5, sendero6, sendero7}