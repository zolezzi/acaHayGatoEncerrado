package ar.edu.unq.acahaygatoencerrado.dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*

@Observable
@Accessors
class Laberinto {
	
	public List<Habitacion> habitaciones = new ArrayList<Habitacion>
	String nombre
	Boolean disponibilidad
	Jugador jugadorActual
	
	new (){
		this.disponibilidad = false
	}
	
	
	new (String nombre){
		if(esUnLaberintoValido(nombre)){
			this.nombre = nombre
			this.disponibilidad = false
		} else{
			throw new Exception("Nombre de Laberinto invalido")
		  }
}

	def agregarHabitacion(Habitacion habitacion){
		habitaciones.add(habitacion)
		firePropertyChanged(this, "habitaciones")
	}
	
	def quitarHabitacion(Habitacion habitacion) {
		habitaciones.remove(habitacion)
		firePropertyChanged(this, "habitaciones")
	}
	
	def esUnLaberintoValido(String nombreLaberinto) {
		!nombreLaberinto.empty && !nombreLaberinto.toCharArray.get(0).equals(" ")
	}
	
	def estaDisponible() {
		return this.disponibilidad
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
	
	def getItemsAgarrables() {
		
		var List<Item> todosLosItemsAgarrablesDeUnLaberinto = new ArrayList<Item>
		
		for(accion : this.todasMisAcciones){
			todosLosItemsAgarrablesDeUnLaberinto.add(accion.itemAgarrable())
		}
		todosLosItemsAgarrablesDeUnLaberinto
	}
	
	private def todasMisAcciones(){
		
		var List<Accion> todasLasAccionesDeUnLaberinto = new ArrayList<Accion>
		
		for(habitacion : habitaciones){
			todasLasAccionesDeUnLaberinto.addAll(habitacion.acciones)
		}
		todasLasAccionesDeUnLaberinto
	}
	
	def habilitarme() {
		nombre.concat(" - Habilitado")
		firePropertyChanged(this, "nombre")
	}
	
	def deshabilitarme() {
		nombre.replace(" - Habilitado", "")
		firePropertyChanged(this, "nombre")
	}
}