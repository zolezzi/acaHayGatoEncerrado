package ar.edu.unq.acahaygatoencerrado.dominio.test


import org.junit.Test
import org.junit.Before
import org.junit.Assert
import ar.edu.unq.acahaygatoencerrado.dominio.Inventario
import ar.edu.unq.acahaygatoencerrado.dominio.Jugador
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion

class TestJugador {
	
	Jugador jugador
	Inventario inventario
	Item item
	Habitacion habitacion
	Habitacion otraHabitacion	
	
	@Before
	def void setUp(){
		jugador = new Jugador()
		inventario = new Inventario
		
	}
	
	@Test
	def testDadoUnJugadorSeteoSuHabitacionActual(){
		habitacion = new Habitacion("Cocina")
		jugador.habitacionActual = habitacion
		
		Assert.assertEquals(jugador.habitacionActual.nombre, "Cocina")
	}

		@Test
	def testDadoUnJugadorQueTieneComoHabitacionActualLaCocinaLeCambioLaHabitacionAComedor(){
		habitacion = new Habitacion("Cocina")
		jugador.habitacionActual = habitacion
		
		Assert.assertEquals(jugador.habitacionActual.nombre, "Cocina")
		
		otraHabitacion = new Habitacion("Comedor")
		jugador.cambiarHabitacion(otraHabitacion)
		
		Assert.assertEquals(jugador.habitacionActual.nombre, "Comedor")
	}
	
	@Test
	def testUnJugadorQueTieneUnInventarioVacioCuandoLeAgregoUnItemEntoncesSeIncrementa(){
		item = new Item => [nombre = "Escalera"]
		inventario.agregar(item)
		jugador.inventario = inventario
		
		Assert.assertTrue(jugador.tiene(item))
	}
}