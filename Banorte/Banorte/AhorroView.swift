//
//  AhorroView.swift
//  Banorte
//
//  Created by Eduardo Rodriguez on 20/02/25.
//

import SwiftUI

struct AhorroView: View {
    var body: some View {
        
        ZStack {
            Color.red.ignoresSafeArea()
            Circle().scale(1.98).foregroundColor(.white.opacity(0.15))
            Circle().scale(1.80).foregroundColor(.white)
            
            VStack {
                Text("TU PLANTA VIRTUAL").bold().font(.largeTitle).foregroundColor(.black)
                
                Image("plant_img").resizable().frame(width: 200, height: 200)
                
                Text("Mejora tus finanzas, implementa metas de ahorro y consigue recompensas").font(.body).multilineTextAlignment(.center).padding(40)
                    
                Button(action: {
                    print("botón")
                }) {
                    Text("COMIENZA AHORA").bold().font(.title3)
                }
                .foregroundColor(.white)
                .padding().frame(width: 250)
                .background(Color.red)
                .cornerRadius(30)
                .shadow(radius: 5)

            }
            
        }
        
    }
}

#Preview {
    AhorroView()
}
