import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave, "GANASTE! WIII")
		game.schedule(2000, { game.stop() })
	}
}


object silvestre {

	var property position = game.at(3,0)

	method seguir(ave){
		if(ave.position().x()>2) position = game.at(ave.position().x(),0)
	}

	method image() = "silvestre.png"
	
}