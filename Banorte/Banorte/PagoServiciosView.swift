import SwiftUI

struct PagosServiciosView: View {
    let servicio: Servicio  // Servicio seleccionado
    
    @State private var numeroContrato: String = ""
    @State private var cantidadPagar: String = ""
    @State private var informacionContrato: String = ""
    @State private var tarjetaSeleccionada: String = "Credito 0305"
    @State private var guardarHabilitado: Bool = false
    let tarjetas = ["Credito 0305", "Debito 1234", "Credito 5678"]
    
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
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Servicio seleccionado")
                    .font(.subheadline)
                HStack {
                    Image(systemName: "bolt.fill")
                        .foregroundColor(.green)
                    Text(servicio.nombre) // Se usa el nombre del servicio seleccionado
                        .bold()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                
                Text("Número de contrato")
                    .font(.subheadline)
                TextField("Ingrese su número de contrato", text: $numeroContrato)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Text("Información del contrato")
                    .font(.subheadline)
                TextField("Ingrese información adicional", text: $informacionContrato)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Text("Cantidad a pagar")
                    .font(.subheadline)
                TextField("Ingrese la cantidad a pagar", text: $cantidadPagar)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Text("Tarjeta seleccionada")
                    .font(.subheadline)
                Picker("Tarjeta", selection: $tarjetaSeleccionada) {
                    ForEach(tarjetas, id: \.self) { tarjeta in
                        Text(tarjeta)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                
                Toggle(isOn: $guardarHabilitado) {
                    Text("Guardar servicio")
                        .bold()
                }
                .toggleStyle(SwitchToggleStyle(tint: .green))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2)
                )
                .cornerRadius(10)
                
                NavigationLink(destination: TicketSView(tarjeta: tarjetaSeleccionada, numeroContrato: numeroContrato, cantidadPagada: cantidadPagar)) {
                    Text("Pagar")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct PagosServiciosView_Previews: PreviewProvider {
    static var previews: some View {
        PagosServiciosView(servicio: Servicio(nombre: "CFE", convenio: "12345")) // Prueba con un servicio
    }
}
