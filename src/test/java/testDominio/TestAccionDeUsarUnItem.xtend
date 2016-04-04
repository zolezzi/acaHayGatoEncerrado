package testDominio

import Dominio.AccionDeAgarrarUnItem
import Dominio.AccionDeIrHabitacion
import Dominio.AccionDeUsarUnItem
import Dominio.Habitacion
import Dominio.Inventario
import Dominio.Item
import Dominio.Jugador
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestAccionDeUsarUnItem {
	
	AccionDeUsarUnItem usarMotosierraParaIrAlPatioDelVecino
	AccionDeUsarUnItem usarMotosierraParaAgarrarLenha
	
	AccionDeAgarrarUnItem agarrarMotosierra
	Item motosierra
	AccionDeAgarrarUnItem agarrarLenha
	Habitacion patioDelVecino
	AccionDeIrHabitacion irAlPatioDelVecino
	Jugador jugador
	
	@Before
	def void setUp(){
		
		agarrarMotosierra = new AccionDeAgarrarUnItem ("Motosierra")
		motosierra = agarrarMotosierra.itemAgarrable()
		agarrarLenha = new AccionDeAgarrarUnItem ("Leña")
		
		patioDelVecino = new Habitacion ("Patio del Vecino")
		irAlPatioDelVecino = new AccionDeIrHabitacion (patioDelVecino)
		
		jugador = new Jugador => [
			inventario = new Inventario
			habitacionActual = new Habitacion ("Patio")
		]
		agarrarMotosierra.accionar(jugador)
		
		usarMotosierraParaIrAlPatioDelVecino = new AccionDeUsarUnItem(motosierra, irAlPatioDelVecino)
		usarMotosierraParaAgarrarLenha = new AccionDeUsarUnItem(motosierra, agarrarLenha)
	}
	
	@Test
	def testNombreDeAccionDeUsarUnItemParaIrAHabitacion(){
		
		Assert.assertEquals(usarMotosierraParaIrAlPatioDelVecino.nombre,"Usar Motosierra para Ir a Patio del Vecino")
	}
	
	@Test
	def testNombreDeAccionDeUsarUnItemParaAgarrarOtroItem(){
		
		Assert.assertEquals(usarMotosierraParaAgarrarLenha.nombre,"Usar Motosierra para Agarrar Leña")
	}
	
	@Test
	def testAccionDeUsarUnItemSeAccionaConUnJugadorEntoncesElMismoYaNoTieneEseItemEnSuInventario(){
		
		usarMotosierraParaIrAlPatioDelVecino.accionar(jugador)
		
		Assert.assertFalse(jugador.tiene(motosierra))
	}
	
	@Test
	def testAccionDeUsarUnItemParaIrAHabitacionSeAccionaConUnJugadorEntoncesLaHabitacionActualDelMismoEsLaHabitacionDeDestinoDeLaAccion(){

		usarMotosierraParaIrAlPatioDelVecino.accionar(jugador)
		
		Assert.assertEquals(jugador.habitacionActual, patioDelVecino)
	}
	
	@Test
	def testAccionDeUsarUnItemParaAgarrarOtroItemSeAccionaConUnJugadorEntoncesElMismoTieneEnSuInventarioEseOtroItem (){
		
		usarMotosierraParaAgarrarLenha.accionar(jugador)
		
		Assert.assertTrue(jugador.inventario.items.contains(agarrarLenha.itemAgarrable()))
	}
}