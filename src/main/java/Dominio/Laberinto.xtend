package Dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Laberinto {
	
	public List<Habitacion> habitaciones = new ArrayList<Habitacion>
	String nombre
	Boolean disponibilidad
	Jugador jugadorActual
	
	new (String nombre){
		this.nombre = nombre
		this.disponibilidad = false
	}
	
	def estaDisponible() {
		this.disponibilidad
	}
	
	def inicializarPartida(Jugador jugador) {
		jugadorActual = jugador
		disponibilidad = false
		jugadorActual.setHabitacionInicial(this.getHabitacionInicial())	
	}
	
	def getHabitacionInicial(){
		var Habitacion habitacionInicial
		for(habitacion  : habitaciones){
			if(habitacion.esInicial){
				habitacionInicial = habitacion
			}
		}
		return habitacionInicial
	}
	
	def chequearInicioYFinal() {
		var condInicio = false
		var condFinal = false
		
		condInicio = condInicio || this.chequearInicio
		condFinal = condFinal || this.chequearFinal
		
		this.disponibilidad = condInicio && condFinal
	}
	
	def chequearFinal() {
		var count = 0
		for(habitacion : habitaciones){
			if(habitacion.esFinal){
				count++
			}
		}
		return count == 1
	}
	
	def chequearInicio() {
		var count = 0
		for(habitacion : habitaciones){
			if(habitacion.esInicial){
				count++
			}
		}
		return count == 1
	}
}
