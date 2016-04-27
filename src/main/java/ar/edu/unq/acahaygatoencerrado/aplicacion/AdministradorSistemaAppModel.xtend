package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import ar.edu.unq.acahaygatoencerrado.dominio.Accion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List

@Observable
@Accessors
class AdministradorSistemaAppModel {
	
	AdministradorSistema administrador
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	Accion accionSeleccionada
	
	Habitacion habitacionParaAgregarAccion
	
	
	Item itemSeleccionadoParaAgregarAccion
	String nombreItem
	
	Accion accionSeleccionadaParaAgregarAccion
	
	val caracteristicasPosibles = #["es Neutral", "es Inicial", "es Final"]

	new (){	}
	
	def agregarLaberinto(){
		administrador.agregarLaberinto(laberintoSeleccionado)
	}
	
	def quitarLaberinto(){
		administrador.eliminarLaberinto(laberintoSeleccionado)
	}
	
	
	def getHabitacionesDelLaberintoSeleccionado(){
		laberintoSeleccionado.habitaciones
	}

	def agregarHabitacion(){
		laberintoSeleccionado.agregarHabitacion(habitacionSeleccionada)
	}

	def quitarHabitacion(){
		laberintoSeleccionado.eliminarHabitacion(habitacionSeleccionada)
	}
	
	
	def getEsHabitacionInicial(){
		return habitacionSeleccionada.esInicial
	}
	
	def getEsHabitacionFinal(){
		return habitacionSeleccionada.esFinal
	}
	
	def getAccionesDeHabitacionSeleccionada(){
		return habitacionSeleccionada.acciones
	}
	
	def agregarAccionDeIrAHabitacionALaHabitacionSeleccionada(){
		habitacionSeleccionada.crearAccionDeIrAOtraHabitacion(habitacionParaAgregarAccion)
	}
	
	def agregarAccionDeAgarrarUnElementoAHabitacionSeleccionada(){
		habitacionSeleccionada.crearAccionDeAgarrarUnElemento(nombreItem)
	}
	
	def quitarAccion(){
		habitacionSeleccionada.eliminarAccion(accionSeleccionada)
	}

	def getHabitacionesALaCualIr(){
		laberintoSeleccionado.habitaciones
	}
	
	def agregarAccionDeObtenerOtroItem() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def agregarAccionDeIrAOtraHabitacion() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}