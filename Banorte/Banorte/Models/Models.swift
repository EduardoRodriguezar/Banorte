//
//  Clients.swift
//  laravel-conexion
//
//  Created by Angel Escalante Garza on 21/02/25.
//

import Foundation

struct Client: Identifiable, Codable {
    var id: Int?           
    var name: String
    var createdBy: Int?
    var createdAt: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case createdBy = "created_by"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct User: Identifiable, Codable {
    var id: Int?
    var clientId: Int
    var name: String
    var email: String?
    var password: String?
    var emailVerifiedAt: String?
    var rememberToken: String?
    var createdAt: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case clientId = "client_id"
        case name
        case email
        case password
        case emailVerifiedAt = "email_verified_at"
        case rememberToken = "remember_token"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct Account: Identifiable, Codable {
    var id: Int?
    var clientId: Int
    var accountNumber: Int?
    var balance: Float
    var createdBy: Int?
    var deletedAt: String?
    var createdAt: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case clientId = "client_id"
        case accountNumber = "account_number"
        case balance
        case createdBy = "created_by"
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct Movement: Identifiable, Codable {
    var id: Int?
    var accountId: Int
    var amount: Float
    var separateName: String
    var paymentDate: String?
    var createdBy: Int?
    var deletedAt: String?
    var createdAt: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case accountId = "account_id"
        case separateName = "separate_name"
        case amount
        case paymentDate = "payment_date"
        case createdBy = "created_by"
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct CreditCard: Identifiable, Codable {
    var id: Int?
    var clientId: Int
    var cardNumber: String?
    var expirationDate: String?
    var creditLimit: Double?
    var createdBy: Int?
    var deletedAt: String?
    var createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case clientId = "client_id"
        case cardNumber = "card_number"
        case creditLimit = "credit_limit"
        case expirationDate = "expiration_date"
        case createdBy = "created_by"
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct ExternalTransfer: Identifiable, Codable {
    var id: Int?
    var accountId: Int
    var amount: Double
    var reason: String
    var receptorAccount: String
    var receivingBank: String
    var movementDate: String?
    var createdBy: Int?
    var deletedAt: String?
    var createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case accountId = "account_id"
        case amount
        case reason
        case receptorAccount = "receptor_account"
        case receivingBank = "receiving_bank"
        case movementDate = "movement_date"
        case createdBy = "created_by"
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct InternalTransfer: Identifiable, Codable {
    var id: Int?
    var accountId: Int
    var amount: Double
    var receptorAccount: String
    var movementDate: String?
    var createdBy: Int?
    var deletedAt: String?
    var createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case accountId = "account_id"
        case amount
        case receptorAccount = "receptor_account"
        case movementDate = "movement_date"
        case createdBy = "created_by"
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct InvestmentMovement: Identifiable, Codable {
    var id: Int?
    var accountId: Int
    var amount: Double
    var inversionType: String
    var paymentDate: String?
    var createdBy: Int?
    var deletedAt: String?
    var createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case accountId = "account_id"
        case amount
        case inversionType = "inversion_type"
        case paymentDate = "payment_date"
        case createdBy = "created_by"
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct PaymentService: Identifiable, Codable {
    var id: Int?
    var accountId: Int
    var amount: Double
    var serviceCategory: String
    var destinationCompany: String
    var isDomiciled: Int?
    var paymentDate: String?
    var createdBy: Int?
    var deletedAt: String?
    var createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case accountId = "account_id"
        case amount
        case serviceCategory = "service_category"
        case destinationCompany = "destination_company"
        case isDomiciled = "is_domiciled"
        case paymentDate = "payment_date"
        case createdBy = "created_by"
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

}

struct PaymentCC: Identifiable, Codable {
    var id: Int?
    var cardId: Int
    var minimumPaymentAmount: Double?
    var interestFreeAmount: Double?
    var totalAmount: Double
    var cutOffDate: String?
    var paymentDate: String?
    var movementDate: String?
    var createdBy: Int?
    var deletedAt: String?
    var createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case cardId = "card_id"
        case minimumPaymentAmount = "minimum_payment_amount"
        case interestFreeAmount = "interest_free_amount"
        case totalAmount = "total_amount"
        case cutOffDate = "cut_off_date"
        case paymentDate = "payment_date"
        case movementDate = "movement_date"
        case createdBy = "created_by"
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
