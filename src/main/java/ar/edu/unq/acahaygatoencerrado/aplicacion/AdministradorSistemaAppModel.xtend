package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema

class AdministradorSistemaAppModel {
	AdministradorSistema administrador
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	
	def getLaberintos(){
		return administrador.laberintos
	}
	
	def agregar(String nombreLaberinto){
		administrador.crearLaberinto(nombreLaberinto)
	}
	
	def quitarLaberinto(){
		administrador.eliminarLaberinto(this.laberintoSeleccionado)
	}
	
	def setLaberintoSeleccionado(Laberinto laberinto){
		this.laberintoSeleccionado = laberinto
	}
	
	def getHabitacionesDelLaberintoSeleccionado(){
		return laberintoSeleccionado.habitaciones
	}
	
	def agregarHabitacion(String nombreHabitacion){
		administrador.agregarHabitacion(this.laberintoSeleccionado, nombreHabitacion)
	}
	
	def quitarHabitacion(){
		administrador.eliminarHabitacion(this.laberintoSeleccionado, this.habitacionSeleccionada)		
	}
	
	def setHabitacionSeleccionada(Habitacion habitacion){
		this.habitacionSeleccionada = habitacion
	}
	
	def getEsHabitacionInicial(){
		return this.habitacionSeleccionada.esInicial
	}
	
	def getEsHabitacionFinal(){
		return this.habitacionSeleccionada.esFinal
	}
	
	def getAccioneesDeHabitacionSeleccionada(){
		return this.habitacionSeleccionada.acciones
	}
	
}