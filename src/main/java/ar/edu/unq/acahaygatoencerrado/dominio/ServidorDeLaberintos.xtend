package ar.edu.unq.acahaygatoencerrado.dominio

import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class ServidorDeLaberintos {

	var List<CreadorDeLaberintos> administradores = new ArrayList<CreadorDeLaberintos>

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
		var Laberinto laberintoQueSeEstaJugando
		for(laberinto:getLaberintos){
			if(laberinto.id == idLaberinto){
				laberintoQueSeEstaJugando = laberinto
			}
		}
		return laberintoQueSeEstaJugando
	}
}