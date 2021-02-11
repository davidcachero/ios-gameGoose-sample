import UIKit

public var jug1 : Int = 0
public var estado1 : String = "jugando"
public var jug2 : Int = 0
public var estado2 : String = "jugando"
public var oca : [Int] = [5, 9, 14, 18, 23, 27, 32, 36, 41, 45, 50, 54, 59]
public var estados : [String] = ["jugando", "pierdeTurno", "esperando", "pierdeDosTurnos", "ganador"]

func inicio () -> Void {
    while (jug1 != 63 && jug2 != 63) {
        compareEstadosJug1()
        if estado1 != estados[4] {
            compareEstadosJug2()
        }
    }
}

func compareEstadosJug1 () -> Void {
    if estado1 == estados[0] {
        turnoJug1()
    } else if estado1 == estados[1] {
        estado1 = estados[0]
        print("Turno perdido por el jugador 1")
    } else if estado1 == estados[2] {
        if jug2 >= jug1 {
            estado1 = estados[0]
            print("Jugador 1 vuelve a jugar")
            turnoJug1()
        } else {
            print("Jugador 1 sigue espetando")
        }
    } else if estado1 == estados[3] {
        estado1 = estados[1]
    }
}


func turnoJug1 () -> Void {
    let avanzeCasilla = Int.random(in: 1..<6)
    jug1 += avanzeCasilla
    switch jug1 {
    case 5, 9, 14, 18, 23, 27, 32, 36, 41, 45, 50, 54, 59:
        print("Jugador 1 en posicion: " , jug1 , " - avanza a la siguiente oca, y vuelve a tirar")
        let posicion  : Int =  oca.firstIndex(of: jug1) ?? 0
        jug1 = oca[posicion]
        turnoJug1()
        
    case 6, 12:
        jug1 = 19
        estado1 = estados[1]
        print("Jugador 1 en posicion: " , jug1 , " - salta a la casilla 19 (posada) y se pierde un turno")
        
    case 19:
        estado1 = estados[1]
        print("Jugador 1 en posicion: " , jug1 , " - pierdes turno")
        
    case 31:
        estado1 = estados[2]
        print("Jugador 1 en posicion: " , jug1 , " - o se puede volver a jugar hasta que no pase otro jugador por esa casilla")
        
    case 42:
        jug1 = 30
        print("Jugador 1 en posicion: " , jug1 , " - retrocede hasta la casilla 30")
        
    case 56:
        estado1 = estados[3]
        print("Jugador 1 en posicion: " , jug1 , " - pierdes dos turnos")
        
    case 26, 53:
        jug1 = avanzeCasilla
        print("Jugador 1 en posicion: " , jug1 , " - se suma el número de casilla a la tirada, avanzando tantas casillas como el resultado")
        
    case 58:
        jug1 = 1
        print("Jugador 1 en posicion: " , jug1 , " - retrocede hasta la casilla 1")
        
    case 63:
        estado1 = estados[4]
        print("Jugador 1 has ganado")
        
    case 64...:
        jug1 = 63 - (jug1 - 63)
        print("Jugador 1 en posicion: " , jug1 ,  " - ha retrocedido por pasarse del 63")
        
    default:
        print("Jugador 1 en posicion:" , jug1)
    }
}


func compareEstadosJug2 () -> Void {
    if estado2 == estados[0] {
        turnoJug2()
    } else if estado2 == estados[1] {
        estado2 = estados[0]
        print("Turno perdido por el jugador 2")
    } else if estado2 == estados[2] {
        if jug1 >= jug2 {
            estado2 = estados[0]
            print("Jugador 2 vuelve a jugar")
            turnoJug2()
        } else {
            print("Jugador 2 sigue espetando")
        }
    } else if estado2 == estados[3] {
        estado2 = estados[1]
    }
}


func turnoJug2 () -> Void {
    let avanzeCasilla = Int.random(in: 1..<6)
    jug2 += avanzeCasilla
    switch jug2 {
    case 5, 9, 14, 18, 23, 27, 32, 36, 41, 45, 50, 54, 59:
        print("Jugador 2 en posicion: " , jug2 , " - avanza a la siguiente oca, y vuelve a tirar")
        let posicion  : Int =  oca.firstIndex(of: jug2) ?? 0
        jug2 = oca[posicion]
        turnoJug2()
        
    case 6, 12:
        jug2 = 19
        estado2 = estados[1]
        print("Jugador 2 en posicion: " , jug2 , " - salta a la casilla 19 (posada) y se pierde un turno")
        
    case 19:
        estado2 = estados[1]
        print("Jugador 2 en posicion: " , jug2 , " - pierdes turno")
        
    case 31:
        estado2 = estados[2]
        print("Jugador 2 en posicion: " , jug2 , " - no se puede volver a jugar hasta que no pase otro jugador por esa casilla")
        
    case 42:
        jug2 = 30
        print("Jugador 2 en posicion: " , jug2 , " - retrocede hasta la casilla 30")
        
    case 56:
        estado2 = estados[3]
        print("Jugador 2 en posicion: " , jug2 , " - pierdes dos turnos")
        
    case 26, 53:
        jug2 = avanzeCasilla
        print("Jugador 2 en posicion: " , jug2 , " - se suma el número de casilla a la tirada, avanzando tantas casillas como el resultado")
        
    case 58:
        jug2 = 1
        print("Jugador 2 en posicion: " , jug2 , " - retrocede hasta la casilla 1")
        
    case 63:
        estado2 = estados[4]
        print("Jugador 2 has ganado")
        
    case 64...:
        jug2 = 63 - (jug2 - 63)
        print("Jugador 2 en posicion: " , jug2 , " - ha retrocedido por pasarse del 63")
        
    default:
        print("Jugador 2 en posicion:" , jug2)
    }
}

inicio()
