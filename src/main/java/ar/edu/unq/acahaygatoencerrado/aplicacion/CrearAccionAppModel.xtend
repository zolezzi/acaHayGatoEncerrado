package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import org.eclipse.xtend.lib.annotations.Accessors


@Accessors
class CrearAccionAppModel {
	
	Laberinto laberintoSeleccionado
	AdministradorSistema administrador
	Habitacion habitacionSeleccionada
	
	new(AdministradorSistemaAppModel model) {
		administrador = model.administrador
		laberintoSeleccionado = model.laberintoSeleccionado
		habitacionSeleccionada = model.habitacionSeleccionada
	}
}