//
//  ContentView.swift
//  Banorte
//
//  Created by Eduardo Rodriguez on 17/01/25.
//

import SwiftUI

struct LoginView: View {
    @State var password: String = ""
    @StateObject private var authViewModel = AuthViewModel(accountsModel: AccountsModel())
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.red.ignoresSafeArea()
                Circle().scale(1.9).foregroundColor(.white.opacity(0.15))
                Circle().scale(1.7).foregroundColor(.white)

                VStack(spacing: 10) {
                    Spacer().frame(height: 70)
                    
                    Text("Ingresar a")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.black)
                    
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .foregroundColor(.gray)

                    Text("Mis cuentas")
                        .bold()
                        .font(.title3)
                        .foregroundColor(.black)

                    Text("Cuentas y tarjetas")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Spacer().frame(height: 40)

                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "key.fill")
                                .foregroundColor(.gray)
                            SecureField("Captura tu contraseña", text: $password)
                        }
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 1)

                        Text("Debes ingresar 8 caracteres")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.top, 5)
                    }
                    .padding(.horizontal, 30)

                    Spacer().frame(height: 10)

                    Text("Olvidé mi contraseña")
                        .foregroundColor(.blue)
                        .underline()

                    Spacer().frame(height: 20)

                    Button(action: {
                        authViewModel.login(username: "", password: password)
                    }) {
                        Text("Iniciar")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.red)
                            .cornerRadius(20)
                    }

                    Text("o")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Button(action: {
                        print("Face ID")
                    }) {
                        HStack {
                            Image(systemName: "faceid")
                                .font(.title)
                            Text("Selfie")
                                .bold()
                        }
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 1)
                    }

                    Spacer()
                }
            }
            .navigationDestination(isPresented: $authViewModel.isLoggedIn) {
                DashBoardView().environmentObject(authViewModel)
            }
            .alert(authViewModel.errorMessage, isPresented: Binding<Bool>(
                get: { !authViewModel.errorMessage.isEmpty },
                set: { _ in authViewModel.errorMessage = "" }
            )) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}

#Preview {
    LoginView()
}
