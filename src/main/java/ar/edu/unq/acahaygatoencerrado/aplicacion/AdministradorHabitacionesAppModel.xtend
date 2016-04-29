package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion

@Observable
@Accessors
class AdministradorHabitacionesAppModel {
	
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	String nombreHabitacion
	
	new(AdministradorSistemaAppModel model) {
		
		laberintoSeleccionado = model.laberintoSeleccionado
		habitacionSeleccionada = model.habitacionSeleccionada
	}

	def agregarHabitacion(){
		habitacionSeleccionada = new Habitacion => [
			nombre = nombreHabitacion
		]
		laberintoSeleccionado.agregarHabitacion(habitacionSeleccionada)
	}
}