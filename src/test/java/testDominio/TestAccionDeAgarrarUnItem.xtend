package testDominio

import org.junit.Rule
import org.junit.rules.ExpectedException
import org.junit.Test
import Dominio.AccionDeAgarrarUnItem
import org.junit.Assert
import org.junit.Before
import Dominio.Jugador
import Dominio.Inventario
import Dominio.Habitacion

class TestAccionDeAgarrarUnItem {
	
	AccionDeAgarrarUnItem agarrarCuchillo
	
	Jugador jugador
	
	@Before
	def void setUp(){
		
		agarrarCuchillo = new AccionDeAgarrarUnItem ("Cuchillo")
		
		jugador = new Jugador => [
			inventario = new Inventario
			habitacionActual = new Habitacion("Cocina")
		]
		
		jugador.habitacionActual.acciones.add(agarrarCuchillo)
	}
	
	@Rule
	public ExpectedException thrown = ExpectedException.none()
	
	@Test (expected = Exception)
	def testAccionDeAgarrarUnItemSinNombre(){
		
		new AccionDeAgarrarUnItem ("")
		
		thrown.expectMessage("Nombre de Item invalido") 
	}
	
	@Test
	def testAccionDeAgarrarUnItemConNombreValido(){
		
		Assert.assertEquals(agarrarCuchillo.nombre, "Agarrar Cuchillo")
	}
	
	@Test
	def testAccionDeAgarrarUnItemTieneUnItemAgarrableConElMismoNombreConElQueFueConstruido(){
		
		Assert.assertEquals(agarrarCuchillo.itemAgarrable().nombre, "Cuchillo")
	}
	
	@Test
	def testUnaAccionDeAgarrarUnItemSeAccionaConUnJugadorEntoncesEseItemEstaEnSuInventarioYLaAccionYaNoEstaEnSuHabitacion(){
		
		agarrarCuchillo.accionar(jugador)
		
		Assert.assertTrue(jugador.inventario.items.contains(agarrarCuchillo.itemAgarrable()))
		Assert.assertFalse(jugador.habitacionActual.acciones.contains(agarrarCuchillo))
	}
}