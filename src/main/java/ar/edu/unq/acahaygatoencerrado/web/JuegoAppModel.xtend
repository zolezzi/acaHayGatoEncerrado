package ar.edu.unq.acahaygatoencerrado.web

import ar.edu.unq.acahaygatoencerrado.dominio.ServidorDeLaberintos
import ar.edu.unq.acahaygatoencerrado.dummyData.DummyData

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
	
	def jugarLaberinto(Integer idLaberinto,Integer idJugador) {
		servidor.getJugador(idJugador).jugarLaberinto(servidor.getLaberinto(idLaberinto))
	}

	def hacerAccion(Integer idAccion, Integer idJugador) {
		servidor.getJugador(idJugador).hacerAccion(idAccion)
	}
	
	def getLaberinto(Integer idLaberinto){
		servidor.getLaberinto(idLaberinto)
	}
	
	def getJugador(Integer idJugador){
		servidor.getJugador(idJugador)
	}
}