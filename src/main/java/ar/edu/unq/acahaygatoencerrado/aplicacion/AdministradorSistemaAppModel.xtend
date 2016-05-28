package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.Accion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.acahaygatoencerrado.dominio.CreadorDeLaberintos

@Observable
@Accessors
class AdministradorSistemaAppModel {
	
	CreadorDeLaberintos administrador
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	Accion accionSeleccionada

	def quitarLaberinto(){
		administrador.eliminarLaberinto(laberintoSeleccionado)
	}

	def quitarHabitacion(){
		laberintoSeleccionado.eliminarHabitacion(habitacionSeleccionada)
	}

	def quitarAccion(){
		habitacionSeleccionada.eliminarAccion(accionSeleccionada)
	}
}