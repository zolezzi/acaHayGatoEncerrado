package ar.edu.unq.acahaygatoencerrado.aplicacion

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion

@Accessors

class CrearAccionDeAgarrarUnItemAppModel {
	
	Laberinto laberintoSeleccionado
	AdministradorSistema administrador
	Habitacion habitacionSeleccionada
	String nombreItem
	

	new(CrearAccionAppModel model) {
		administrador = model.administrador
		laberintoSeleccionado = model.laberintoSeleccionado
		habitacionSeleccionada = model.habitacionSeleccionada
	}
	
}