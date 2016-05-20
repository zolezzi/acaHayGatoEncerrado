package ar.edu.unq.acahaygatoencerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import com.fasterxml.jackson.annotation.JsonIgnore

@Accessors
class AccionDeIrHabitacion extends Accion {
	
	@JsonIgnore
	Habitacion habitacion
	
 	new(Habitacion habitacion) {
		this.nombre = "Ir a " + habitacion.nombre
		this.habitacion = habitacion
	}
	
	override accionar(Jugador  jugador ) {
		jugador.cambiarHabitacion(this.getHabitacion())
	}
}