package ar.edu.unq.acahaygatoencerrado.dominio.test


import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ar.edu.unq.acahaygatoencerrado.dominio.AccionDeUsarUnItem
import ar.edu.unq.acahaygatoencerrado.dominio.AccionDeAgarrarUnItem
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.AccionDeIrHabitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Jugador
import ar.edu.unq.acahaygatoencerrado.dominio.Inventario

class TestAccionDeUsarUnItem {
	
	AccionDeUsarUnItem usarMotosierraParaIrAlPatioDelVecino
	AccionDeUsarUnItem usarMotosierraParaAgarrarLenha
	
	AccionDeAgarrarUnItem agarrarMotosierra
	Item motosierra
	Item lenha
	AccionDeAgarrarUnItem agarrarLenha
	Habitacion patioDelVecino
	AccionDeIrHabitacion irAlPatioDelVecino
	Jugador jugador
	
	@Before
	def void setUp(){
		
		agarrarMotosierra = new AccionDeAgarrarUnItem ("Motosierra")
		motosierra = agarrarMotosierra.itemAgarrable().get(0)
		agarrarLenha = new AccionDeAgarrarUnItem ("Leña")
		lenha = agarrarLenha.itemAgarrable().get(0)
		
		patioDelVecino = new Habitacion ("Patio del Vecino")
		irAlPatioDelVecino = new AccionDeIrHabitacion (patioDelVecino)
		
		jugador = new Jugador => [
			inventario = new Inventario
			habitacionActual = new Habitacion ("Patio")
		]
		agarrarMotosierra.accionar(jugador)
		
		usarMotosierraParaIrAlPatioDelVecino = new AccionDeUsarUnItem(motosierra, patioDelVecino)
		usarMotosierraParaAgarrarLenha = new AccionDeUsarUnItem(motosierra, lenha)
	}
	
	@Test
	def testNombreDeAccionDeUsarUnItemParaIrAHabitacion(){
		
		Assert.assertEquals(usarMotosierraParaIrAlPatioDelVecino.nombre,"Usar Motosierra para Ir a Patio del Vecino")
	}
	
	@Test
	def testNombreDeAccionDeUsarUnItemParaAgarrarOtroItem(){
		
		Assert.assertEquals(usarMotosierraParaAgarrarLenha.nombre,"Usar Motosierra para obtener Leña")
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