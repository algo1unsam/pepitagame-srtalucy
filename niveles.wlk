import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		game.onTick(3000, "gravedad", { pepita.bajar() })	
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()

		game.onTick(800, "gravedad", { pepita.bajar() })	
	}

}
//
object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ pepita.irA(pepita.position().left(1)) })
		keyboard.right().onPressDo({ pepita.irA(pepita.position().right(1)) })
		keyboard.up().onPressDo({ pepita.irA(pepita.position().up(1)) })
		keyboard.down().onPressDo({ pepita.irA(pepita.position().down(1)) })

		// tocando la C para comer 
		keyboard.c().onPressDo({
			var comida = game.uniqueCollider(pepita) // Obtiene el objeto con el que está colisionando Pepita
			if (comida != null && comida.tipo()== "alpiste" || comida.tipo()== "manzana" ) { 
				pepita.come(comida) // Pepita come la comida
				game.removeVisual(comida) // Elimina la comida del juego
			}
		})
	}
	
method configurarColisiones() {

    game.onCollideDo(pepita, { algo => 
        if (algo.comida()) { 
            pepita.come(algo) 
            game.removeVisual(algo) 
			
        } else {
           
            algo.teEncontro(pepita) 
        }
    })
}
}