package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class NuevaAccionDeUsarUnItemAppModel {
	
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	
	Item itemSeleccionadoParaUsar

	Habitacion habitacionALaCualIr
	Item itemAObtener
	
	String nombreItemNuevo
	
	new(AdministradorSistemaAppModel model) {
		laberintoSeleccionado = model.laberintoSeleccionado
		habitacionSeleccionada = model.habitacionSeleccionada
	}
	
	def agregarAccionDeUsarUnItemEIrAOtraHabitacionAHabitacionSeleccionada(){
		habitacionSeleccionada.crearAccionDeUsarUnItem(itemSeleccionadoParaUsar, habitacionALaCualIr)
	}
	
	def agregarAccionDeUsarUnItemYObtenerOtroItemAHabitacionSeleccionada(){
		itemAObtener = new Item => [ nombre = nombreItemNuevo ]
		habitacionSeleccionada.crearAccionDeUsarUnItem(itemSeleccionadoParaUsar, itemAObtener)
	}

	def getItemsAgarrables(){
		return laberintoSeleccionado.itemsAgarrables
	}
	
	def getHabitacionesALaCualIr(){
		laberintoSeleccionado.habitaciones
	}
}