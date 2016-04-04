package ar.edu.unq.acahaygatoencerrado.dominio

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AdministradorSistema {
	
	List<Laberinto> laberintos = new ArrayList<Laberinto>
	
	def crearLaberinto (String nombreLaberinto){
		
		var laberinto = new Laberinto(nombreLaberinto)
		laberintos.add(laberinto)	
	}
	
	def eliminarLaberinto(Laberinto laberinto){
		
		laberintos.remove(laberinto)	
	}
	
	def agregarHabitacion(Laberinto laberinto, String nombreHabitacion){
		
		var habitacion = new Habitacion(nombreHabitacion)
		laberinto.habitaciones.add(habitacion)	
	}
	
	def eliminarHabitacion (Laberinto laberinto, Habitacion habitacion){
		laberinto.habitaciones.remove(habitacion)
	}
	
	def marcarHabitacionComoFinal(Habitacion habitacion){
		if(!habitacion.esInicial){
			habitacion.esFinal = !habitacion.esFinal
		}
	}

	def marcarHabitacionComoInicial(Habitacion habitacion){
		if(!habitacion.esFinal){
			habitacion.esInicial = !habitacion.esInicial
		}
	}

	def habilitar(Laberinto laberinto){
		laberinto.chequearInicioYFinal
	}
	
	def crearAccionDeIrAOtraHabitacion (Laberinto laberinto, Habitacion habitacionActual,
		Habitacion habitacionAlaQueMeDirijo) {
	
		var accionDeIrAOtraHabitacion = new AccionDeIrHabitacion(habitacionAlaQueMeDirijo)
		habitacionActual.acciones.add(accionDeIrAOtraHabitacion)
	}
	
	def crearAccionDeAgarrarUnElemento (Laberinto laberinto,Habitacion habitacion, String nombreItem){
		
		var accionAgarrarItem = new AccionDeAgarrarUnItem(nombreItem)
		habitacion.acciones.add(accionAgarrarItem)	
	}

	def crearAccionDeUsarItem(Laberinto laberinto, Habitacion habitacion,Item item, Accion accion){
		
		var accionUsarItem = new AccionDeUsarUnItem(item, accion)
		habitacion.acciones.add(accionUsarItem)
	}
}
