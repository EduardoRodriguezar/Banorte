import SwiftUI
import UIKit

struct TicketSView: View {
    let tarjeta: String
    let numeroContrato: String
    let cantidadPagada: String
    let fechaPago: String = "01/ENERO/2026"
    let horaPago: String = "01:01:01"
    let folio: String = "98247R8237429"
    
    var body: some View {
        VStack {
            // Encabezado
            HStack {
                Image(systemName: "person.circle")
                    .font(.largeTitle)
                Spacer()
                Text("PAGO DE SERVICIOS")
                    .font(.headline)
                    .bold()
                Spacer()
                Image(systemName: "bell")
                    .font(.title2)
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            
            Spacer()
            
            VStack(alignment: .center, spacing: 15) {
                Text("PAGO COMPLETADO")
                    .font(.title3)
                    .bold()
                    .padding(.top)
                
                HStack {
                    VStack{
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Text(tarjeta)
                            .padding(.top)
                    }
                    .padding()
                    Spacer()
                    Image(systemName: "arrowshape.forward.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                    Spacer()
                    VStack{
                        Image(systemName: "phone.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Text(numeroContrato)
                            .padding(.top)
                    }
                    .padding()
                    
                    
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                
                Text("CANTIDAD ABONADA")
                    .font(.subheadline)
                Text("$\(cantidadPagada)")
                    .font(.title)
                    .bold()
                
                Text(fechaPago)
                    .font(.subheadline)
                Text(horaPago)
                    .font(.subheadline)
                
                Text("FOLIO")
                    .font(.subheadline)
                Text(folio)
                    .bold()
                    .foregroundColor(.gray)
                
                Button(action: {
                    // Acción para cerrar la vista
                }) {
                    Text("Cerrar")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            .padding()
            
            Spacer()
            
            // Barra de navegación inferior
            
        }
    }
}

struct TicketSView_Previews: PreviewProvider {
    static var previews: some View {
        TicketSView(tarjeta: "Credito 0305", numeroContrato: "084028499", cantidadPagada: "250")
    }
}
