package testDominio

import org.junit.Before
import Dominio.Inventario
import org.junit.Test
import org.junit.Assert
import Dominio.Item
import org.junit.Rule
import org.junit.rules.ExpectedException

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
		
		Assert.assertTrue(inventario.chequearEspacioDisponible)
		Assert.assertEquals(inventario.items.size,0)
	}
	
	@Test
	def testInventarioConDiezItemsTieneEspacioDisponible(){
		
		for(var i = 0; i < 10; i++ ){
			inventario.agregar(cosa)
		}
		
		Assert.assertTrue(inventario.chequearEspacioDisponible)
		Assert.assertEquals(inventario.items.size,10)
	}
	
	@Test
	def testInventarioConQuinceItemsNoTieneEspacioDisponible(){
		
		this.inventarioLleno
		
		Assert.assertFalse(inventario.chequearEspacioDisponible)
		Assert.assertEquals(inventario.items.size,15)
	}
	
	@Rule
	public ExpectedException thrown = ExpectedException.none()
	
	@Test (expected = Exception )
	def void testInventarioSinEspacioDisponibleAgregaUnItemMasEntoncesDevuelveUnaExcepcion(){
		
		this.inventarioLleno
		
		inventario.agregar(cosa)
		
		thrown.expectMessage("Inventario Lleno. No se puede agarrar Cosa")
		Assert.assertEquals(inventario.items.size,15)
	}

	@Test
	def testInventarioSinEspacioDisponibleQuitaUnItemEntoncesTieneEspacioDisponible(){
		
		this.inventarioLleno
		
		inventario.quitar(cosa)
		
		Assert.assertTrue(inventario.chequearEspacioDisponible)
		Assert.assertEquals(inventario.items.size,14)
	}
}