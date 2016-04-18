package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List

@Observable
@Accessors
class CrearAccionDeIrHabitacionAppModel {
	
	Laberinto laberintoSeleccionado
	AdministradorSistema administrador
	Habitacion habitacionSeleccionada
	Habitacion habitacionALaCualIr
	List<Habitacion> habitacionesLaberintoSeleccionado
	
	new(CrearAccionAppModel model) {
		
		administrador = model.administrador
		laberintoSeleccionado = model.laberintoSeleccionado
		habitacionSeleccionada = model.habitacionSeleccionada	
		habitacionesLaberintoSeleccionado = model.laberintoSeleccionado.habitaciones
	}
	
	def agregarHabitacion (){
		administrador.crearAccionDeIrAOtraHabitacion(laberintoSeleccionado, habitacionSeleccionada, habitacionALaCualIr)
	}
}