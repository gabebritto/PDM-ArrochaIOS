//
//  GanhouView.swift
//  Arrocha
//
//  Created by ifpb on 26/06/23.
//

import SwiftUI

struct GanhouView: View {
    @ObservedObject var arrocha: ArrochaViewModel

    var body: some View {
        VStack {
            Text("Ganhou!!")
            Button("Reinciar") {
                self.arrocha.reset()
            }
        }
    }
}

struct GanhouView_Previews: PreviewProvider {
    static var previews: some View {
        GanhouView(arrocha: ArrochaViewModel())
    }
}
