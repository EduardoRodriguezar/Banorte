//
//  getterDatabase.swift
//  laravel-conexion
//
//  Created by Angel Escalante Garza on 23/02/25.
//

import Foundation

// Función genérica para manejar solicitudes de red
func fetchData<T: Decodable>(from urlString: String, completion: @escaping (T?, String?) -> Void) {
    guard let url = URL(string: urlString) else {
        completion(nil, "URL inválida")
        return
    }

    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            completion(nil, error.localizedDescription)
            return
        }

        guard let data = data else {
            completion(nil, "No se recibieron datos del servidor")
            return
        }

        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            completion(decodedData, nil)
        } catch {
            completion(nil, "Error al decodificar los datos: \(error.localizedDescription)")
        }
    }

    task.resume()
}

// Funciones específicas que utilizan la función genérica
func getUsers(userId: Int, completion: @escaping (User?, String?) -> Void) {
    let urlString = "http://localhost:8000/api/users/\(userId)"
    fetchData(from: urlString, completion: completion)
}

func getAccountExternalTransfers(accountId: Int, completion: @escaping ([ExternalTransfer]?, String?) -> Void) {
    let urlString = "http://localhost:8000/api/accounts/\(accountId)/external_transfers"
    fetchData(from: urlString, completion: completion)
}

func getAccountInternalTransfers(accountId: Int, completion: @escaping ([InternalTransfer]?, String?) -> Void) {
    let urlString = "http://localhost:8000/api/accounts/\(accountId)/internal_transfers"
    fetchData(from: urlString, completion: completion)
}

func getAccountInvestmentMovements(accountId: Int, completion: @escaping ([InvestmentMovement]?, String?) -> Void) {
    let urlString = "http://localhost:8000/api/accounts/\(accountId)/investment_movements"
    fetchData(from: urlString, completion: completion)
}

func getAccountPaymentServices(accountId: Int, completion: @escaping ([PaymentService]?, String?) -> Void) {
    let urlString = "http://localhost:8000/api/accounts/\(accountId)/payment_services"
    fetchData(from: urlString, completion: completion)
}

func getAccountMovements(accountId: Int, completion: @escaping ([Movement]?, String?) -> Void) {
    let urlString = "http://localhost:8000/api/accounts/\(accountId)/separate_movements"
    fetchData(from: urlString, completion: completion)
}

func getClientCreditCards(clientId: Int, completion: @escaping ([CreditCard]?, String?) -> Void) {
    let urlString = "http://localhost:8000/api/clients/\(clientId)/credit_cards"
    fetchData(from: urlString, completion: completion)
}

func getClientAccounts(clientId: Int, completion: @escaping ([Account]?, String?) -> Void) {
    let urlString = "http://localhost:8000/api/clients/\(clientId)/accounts"
    fetchData(from: urlString, completion: completion)
}

func getCreditCardPaymentTDC(cardId: Int, completion: @escaping ([PaymentCC]?, String?) -> Void) {
    let urlString = "http://localhost:8000/api/credit-cards/\(cardId)/payment_ccs"
    fetchData(from: urlString, completion: completion)
}

func getPaymentsForCreditCards(_ cards: [CreditCard], completion: @escaping ([PaymentCC]?, String?) -> Void) {
    var allPayments: [PaymentCC] = []
    let group = DispatchGroup()

    for card in cards {
        group.enter()
        getCreditCardPaymentTDC(cardId: card.id ?? 0) { payments, error in
            if let payments = payments {
                allPayments.append(contentsOf: payments)
            } else {
                completion(nil, error ?? "Error al obtener los pagos de tarjeta de crédito")
            }
            group.leave()
        }
    }

    group.notify(queue: .main) {
        completion(allPayments, nil)
    }
}
