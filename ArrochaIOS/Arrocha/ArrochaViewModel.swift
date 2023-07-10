//
//  File.swift
//  Arrocha
//
//  Created by ifpb on 26/06/23.
//

import Foundation

class ArrochaViewModel: ObservableObject {
    @Published var gameNumber:Int
    @Published var minLimit:Int
    @Published var maxLimit:Int
    @Published var gameStatus:GameStatus = GameStatus.jogando
    @Published var chuteStatus:ChuteStatus = ChuteStatus.inicio
    @Published var tela: Tela = .win

    init(minLimit: Int = 1, maxLimit: Int = 100) {
        self.gameNumber = Int.random(in: minLimit+1..<maxLimit)
        self.minLimit = minLimit
        self.maxLimit = maxLimit
    }

    func chute(chute:Int) {
        if (!self.chuteValido(chute: chute)) {
            self.gameStatus = GameStatus.perdeu
        } else {
            self.alterarLimite(chute: chute)
            if (self.ganhou()) {
                self.gameStatus = GameStatus.ganhou
            }
        }
    }

    func chuteValido(chute:Int) -> Bool {
        return chute > self.minLimit && chute < self.maxLimit && chute != self.gameNumber
    }

    func alterarLimite(chute:Int) {
        if (chute < self.gameNumber) {
            self.minLimit = chute
            self.chuteStatus = ChuteStatus.menor
        } else if (chute > self.gameNumber) {
            self.maxLimit = chute
            self.chuteStatus = ChuteStatus.maior
        }
    }

    func ganhou() -> Bool {
        return self.minLimit + 1 == self.maxLimit - 1
    }

    func reset(minLimit: Int = 1, maxLimit: Int = 100) {
        self.minLimit = minLimit
        self.maxLimit = maxLimit
        self.gameNumber = Int.random(in: minLimit+1..<maxLimit)
        self.gameStatus = GameStatus.jogando
        self.chuteStatus = ChuteStatus.inicio
    }
}

enum GameStatus: String {
    case ganhou = "GANHOU"
    case perdeu = "PERDEU"
    case jogando = "JOGANDO"
}

enum ChuteStatus: String {
    case inicio = ""
    case maior = "MAIOR"
    case menor = "MENOR"
    case igual = "IGUAL"
}

enum Tela {
    case arrocha
    case ganhou
    case perdeu
}
