package ar.edu.unq.acahaygatoencerrado.dominio.test

import org.junit.Test
import org.junit.Before
import org.junit.Assert
import ar.edu.unq.acahaygatoencerrado.dominio.ServidorDeLaberintos
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion

class TestServidorDeLaberintos {

	ServidorDeLaberintos servidor
	Laberinto laberinto
	Laberinto laberintoCon3Habitaciones
	AdministradorSistema administrador
	AdministradorSistema administrador2
	Habitacion habitacion1
	Habitacion habitacion2
	Habitacion habitacion3

	@Before
	def void setUp(){

		servidor = new ServidorDeLaberintos
		administrador = new AdministradorSistema()
		administrador2 = new AdministradorSistema()
		laberinto = new Laberinto("Casa Tomada")
		laberintoCon3Habitaciones = new Laberinto("Residencia Mon")
		
		habitacion1 = new Habitacion("Cocina")
		habitacion2 = new Habitacion("Baño")
		habitacion3 = new Habitacion("Pieza")
			
		laberinto.agregarHabitacion(habitacion1)
		laberinto.agregarHabitacion(habitacion2)
		laberinto.agregarHabitacion(habitacion3)
		
		habitacion1 = new Habitacion("Fosa")
		habitacion2 = new Habitacion("Pieza")
		habitacion3 = new Habitacion("Patio")
		
		
		laberintoCon3Habitaciones.agregarHabitacion(habitacion1)
		laberintoCon3Habitaciones.agregarHabitacion(habitacion2)
		laberintoCon3Habitaciones.agregarHabitacion(habitacion3)
	}

	@Test
	def testServidorSinLaberintosDisponibles(){
		
		Assert.assertTrue(servidor.laberintosDisponibles.empty)
	}
}