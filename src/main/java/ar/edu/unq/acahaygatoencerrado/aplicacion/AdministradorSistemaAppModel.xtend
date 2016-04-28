package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import ar.edu.unq.acahaygatoencerrado.dominio.Accion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class AdministradorSistemaAppModel {
	
	AdministradorSistema administrador
	Laberinto laberintoSeleccionado
	String nombreLaberinto
	
	Habitacion habitacionSeleccionada
	String nombreHabitacion
	
	Habitacion habitacionALaCualIr
	
	Accion accionSeleccionada
	
	Habitacion habitacionParaAgregarAccion

	Item itemSeleccionadoParaUsar
	String nombreItem
	Item itemAObtener
	String nombreItemNuevo
	
	Accion accionSeleccionadaParaAgregarAccion
	
	val caracteristicasPosibles = #["es Neutral", "es Inicial", "es Final"]

	new (){	}
	
	def agregarLaberinto(){
		laberintoSeleccionado = new Laberinto => [
			nombre = nombreLaberinto
		]
		administrador.agregarLaberinto(laberintoSeleccionado)
	}
	
	def quitarLaberinto(){
		administrador.eliminarLaberinto(laberintoSeleccionado)
	}
	
	
	def getHabitacionesDelLaberintoSeleccionado(){
		laberintoSeleccionado.habitaciones
	}

	def agregarHabitacion(){
		habitacionSeleccionada = new Habitacion => [
			nombre = nombreHabitacion
		]
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
		habitacionSeleccionada.crearAccionDeIrAOtraHabitacion(habitacionALaCualIr)
	}
	
	def agregarAccionDeAgarrarUnElementoAHabitacionSeleccionada(){
		habitacionSeleccionada.crearAccionDeAgarrarUnElemento(nombreItem)
	}
	
	def agregarAccionDeUsarUnItemEIrAOtraHabitacionAHabitacionSeleccionada(){
		habitacionSeleccionada.crearAccionDeUsarUnItem(itemSeleccionadoParaUsar, habitacionALaCualIr)
	}
	
	def agregarAccionDeUsarUnItemYObtenerOtroItemAHabitacionSeleccionada(){
		itemAObtener = new Item => [ nombre = nombreItemNuevo ]
		habitacionSeleccionada.crearAccionDeUsarUnItem(itemSeleccionadoParaUsar, itemAObtener)
	}
	
	def quitarAccion(){
		habitacionSeleccionada.eliminarAccion(accionSeleccionada)
	}

	def getHabitacionesALaCualIr(){
		laberintoSeleccionado.habitaciones
	}
	
	def getItemsAgarrables(){
		return laberintoSeleccionado.itemsAgarrables
	}
}