package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class NuevaAccionDeAgarrarUnItemAppModel {
	
	Habitacion habitacionSeleccionada
	String nombreItem
	
	new(AdministradorSistemaAppModel model) {
		habitacionSeleccionada = model.habitacionSeleccionada
	}
	
	def agregarAccionDeAgarrarUnElementoAHabitacionSeleccionada(){
		habitacionSeleccionada.crearAccionDeAgarrarUnElemento(nombreItem)
	}
}