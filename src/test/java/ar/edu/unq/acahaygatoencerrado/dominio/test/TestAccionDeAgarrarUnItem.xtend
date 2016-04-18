package ar.edu.unq.acahaygatoencerrado.dominio.test

import org.junit.Rule
import org.junit.rules.ExpectedException
import org.junit.Test
import org.junit.Assert
import org.junit.Before
import ar.edu.unq.acahaygatoencerrado.dominio.AccionDeAgarrarUnItem
import ar.edu.unq.acahaygatoencerrado.dominio.Jugador
import ar.edu.unq.acahaygatoencerrado.dominio.Inventario
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion

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
		
		Assert.assertEquals(agarrarCuchillo.itemAgarrable().get(0).nombre, "Cuchillo")
	}
	
	@Test
	def testUnaAccionDeAgarrarUnItemSeAccionaConUnJugadorEntoncesEseItemEstaEnSuInventarioYLaAccionYaNoEstaEnSuHabitacion(){
		
		agarrarCuchillo.accionar(jugador)
		
		Assert.assertTrue(jugador.inventario.items.contains(agarrarCuchillo.itemAgarrable()))
		Assert.assertFalse(jugador.habitacionActual.acciones.contains(agarrarCuchillo))
	}
}
