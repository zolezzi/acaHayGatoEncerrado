package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import ar.edu.unq.acahaygatoencerrado.dominio.Accion

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
}