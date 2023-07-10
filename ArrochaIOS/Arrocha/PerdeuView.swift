//
//  PerdeuView.swift
//  Arrocha
//
//  Created by ifpb on 26/06/23.
//

import SwiftUI

struct LoseView: View {
    @ObservedObject var arrocha: ArrochaViewModel

    var body: some View {
        VStack {
            Text("Perdeu!!")
            Button("Jogar de novo") {
                self.arrocha.reset()
            }
        }
    }
}

struct LoseView_Previews: PreviewProvider {
    static var previews: some View {
        LoseView(theRockVM: TheRockViewModel())
    }
}
