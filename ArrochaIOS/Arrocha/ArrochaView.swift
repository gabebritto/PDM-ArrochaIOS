//
//  ArrochaView.swift
//  Arrocha
//
//  Created by ifpb on 26/06/23.
//

import SwiftUI

struct ArrochaView: View {
    @ObservedObject var arrocha: ArrochaViewModel
    @State var chute: String = ""

    var body: some View {
        VStack {
            Spacer()
            limite
            Text(String(self.arrocha.gameNumber))
            Spacer()
            input
            chuteBtn
            Spacer()
            status
            Spacer()
        }
    }
}

extension ArrochaView {
    var limite: some View {
        HStack {
            Text(self.arrocha.minLimit.description).padding()
            Text(self.arrocha.maxLimit.description).padding()
        }
    }

    var input: some View {
        TextField("Chute", text: self.$chute).padding().textFieldStyle(RoundedBorderTextFieldStyle())
    }

    var chuteBtn: some View {
        Button("Chutar"){
            self.arrocha.chute(chute: Int(self.chute) ?? 0)
        }
    }

    var status: some View {
        VStack {
            Text("Chutou: \(self.arrocha.chuteStatus.rawValue)").padding()
            Text("Status: \(self.arrocha.gameStatus.rawValue)").padding()
        }
    }
}

struct ArrochaView_Previews: PreviewProvider {
    static var previews: some View {
        ArrochaView(arrocha: ArrochaViewModel())
    }
}
