package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class NuevaAccionDeIrHabitacionAppModel {
	
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	Habitacion habitacionALaCualIr
	
	new(AdministradorSistemaAppModel model) {
		laberintoSeleccionado = model.laberintoSeleccionado
		habitacionSeleccionada = model.habitacionSeleccionada
	}

	def getHabitacionesALaCualIr(){
		laberintoSeleccionado.habitaciones
	}

	def agregarAccionDeIrAHabitacionALaHabitacionSeleccionada(){
		habitacionSeleccionada.crearAccionDeIrAOtraHabitacion(habitacionALaCualIr)
	}
}