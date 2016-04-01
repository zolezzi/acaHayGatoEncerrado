package testDominio

import Dominio.Inventario
import Dominio.ServidorDeLaberintos
import Dominio.Habitacion
import Dominio.Laberinto
import org.junit.Test
import org.junit.Before
import Dominio.Jugador
import org.junit.Assert
import Dominio.Item

class TestJugador {
	
	Jugador jugador
	Inventario inventario
	Item item
	ServidorDeLaberintos servidorDeLaberintos
	Habitacion habitacionActual
	Habitacion otraHabitacion
	Laberinto laberinto1

	
	
	@Before
	def void setUp(){
		servidorDeLaberintos = new ServidorDeLaberintos()
		jugador = new Jugador()
		inventario = new Inventario
		
	}
	
	@Test
	def testDadoUnJugadorQueSolicitaLaberintoYElServidorDeLaberintoNoTieneLaberintosRegistradosEntoncesRetorna0(){
		jugador.servidorDeLaberintos = servidorDeLaberintos
		Assert.assertEquals(jugador.servidorDeLaberintos.laberintos.size,0)
	}
	
	@Test
	def testDadoUnJugadorQueSolicitaUnLaberintoAlServidoQueTieneRegistradoUnLaberintoEntoncesRetorna1(){
		jugador.servidorDeLaberintos = servidorDeLaberintos
		servidorDeLaberintos.laberintos.add(laberinto1)
		
		Assert.assertEquals(jugador.servidorDeLaberintos.laberintos.size,1)
		
	}
	
	@Test
	def testDadoUnJugadorSeteoSuHabitacionHabitacionActual(){
		habitacionActual = new Habitacion("Cocina")
		jugador.habitacionInicial = habitacionActual
		
		Assert.assertEquals(jugador.habitacionActual.nombre, "Cocina")
	}
	
	@Test
	def testDadoUnJugadorConSuHabitacionActualPreguntoCuantasAccionesTieneRetorna0(){
		habitacionActual = new Habitacion("Comedor")
		jugador.habitacionInicial = habitacionActual
	
		Assert.assertEquals(jugador.acciones.size, 0)
	}
	
		@Test
	def testDadoUnJugadorQueTieneComoHabitacionActualLaCocinaLeCambioLaHabitacionAComedor(){
		habitacionActual = new Habitacion("Cocina")
		jugador.habitacionInicial = habitacionActual
		
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
	
		@Test
	def testUnJugadorQueTieneUnInventarioConDosItemsCuandoLeSacoUnoQueda1(){
		item = new Item => [nombre = "Escalera"]
		var Item item2 = new Item => [nombre = "Cuchillo"]
		inventario.agregar(item)
		inventario.agregar(item2)
		jugador.inventario = inventario
		jugador.quitar(item)
		
		
		Assert.assertEquals(jugador.inventario.items.size, 1)
	}
		
}