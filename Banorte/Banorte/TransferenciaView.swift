//
//  SucursalView.swift
//  Banorte
//
//  Created by Eduardo Rodriguez on 20/02/25.
//
import SwiftUI

struct TransferenciaView: View {
    @State private var index = 0
    var body: some View {
        VStack {
            // Header
            HStack {
                Image(systemName: "person.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
                Text("TRANSFERENCIA")
                    .font(.title2)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                Image(systemName: "bell.fill")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.red)
            
            // informacion de usuario y balance
            VStack(alignment: .leading) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red)
                        .frame(height: 120)
                        .padding(.trailing)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Edson Leyva")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("093082989")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        .padding()
                        Spacer()
                        ZStack {
                            Circle()
                                .fill(Color.red.gradient)
                                .frame(width: 170, height: 170)
                            
                            VStack {
                                Text("$4,000")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.white)
                                Text("Saldo Total")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                            }
                        }
                        .offset(x: 19, y: 0)
                    }
                    .padding()
                }
            }
            .padding()
            
            // opciones
            HStack {
                NavigationLink(destination: ContactoView()) {
                    VStack {
                        Image(systemName: "plus")
                        Text("NUEVO")
                    }
                    .foregroundColor(.white)
                }
                .padding()
                .background(Color.gray.opacity(self.index == 0 ? 1 : 0))
                Spacer()
                Button(action: {self.index = 1}) {
                    VStack {
                        Image(systemName: "bookmark.fill")
                        Text("GUARDADO")
                    }
                    .foregroundColor(.white)
                }
                .padding()
                .background(Color.gray.opacity(self.index == 1 ? 1: 0))
                Spacer()
                Button(action: {self.index = 2}) {
                    VStack {
                        Image(systemName: "creditcard.fill")
                        Text("TARJETA PROPIA")
                    }
                    .foregroundColor(.white)
                }
                .padding()
                .background(Color.gray.opacity(self.index == 2 ? 1: 0))
                
                
            }
            .padding()
            .background(Color.red)
            
            
            // cantidad y concepto
            VStack(alignment: .leading) {
                Text("Digite la cantidad")
                TextField("------", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Concepto")
                TextField("------", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            // boton de pagar
            NavigationLink(destination: TicketSView(tarjeta: "123456789", numeroContrato: "987654321", cantidadPagada: "4000")) {
                Text("Pagar")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct TransferenciaView_Previews: PreviewProvider {
    static var previews: some View {
        TransferenciaView()
    }
}
