package ar.edu.unq.acahaygatoencerrado.dominio

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class AdministradorSistema {
	
	ArrayList<Laberinto> laberintos = new ArrayList<Laberinto>
	
	def crearLaberinto(String nombreLaberinto) {
		laberintos.add(new Laberinto(nombreLaberinto))	
	}
	
	def eliminarLaberinto(Laberinto laberinto) {
		laberintos.remove(laberinto)	
	}
	
	def agregarHabitacion(Laberinto laberinto, String nombreHabitacion) {
		laberinto.habitaciones.add(new Habitacion(nombreHabitacion))	
	}
	
	def eliminarHabitacion(Laberinto laberinto, Habitacion habitacion) {
		laberinto.habitaciones.remove(habitacion)
	}
	
	// si le paso una habitacion que es final termino cambiandola a final cuando no deberia
	def marcarHabitacionComoFinal(Habitacion habitacion) {
		if(!habitacion.esInicial) habitacion.esFinal = !habitacion.esFinal
	}

	// si le paso una habitacion que es inicial termino cambiandola a final cuando no deberia, el problema viene de usar dos o mas veces el mismo metodo en una habitacion, en ese caso no seria necesario el if
	def marcarHabitacionComoInicial(Habitacion habitacion) {
		if(!habitacion.esFinal) habitacion.esInicial = ! habitacion.esInicial
	}

	def habilitar(Laberinto laberinto) {
		laberinto.chequearInicioYFinal
	}
	
	def crearAccionDeIrAOtraHabitacion (Laberinto laberinto, Habitacion habitacionActual, Habitacion habitacionAlaQueMeDirijo) {	
		habitacionActual.acciones.add(new AccionDeIrHabitacion(habitacionAlaQueMeDirijo))
	}
	
	def crearAccionDeAgarrarUnElemento(Laberinto laberinto, Habitacion habitacion, String nombreItem) {
		habitacion.acciones.add(new AccionDeAgarrarUnItem(nombreItem))	
	}

	def crearAccionDeUsarItem(Laberinto laberinto, Habitacion habitacion, Item item, Accion accion) {
		habitacion.acciones.add(new AccionDeUsarUnItem(item, accion))
	}
	
	def eliminarAccion(Laberinto laberinto, Habitacion habitacion, Accion accion) {
		habitacion.acciones.remove(accion)
	}
}