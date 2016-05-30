package ar.edu.unq.acahaygatoencerrado.dominio.test

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import org.junit.Rule
import org.junit.rules.ExpectedException
import ar.edu.unq.acahaygatoencerrado.dominio.Inventario
import ar.edu.unq.acahaygatoencerrado.dominio.Item

class TestInventario {
	
	Inventario inventario
	Item cosa
	
	def inventarioLleno(){
		
		for(var i = 0; i <15; i++){
			inventario.agregar(cosa)
		}
	}
	
	@Before
	def void setUp(){
		
		inventario = new Inventario
		cosa = new Item => [
			nombre = "Cosa"
		]
	}
	
	@Test
	def testInventarioVacioTieneEspacioDisponible(){
		
		Assert.assertTrue(inventario.hayEspacioDisponible)
		Assert.assertEquals(inventario.items.size,0)
	}
	
	@Test
	def testInventarioConDiezItemsTieneEspacioDisponible(){
		
		for(var i = 0; i < 10; i++ ){
			inventario.agregar(cosa)
		}
		
		Assert.assertTrue(inventario.hayEspacioDisponible)
		Assert.assertEquals(inventario.items.size,10)
	}
	
	@Test
	def testInventarioConQuinceItemsNoTieneEspacioDisponible(){
		
		this.inventarioLleno
		
		Assert.assertFalse(inventario.hayEspacioDisponible)
		Assert.assertEquals(inventario.items.size,15)
	}
	
	@Rule
	public ExpectedException thrown = ExpectedException.none()

	@Test
	def testInventarioSinEspacioDisponibleQuitaUnItemEntoncesTieneEspacioDisponible(){
		
		this.inventarioLleno
		
		inventario.quitar(cosa.id)
		
		Assert.assertTrue(inventario.hayEspacioDisponible)
		Assert.assertEquals(inventario.items.size,14)
	}
}
