//
//  AccountsModel.swift
//  Banorte
//
//  Created by Angel Escalante Garza on 25/02/25.
//

import SwiftUI
import Combine

class AccountsModel: ObservableObject {
    @Published var accounts: [Account]? {
        didSet {
            print("Cuentas actualizadas: \(accounts ?? [])") // Depuración
        }
    }
    
    @Published var errorMessage: String = ""
    
    func obtainAccounts(user: User, completion: @escaping ([Account]?, String?) -> Void) {
        print("Obteniendo cuentas para el cliente: \(user.clientId)") // Depuración
        getClientAccounts(clientId: user.clientId) { accounts, error in
            DispatchQueue.main.async {
                if let accounts = accounts {
                    self.accounts = accounts
                    completion(accounts, nil) // Devuelve las cuentas
                } else {
                    self.errorMessage = error ?? "Error al obtener las cuentas"
                    print("Error al obtener las cuentas: \(self.errorMessage)") // Depuración
                    completion(nil, self.errorMessage) // Devuelve el error
                }
            }
        }
    }
}
