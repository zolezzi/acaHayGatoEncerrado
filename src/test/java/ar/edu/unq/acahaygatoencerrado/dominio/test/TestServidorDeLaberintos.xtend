package ar.edu.unq.acahaygatoencerrado.dominio.test

import org.junit.Test
import org.junit.Before
import org.junit.Assert
import ar.edu.unq.acahaygatoencerrado.dominio.ServidorDeLaberintos
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema

class TestServidorDeLaberintos {

	ServidorDeLaberintos servidor
	Laberinto laberinto
	Laberinto laberintoCon3Habitaciones
	AdministradorSistema administrador
	AdministradorSistema administrador2

	@Before
	def void setUp(){

		servidor = new ServidorDeLaberintos
		administrador = new AdministradorSistema()
		administrador2 = new AdministradorSistema()
		laberinto = new Laberinto("Casa Tomada")
		laberintoCon3Habitaciones = new Laberinto("Residencia Mon")
	
		administrador.agregarHabitacion(laberinto,"Cocina")
		administrador.agregarHabitacion(laberinto, "Baño")
		administrador.agregarHabitacion(laberinto, "Pieza")
		
		
		administrador2.agregarHabitacion(laberintoCon3Habitaciones, "Fosa")
		administrador2.agregarHabitacion(laberintoCon3Habitaciones, "Pieza")
		administrador2.agregarHabitacion(laberintoCon3Habitaciones, "Patio")
	
	}

	@Test
	def testServidorSinLaberintosDisponibles(){
		
		Assert.assertTrue(servidor.laberintosDisponibles.empty)
	}
}
