package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import ar.edu.unq.acahaygatoencerrado.dominio.Accion
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class AdministradorSistemaAppModel {
	
	AdministradorSistema administrador
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	Habitacion habitacionParaAgregarAccion
	Item itemSeleccionadoParaAgregarAccion
	Accion accionSeleccionadaParaAgregarAccion
	Accion accionSeleccionada
	
	def getLaberintos(){
		return administrador.laberintos
	}
	
	def agregar(String nombreLaberinto){
		administrador.crearLaberinto(nombreLaberinto)
	}
	
	def quitarLaberinto(){
		administrador.eliminarLaberinto(laberintoSeleccionado)
	}
	
	def setLaberintoSeleccionado(Laberinto laberinto){
		laberintoSeleccionado = laberinto
	}
	
	def getHabitacionesDelLaberintoSeleccionado(){
		return laberintoSeleccionado.habitaciones
	}
	
	def agregarHabitacion(String nombreHabitacion){
		administrador.agregarHabitacion(laberintoSeleccionado, nombreHabitacion)
	}
	
	def quitarHabitacion(){
		administrador.eliminarHabitacion(laberintoSeleccionado, habitacionSeleccionada)		
	}
	
	def setHabitacionSeleccionada(Habitacion habitacion){
		habitacionSeleccionada = habitacion
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
		administrador.crearAccionDeIrAOtraHabitacion(laberintoSeleccionado, habitacionSeleccionada, 
													 habitacionParaAgregarAccion)		
	}
	
	def agregarAccionDeAgarrarUnElemntoAHabitacionSeleccionada(String nombreItem){
		administrador.crearAccionDeAgarrarUnElemento(laberintoSeleccionado, habitacionSeleccionada, nombreItem)		
	}
	
	def agregarAccionDeUsarUnItemALaHabitacionSeleccionada(){
		administrador.crearAccionDeUsarItem(laberintoSeleccionado, habitacionSeleccionada, 
											itemSeleccionadoParaAgregarAccion, 
											accionSeleccionadaParaAgregarAccion)	
	}
	def marcarHabitacionComoInicial(){
		administrador.marcarHabitacionComoInicial(habitacionSeleccionada)
	}
	
	def marcarHabitacionComoFinal(){
		administrador.marcarHabitacionComoFinal(habitacionSeleccionada)
	}
	
	def quitarAccion(){
		administrador.eliminarAccion(laberintoSeleccionado,habitacionSeleccionada,accionSeleccionada)
	}
	
	def setAccionSeleccionada(Accion accion){
		accionSeleccionada = accion
	}
	
	def getHabitacionesALaCualIr(){
		laberintoSeleccionado.habitaciones
	}
	
	def getItemsQuePuedenSerUsados(){

		var todasLasHabitacionesDeUnLaberinto = laberintoSeleccionado.habitaciones
		
		todosLosItemsAgarrablesDeUnLaberinto
			(todasLasAccionesDelLaberintoSeleccionado(todasLasHabitacionesDeUnLaberinto)
			)
	}
	
	private def todosLosItemsAgarrablesDeUnLaberinto(List<Accion> acciones){
		
		var List<Item> todosLosItemsAgarrablesDeUnLaberinto
		
		for(accion : acciones){
			todosLosItemsAgarrablesDeUnLaberinto.add(accion.itemAgarrable())
		}
		todosLosItemsAgarrablesDeUnLaberinto
	}
	
	private def todasLasAccionesDelLaberintoSeleccionado(List<Habitacion> habitaciones){
		
		var List<Accion> todasLasAccionesDeUnLaberinto
		
		for(habitacion : habitaciones){
			todasLasAccionesDeUnLaberinto.addAll(habitacion.acciones)
		}
		todasLasAccionesDeUnLaberinto
	}
}