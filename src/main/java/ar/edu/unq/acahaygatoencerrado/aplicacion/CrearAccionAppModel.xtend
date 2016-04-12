package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Accion

class CrearAccionAppModel {
	
	Laberinto laberintoSeleccionado
	AdministradorSistema administrador
	Habitacion habitacionSeleccionada
	String nombreAccion
	Accion accion
	
	new(AdministradorSistemaAppModel model) {
		administrador = model.administrador
		laberintoSeleccionado = model.laberintoSeleccionado
		habitacionSeleccionada = model.habitacionSeleccionada
	}
	
}