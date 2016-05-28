package ar.edu.unq.acahaygatoencerrado.dominio

import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.Observable

@Observable
class ServidorDeLaberintos {

	List<CreadorDeLaberintos> administradores = new ArrayList<CreadorDeLaberintos>

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
}