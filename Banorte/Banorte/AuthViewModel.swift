//
//  AuthViewModel.swift
//  Login
//
//  Created by Eduardo Rodriguez on 04/02/25.

import SwiftUI
import Combine

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var errorMessage: String = ""
    @Published var message: String = ""
    @Published var password: String = ""
    @Published var user: User? = nil
    @Published var accounts: [Account] = []
    var accountsModel: AccountsModel
    
    init(accountsModel: AccountsModel) {
        self.accountsModel = accountsModel
    }
    
    func login(username: String, password: String) {
        self.isLoggedIn = false
        self.errorMessage = ""
        
        // Validar la contraseña
        if password.isEmpty {
            self.errorMessage = "Todos los campos son obligatorios"
            return
        } else if password.count < 8 {
            self.errorMessage = "La contraseña debe tener al menos 8 caracteres"
            return
        }
        
        // Obtener el usuario
        getUsers(userId: 1) { user, error in
            DispatchQueue.main.async {
                if let user = user {
                    if password == user.password {
                        // Llamada a obtainAccounts con el completion handler
                        self.accountsModel.obtainAccounts(user: user) { accounts, error in
                            if let accounts = accounts {
                                self.accounts = accounts
                                self.isLoggedIn = true
                                self.errorMessage = ""
                                self.user = user
                                print("Login exitoso. Usuario: \(user.name)") // Depuración
                                print("Datos AuthViewModel: \(self.accounts)") // Depuración
                            } else if let error = error {
                                self.errorMessage = error
                                print("Error al obtener las cuentas: \(error)") // Depuración
                            }
                        }
                    } else {
                        self.errorMessage = "Usuario o contraseña incorrectos"
                        print("Error: Usuario o contraseña incorrectos") // Depuración
                    }
                } else {
                    self.errorMessage = error ?? "Error al obtener el usuario"
                    print("Error al obtener el usuario: \(self.errorMessage)") // Depuración
                }
            }
        }
    }
}
