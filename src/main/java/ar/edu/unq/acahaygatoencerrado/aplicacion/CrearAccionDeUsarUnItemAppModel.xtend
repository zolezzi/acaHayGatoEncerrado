package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class CrearAccionDeUsarUnItemAppModel {
	
	AdministradorSistema administrador
	Laberinto laberinto
	Habitacion habitacion
	Item itemRequeridoParaUsar
	List<Item> itemsAgarrables
	List<Habitacion> habitacionesALasCualesIr
	
	Item itemAObtener
	Habitacion habitacionALaCualIr
	
	new (CrearAccionAppModel model) {

		administrador = model.administrador
		laberinto = model.laberintoSeleccionado
		habitacion = model.habitacionSeleccionada
		itemsAgarrables = laberinto.getItemsAgarrables
		habitacionesALasCualesIr = laberinto.getHabitaciones
		itemAObtener = new Item
	}

	def agregarAccionDeObtenerOtroItem() {
		administrador.crearAccionDeUsarItem(laberinto,habitacion,itemRequeridoParaUsar,itemAObtener)
	}
	
	def agregarAccionDeIrAOtraHabitacion() {
		administrador.crearAccionDeUsarItem(laberinto,habitacion,itemRequeridoParaUsar,habitacionALaCualIr)
	}
}