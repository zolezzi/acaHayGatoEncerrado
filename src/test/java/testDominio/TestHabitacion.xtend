package testDominio

import org.junit.Test
import org.junit.Rule
import org.junit.rules.ExpectedException
import Dominio.Habitacion
import org.junit.Assert

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