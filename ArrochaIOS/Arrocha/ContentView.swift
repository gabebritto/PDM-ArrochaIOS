//
//  ContentView.swift
//  Arrocha
//
//  Created by ifpb on 26/06/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var arrocha: ArrochaViewModel

    var body: some View {
        if self.arrocha.gameStatus == .jogando {
            ArrochaView(arrocha: self.arrocha)
        } else if self.arrocha.gameStatus == .ganhou {
            GanhouView(arrocha: self.arrocha)
        } else {
            PerdeuView(arrocha: self.arrocha)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(arrocha: ArrochaViewModel())
    }
}
