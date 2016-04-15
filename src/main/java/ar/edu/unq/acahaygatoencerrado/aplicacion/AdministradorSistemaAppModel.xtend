package ar.edu.unq.acahaygatoencerrado.aplicacion

import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import ar.edu.unq.acahaygatoencerrado.dominio.Accion
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
//import static org.uqbar.commons.model.ObservableUtils.*

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
	
	new (){	}
	def agregar(String nombreLaberinto){
		administrador.crearLaberinto(nombreLaberinto)
	}
	
	def quitarLaberinto(){
		administrador.eliminarLaberinto(laberintoSeleccionado)
	}
	
	
	def getHabitacionesDelLaberintoSeleccionado(){
		return laberintoSeleccionado.habitaciones
	}


	def quitarHabitacion(){
		administrador.eliminarHabitacion(laberintoSeleccionado, habitacionSeleccionada)
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
		//accionesDeLaHabitacionSeleccionada = getAccionesDeHabitacionSeleccionada
	}
	
	def agregarAccionDeAgarrarUnElemntoAHabitacionSeleccionada(String nombreItem){
		administrador.crearAccionDeAgarrarUnElemento(laberintoSeleccionado, habitacionSeleccionada, nombreItem)
		//accionesDeLaHabitacionSeleccionada = getAccionesDeHabitacionSeleccionada		
	}
	
	def agregarAccionDeUsarUnItemALaHabitacionSeleccionada(){
		administrador.crearAccionDeUsarItem(laberintoSeleccionado, habitacionSeleccionada, 
											itemSeleccionadoParaAgregarAccion, 
											accionSeleccionadaParaAgregarAccion)
		//accionesDeLaHabitacionSeleccionada = getAccionesDeHabitacionSeleccionada	
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

	def getHabitacionesALaCualIr(){
		laberintoSeleccionado.habitaciones
	}
}