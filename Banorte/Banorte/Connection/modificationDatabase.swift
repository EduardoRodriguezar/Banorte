//
//  modificationDatabase.swift
//  laravel-conexion
//
//  Created by Angel Escalante Garza on 22/02/25.
//

import Foundation

// MARK: - Función genérica para operaciones de creación, actualización y eliminación
func sendRequest<T: Codable>(
    endpoint: String,
    method: String,
    body: T? = nil,
    completion: @escaping (Bool, String?) -> Void
) {
    // Construye la URL base
    let baseURL = "http://localhost:8000/api"
    guard let url = URL(string: baseURL + endpoint) else {
        completion(false, "URL inválida")
        return
    }

    // Configura la solicitud
    var request = URLRequest(url: url)
    request.httpMethod = method
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    // Codifica el cuerpo de la solicitud si existe
    if let body = body {
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            let data = try encoder.encode(body)
            request.httpBody = data
        } catch {
            completion(false, "Error al codificar los datos")
            return
        }
    }

    // Realiza la solicitud
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        // Maneja errores de red
        if let error = error {
            completion(false, error.localizedDescription)
            return
        }

        // Verifica el código de estado HTTP
        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode == 200 || httpResponse.statusCode == 201 {
                completion(true, nil)
            } else {
                completion(false, "Error en la solicitud: Código \(httpResponse.statusCode)")
            }
        } else {
            completion(false, "Respuesta inválida del servidor")
        }
    }
    task.resume()
}

// Crear un cliente
func createClient(client: Client, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/clients", method: "POST", body: client, completion: completion)
}

// Actualizar un cliente
func updateClient(clientId: Int, client: Client, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/clients/\(clientId)", method: "PUT", body: client, completion: completion)
}

// Eliminar un cliente
func deleteClient(clientId: Int, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/clients/\(clientId)", method: "DELETE", body: nil as Client?, completion: completion)
}

// Crear una cuenta
func createAccount(account: Account, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/accounts", method: "POST", body: account, completion: completion)
}

// Actualizar una cuenta
func updateAccount(accountId: Int, account: Account, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/accounts/\(accountId)", method: "PUT", body: account, completion: completion)
}

// Eliminar una cuenta
func deleteAccount(accountId: Int, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/accounts/\(accountId)", method: "DELETE",body: nil as Account?, completion: completion)
}

// Crear una tarjeta de crédito
func createCreditCard(card: CreditCard, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/credit-cards", method: "POST", body: card, completion: completion)
}

// Actualizar una tarjeta de crédito
func updateCreditCard(cardId: Int, card: CreditCard, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/credit-cards/\(cardId)", method: "PUT", body: card, completion: completion)
}

// Eliminar una tarjeta de crédito
func deleteCreditCard(cardId: Int, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/credit-cards/\(cardId)", method: "DELETE", body: nil as CreditCard?,completion: completion)
}

// Crear una transferencia externa
func createExternalTransfer(transfer: ExternalTransfer, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/external-transfers", method: "POST", body: transfer, completion: completion)
}

// Actualizar una transferencia externa
func updateExternalTransfer(transferId: Int, transfer: ExternalTransfer, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/external-transfers/\(transferId)", method: "PUT", body: transfer, completion: completion)
}

// Eliminar una transferencia externa
func deleteExternalTransfer(transferId: Int, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/external-transfers/\(transferId)", method: "DELETE",body: nil as ExternalTransfer?, completion: completion)
}

func createInternalTransfer(transfer: InternalTransfer, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/internal-transfers", method: "POST", body: transfer, completion: completion)
}

func updateInternalTransfer(transferId: Int, transfer: InternalTransfer, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/internal-transfers/\(transferId)", method: "PUT", body: transfer, completion: completion)
}

func deleteInternalTransfer(transferId: Int, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/internal-transfers/\(transferId)", method: "DELETE", body: nil as InternalTransfer?, completion: completion)
}

// Crear un movimiento de inversión
func createInvestmentMovement(movement: InvestmentMovement, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/investment-movements", method: "POST", body: movement, completion: completion)
}

// Actualizar un movimiento de inversión
func updateInvestmentMovement(movementId: Int, movement: InvestmentMovement, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/investment-movements/\(movementId)", method: "PUT", body: movement, completion: completion)
}

// Eliminar un movimiento de inversión
func deleteInvestmentMovement(movementId: Int, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/investment-movements/\(movementId)", method: "DELETE",body: nil as InvestmentMovement?, completion: completion)
}

// Crear un pago de servicio
func createPaymentService(payment: PaymentService, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/payment-services", method: "POST", body: payment, completion: completion)
}

// Actualizar un pago de servicio
func updatePaymentService(paymentId: Int, payment: PaymentService, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/payment-services/\(paymentId)", method: "PUT", body: payment, completion: completion)
}

// Eliminar un pago de servicio
func deletePaymentService(paymentId: Int, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/payment-services/\(paymentId)", method: "DELETE",body: nil as PaymentService?, completion: completion)
}

// Crear un pago CC
func createPaymentCC(payment: PaymentCC, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/credit-cards/\(payment.cardId)/payment_ccs", method: "POST", body: payment, completion: completion)
}

// Actualizar un pago CC
func updatePaymentCC(paymentId: Int, cardId: Int, payment: PaymentCC, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/credit-cards/\(cardId)/payment_ccs/\(paymentId)", method: "PUT", body: payment, completion: completion)
}

// Eliminar un pago CC
func deletePaymentCC(paymentId: Int, cardId: Int, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/payment_ccs/\(paymentId)", method: "DELETE",body: nil as PaymentCC?, completion: completion)
}

// Crear un movimiento
func createMovement(movement: Movement, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/separate-movements", method: "POST", body: movement, completion: completion)
}

// Actualizar un movimiento
func updateMovement(movementId: Int, movement: Movement, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/separate-movements/\(movementId)", method: "PUT", body: movement, completion: completion)
}

// Eliminar un movimiento
func deleteMovement(movementId: Int, completion: @escaping (Bool, String?) -> Void) {
    sendRequest(endpoint: "/separate-movements/\(movementId)", method: "DELETE", body: nil as Movement?, completion: completion)
}
