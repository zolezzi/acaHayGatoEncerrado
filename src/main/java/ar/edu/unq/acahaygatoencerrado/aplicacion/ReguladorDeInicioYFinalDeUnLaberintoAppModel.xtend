package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion

class ReguladorDeInicioYFinalDeUnLaberintoAppModel {
	
	Laberinto laberintoSeleccionado
	Habitacion habitacionInicial
	Habitacion habitacionFinal
	
	new(AdministradorSistemaAppModel model) {
		
		laberintoSeleccionado = model.laberintoSeleccionado
	}
	
	def setHabitacionInicialAlLaberintoSeleccionado(){
		habitacionInicial = laberintoSeleccionado.habitacionInicial
	}
}