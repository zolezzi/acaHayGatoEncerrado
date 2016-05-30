package ar.edu.unq.acahaygatoencerrado.dominio

import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@Observable
@Accessors
class ServidorDeLaberintos {

	var List<CreadorDeLaberintos> administradores = new ArrayList<CreadorDeLaberintos>
	var List<Jugador> jugadores = new ArrayList<Jugador>

	def getLaberintos() {
 		var laberintos = new ArrayList<Laberinto>
 		for(administrador : administradores){
			laberintos.addAll(administrador.laberintos)
		}
		return laberintos
	}

	def registrar(CreadorDeLaberintos administrador){
		administradores.add(administrador)
	}
	
	def registrar(Jugador jugador){
		jugadores.add(jugador)
	}
	
	def habilitarLaberintosQueEstenEnCondicionesDeSerJugados() {
		for(laberinto : laberintos) {
			habilitarSiEstaEnCondicionesDeSerJugado(laberinto)
		}
	}

	def habilitarSiEstaEnCondicionesDeSerJugado(Laberinto laberinto) {
		val tieneHabitacionInicial = laberinto.habitacionInicial!=null
		val tieneHabitacionFinal = laberinto.habitacionFinal!=null
		val habitacionInicialYFinalNoSonLaMismaHabitacion =
				laberinto.habitacionInicial!=laberinto.habitacionFinal
		
		laberinto.disponibilidad = tieneHabitacionInicial && tieneHabitacionFinal
									&& habitacionInicialYFinalNoSonLaMismaHabitacion
	}
	
	def getLaberinto(Integer idLaberinto) {
		var Laberinto laberintoResultante
		for(laberinto:getLaberintos){
			if(laberinto.id == idLaberinto){
				laberintoResultante = laberinto
			}
		}
		return laberintoResultante
	}
	
	def getJugador(Integer idJugador) {
		var Jugador jugadorResultante
		for(jugador:getJugadores){
			if(jugador.id == idJugador){
				jugadorResultante = jugador
			}
		}
		return jugadorResultante
	}
}