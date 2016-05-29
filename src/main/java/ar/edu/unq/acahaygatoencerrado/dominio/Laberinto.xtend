package ar.edu.unq.acahaygatoencerrado.dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*

@Observable
@Accessors
class Laberinto extends Seleccionable{
	
	String descripcion
	Boolean disponibilidad
	public List<Habitacion> habitaciones
	public Habitacion habitacionInicial
	public Habitacion habitacionFinal
	
	new (){
		disponibilidad = false
		habitaciones = new ArrayList<Habitacion>
	}

	new (String nombre){
		if(esUnLaberintoValido(nombre)){
			this.nombre = nombre
			this.disponibilidad = false
		} else {
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
	
	def void inicializarPartida(Jugador jugador) {
		disponibilidad = false
		jugador.setHabitacionActual(this.getHabitacionInicial())	
	}

	def getItemsAgarrables() {
		
		var List<Item> todosLosItemsAgarrablesDeUnLaberinto = new ArrayList<Item>
		
		for(accion : this.todasMisAcciones){
			todosLosItemsAgarrablesDeUnLaberinto.addAll(accion.itemAgarrable())
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

	def eliminarHabitacion(Habitacion habitacion) {
		habitaciones.remove(habitacion)
	}
}