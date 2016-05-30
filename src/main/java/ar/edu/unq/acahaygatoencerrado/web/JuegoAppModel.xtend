package ar.edu.unq.acahaygatoencerrado.web

import ar.edu.unq.acahaygatoencerrado.dominio.ServidorDeLaberintos
import ar.edu.unq.acahaygatoencerrado.dummyData.DummyData
import ar.edu.unq.acahaygatoencerrado.dominio.Jugador
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto

class JuegoAppModel {
	
	ServidorDeLaberintos servidor

	new(DummyData dummyData){

		servidor = dummyData.getServidor
		servidor.registrar(dummyData.getCreadorDeLaberintosConNostromoCarcelYUNQUI)
		servidor.habilitarLaberintosQueEstenEnCondicionesDeSerJugados
		servidor.registrar(dummyData.getJugadorPepeDefault)
	}
	
	def getLaberintos(){
		servidor.getLaberintos
	}
	
	def jugarLaberinto(Integer idLaberinto) {
		servidor.getJugador().jugarLaberinto(servidor.getLaberinto(idLaberinto))
	}

	def hacerAccion(Integer idAccion) {
		servidor.getJugador().hacerAccion(idAccion)
	}
	
	def getLaberinto(Integer idLaberinto){
		servidor.getLaberinto(idLaberinto)
	}
	
	def getJugador(){
		servidor.getJugador()
	}
	
	def jugadorGanoElLaberinto(Integer idLaberinto) {
		var Jugador jugador = servidor.getJugador()
		var Laberinto laberinto = servidor.getLaberinto(idLaberinto)
		val boolean cond = jugador.habitacionActual == laberinto.habitacionFinal
		laberinto.disponibilidad = cond
		return cond
	}
}