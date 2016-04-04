package ar.edu.unq.acahaygatoencerrado.dominio.test

import org.junit.Rule
import org.junit.rules.ExpectedException
import org.junit.Test
import org.junit.Assert
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion

class TestHabitacion {
	
	Habitacion cocina
	
	@Rule
	public ExpectedException thrown = ExpectedException.none()
	
	@Test (expected = Exception)
	def testHabitacionSinNombre(){
		
		new Habitacion ("")
		
		thrown.expectMessage("Nombre de Habitacion invalido") 
	}

/* 	@Test (expected = Exception)
	def testHabitacionConUnNombreQueEmpiezaConUnEspacio(){
		
		new Habitacion (" Cocina")
		
		thrown.expectMessage("Nombre de Habitacion invalido")
	}
*/
	@Test
	def testHabitacionConUnNombreValido(){
		
		cocina = new Habitacion ("Cocina")
		
		Assert.assertEquals(cocina.nombre,"Cocina")
	}
}
