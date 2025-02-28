//
//  MayaView.swift
//  Banorte
//
//  Created by Eduardo Rodriguez on 20/02/25.
//

import SwiftUI

struct MayaView: View {
    @State private var userInput: String = ""
    @State private var messages: [(String, Bool)] = [] // (Mensaje, esUsuario)

    let botResponses: [String: String] = [
        "hola": "¡Hola Lalo! Soy Maya, tu asistente de Banorte. ¿En qué puedo ayudarte?",
        "cuenta": "Puedes consultar tu saldo y movimientos en la app de Banorte.",
        "tarjeta bloqueada": "Si tu tarjeta está bloqueada, puedes desbloquearla en la app o llamando al soporte.",
        "transferencia": "Puedes realizar transferencias desde la app de Banorte de manera rápida y segura.",
        "horario sucursal": "Las sucursales de Banorte operan en horario de 9 AM a 5 PM, de lunes a viernes.",
        "contacto": "Puedes comunicarte con soporte al 55-1234-5678 o desde la app.",
        "adios": "¡Gracias por usar Maya, Lalo! Que tengas un excelente día. 😊",
        "default": "No entiendo esa pregunta, pero puedo intentarlo. ¡Intenta escribirlo de otra manera! 🤖"
    ]

    func getBotResponse(for message: String) -> String {
        let lowerMessage = message.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        return botResponses[lowerMessage] ?? botResponses["default"]!
    }

    func sendMessage() {
        guard !userInput.isEmpty else { return }
        
        let userMessage = userInput
        messages.append((userMessage, true)) // Mensaje del usuario

        let botReply = getBotResponse(for: userMessage)
        messages.append((botReply, false)) // Respuesta del bot

        userInput = "" // Limpiar input
    }

    var body: some View {
        VStack {
            Text("Maya - Asistente Banorte")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)

            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(messages, id: \ .0) { message, isUser in
                        HStack {
                            if isUser { Spacer() }
                            Text(message)
                                .padding()
                                .background(isUser ? Color.red : Color.gray.opacity(0.2)) // Rojo Banorte
                                .cornerRadius(10)
                                .foregroundColor(isUser ? .white : .black)
                            if !isUser { Spacer() }
                        }
                    }
                }
                .padding()
            }

            HStack {
                TextField("Escribe un mensaje...", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(maxWidth: .infinity)

                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .clipShape(Circle())
                }
                .padding()
            }
            .padding()
        }
        .background(Color.white)
    }
}

struct MayaView_Previews: PreviewProvider {
    static var previews: some View {
        MayaView()
    }
}
