//
//  TarjetasView.swift
//  Banorte
//
//  Created by Angel Escalante Garza on 25/02/25.
//

import SwiftUI

struct TarjetasView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            if authViewModel.isLoggedIn {
                if let accounts = authViewModel.accountsModel.accounts {
                    if accounts.isEmpty {
                        Text("No hay cuentas disponibles")
                            .foregroundColor(.red)
                    } else {
                        TabView {
                            ForEach(accounts) { account in
                                previewView(account: account)
                                    .padding(.horizontal, 10)
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .frame(height: 100)
                    }
                } else {
                    Text("Cargando cuentas...")
                        .foregroundColor(.gray)
                }
            } else {
                if authViewModel.errorMessage.isEmpty {
                    ProgressView("Iniciando sesión...")
                } else {
                    Text(authViewModel.errorMessage)
                        .foregroundColor(.red)
                }
            }
        }
        .onAppear {
            authViewModel.login(username: "", password: "Trello135")
            print("Cuentas: \(String(describing: authViewModel.accounts))")
        }
    }
}

#Preview {
    let authViewModel = AuthViewModel(accountsModel: AccountsModel())
    return TarjetasView()
        .environmentObject(authViewModel)
}

extension TarjetasView {
    private func previewView(account: Account) -> some View {
        VStack {
            // Sección de datos de la cuenta
            HStack {
                Text("Nómina: \(account.accountNumber ?? 0)").bold()
                Spacer()
                Text("Saldo Disponible: $\( account.balance.formattedWithCommas())").bold()
            }
            .padding(.bottom, 5)
            
            // Sección de opciones
            HStack {
                NavigationLink(destination: RecibirView()) {
                    BarraIcono(icono: "arrow.down", texto: "Recibir")
                }
                NavigationLink(destination: TransferenciaView()) {
                    BarraIcono(icono: "arrow.left.arrow.right", texto: "Transferir")
                }
                NavigationLink(destination: AjustesTarjetasView()) {
                    BarraIcono(icono: "gear", texto: "Ajustes")
                }
                NavigationLink(destination: AhorroView()) {
                    BarraIcono(icono: "plus", texto: "Ahorro")
                }
            }
        }
        .padding()
        .background(Color(UIColor.systemGray5))
        .cornerRadius(10)
    }
}

extension Float {
    func formattedWithCommas() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
