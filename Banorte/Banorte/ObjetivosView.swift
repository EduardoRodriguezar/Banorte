//
//  SucursalView.swift
//  Banorte
//
//  Created by Eduardo Rodriguez on 20/02/25.
//

import SwiftUI

struct ObjetivosView: View {
    var body: some View {
        
        VStack (spacing: 80){
            VStack {
                HStack {
                    Button(action: {}) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text("DEFINIR OBJETIVO")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .bold()
                        .foregroundColor(.white)
                        
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "bell.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }
                }
               
                Text("Tu planta Digital")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(Color.red)
            
            Text("ESTABLECE OBJETIVOS ").multilineTextAlignment(.center).bold().font(.title).foregroundColor(.black)
            
            VStack {
                
                ZStack {
                    
                    Image("plant_img").resizable().frame(width: 200, height: 200)
                    
                    VStack(){
                        Spacer()
                            .frame(alignment: .trailing)
                        
                        Button(action: {
                                    print("Add Button")
                                    }) {
                                    Text("+")
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(Color.white)
                                        .background(Color.red)
                                        .clipShape(Circle()).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                                    }
                    }
                    
                }//ZStack
                
                Spacer()
                    .frame(height: 40)
                //Labels Ahorros
                            Label("Nueva Laptop", systemImage: "checkmark.circle.fill")
                                .frame(width: 360, height: 80)
                                .background(Color.red)
                                .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            Label("Concierto", systemImage: "clock.fill")
                                .frame(width: 360, height: 80)
                                
                                .background(
                                    RoundedRectangle(
                                        cornerRadius: 12,
                                            style: .continuous
                                            )
                                            .stroke(.gray, lineWidth: 1)
                                )
                                .foregroundStyle(.red)
                            
                            Label("Nintendo Switch 2", systemImage: "clock.fill")
                                .frame(width: 360, height: 80)
                                .background(Color.red)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                
            }
            
            
        }
        
    }
}

#Preview {
    ObjetivosView()
}
