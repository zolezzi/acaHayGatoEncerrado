package ar.edu.unq.acahaygatoencerrado.dominio

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*

@Observable
@Accessors
class AdministradorSistema {
	
	List<Laberinto> laberintos = new ArrayList<Laberinto>
	
	def crearLaberinto(String nombreLaberinto) {
		agregarLaberinto(new Laberinto(nombreLaberinto))	
	}
	
	def eliminarLaberinto(Laberinto laberinto) {
		laberintos.remove(laberinto)
		firePropertyChanged(this, "laberintos")	
	}
	
	def agregarHabitacion(Laberinto laberinto, Habitacion habitacion) {
		laberinto.agregarHabitacion(habitacion)		
	}
	
	def eliminarHabitacion(Laberinto laberinto, Habitacion habitacion) {
		laberinto.quitarHabitacion(habitacion)
	}

	def habilitar(Laberinto laberinto) {
		if(laberinto.chequearInicioYFinal){
			laberinto.habilitarme
		}
	}
	
	def deshabilitar(Laberinto laberinto) {
		laberinto.deshabilitarme
	}
	
	def crearAccionDeIrAOtraHabitacion (Laberinto laberinto, Habitacion habitacionActual, Habitacion habitacionAlaQueMeDirijo) {	
		habitacionActual.acciones.add(new AccionDeIrHabitacion(habitacionAlaQueMeDirijo))
	}
	
	def crearAccionDeAgarrarUnElemento(Laberinto laberinto, Habitacion habitacion, String nombreItem) {
		habitacion.acciones.add(new AccionDeAgarrarUnItem(nombreItem))
	}

	def crearAccionDeUsarItem(Laberinto laberinto, Habitacion habitacion, Item item, Item otroItem) {
		habitacion.acciones.add(new AccionDeUsarUnItem(item, otroItem))
	}
	
	def crearAccionDeUsarItem(Laberinto laberinto, Habitacion habitacion, Item item, Habitacion habitacionALaCualIr) {
		habitacion.acciones.add(new AccionDeUsarUnItem(item, habitacionALaCualIr))
	}
	
	def eliminarAccion(Laberinto laberinto, Habitacion habitacion, Accion accion) {
		habitacion.acciones.remove(accion)
	}
	
	def agregarLaberinto(Laberinto laberinto) {
		laberintos.add(laberinto)
		firePropertyChanged(this, "laberintos")
	}
}