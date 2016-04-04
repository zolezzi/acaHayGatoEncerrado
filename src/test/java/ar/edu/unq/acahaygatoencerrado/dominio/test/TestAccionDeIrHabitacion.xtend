package ar.edu.unq.acahaygatoencerrado.dominio.test

import org.junit.Test

import org.junit.Before
import org.junit.Assert
import ar.edu.unq.acahaygatoencerrado.dominio.AccionDeIrHabitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Jugador
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion

class TestAccionDeIrHabitacion {
	
	AccionDeIrHabitacion irAlBanho
	
	Jugador jugador
	Habitacion banho
	
	@Before
	def void setUp(){
		
		banho = new Habitacion ("Baño")
		
		irAlBanho = new AccionDeIrHabitacion(banho)
		
		jugador = new Jugador
	}
	
	@Test
	def testAccionDeIrHabitacionSeAccionaConUnJugadorEntoncesLaHabitacionActualDelMismoEsLaHabitacionDeLaAccion(){
		
		irAlBanho.accionar(jugador)
		
		Assert.assertEquals(jugador.habitacionActual,irAlBanho.habitacion)
	}
}
