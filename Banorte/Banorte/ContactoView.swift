import SwiftUI

struct ContactoView: View {
    @State private var numeroCuenta: String = ""
    @State private var nombreTitular: String = ""
    @State private var banco: String = ""
    @State private var alias: String = ""

    var body: some View {
        VStack {
            // HEADER
            HStack {
                Image(systemName: "person.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
                Text("TRANSFERENCIA")
                    .font(.title2)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                Image(systemName: "bell.fill")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.red)
            
            // CAMPO DE NÚMERO DE CUENTA
            VStack(alignment: .leading) {
                Text("Digite número de cuenta")
                    .font(.headline)
                    .foregroundColor(.black)
                TextField("------", text: $numeroCuenta)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            // ZStack para fondo rojo con picos
            ZStack {
                // Triángulo izquierdo
                Triangle()
                    .fill(Color.red)
                    .frame(width: 80, height: 40)
                    .rotationEffect(.degrees(180))
                    .offset(x: -90, y: -20)
                
                // Triángulo derecho
                Triangle()
                    .fill(Color.red)
                    .frame(width: 80, height: 40)
                    .rotationEffect(.degrees(180))
                    .offset(x: 90, y: -20)
                
                // SECCIÓN INFORMACIÓN DE LA CUENTA
                VStack {
                    Text("Información de la cuenta")
                        .font(.headline)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.top, 10)
                    
                    // Campos dentro de una columna
                    VStack {
                        CustomTextField(placeholder: "Nombre del titular", text: $nombreTitular)
                        CustomTextField(placeholder: "Banco", text: $banco)
                        CustomTextField(placeholder: "Alias", text: $alias)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                }
                .padding()
                .background(Color.red)
                .cornerRadius(10)
            }
            .padding(.horizontal)

            // BOTÓN GUARDAR
            Button(action: {}) {
                Text("Guardar")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
    }
}

// COMPONENTE PARA DIBUJAR UN TRIÁNGULO
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY)) // Punto superior
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY)) // Esquina inferior izquierda
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Esquina inferior derecha
        path.closeSubpath()
        return path
    }
}

// COMPONENTE REUTILIZABLE PARA LOS CAMPOS DE TEXTO
struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}

struct InformacionCuentaView_Previews: PreviewProvider {
    static var previews: some View {
        ContactoView()
    }
}
