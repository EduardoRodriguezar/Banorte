import SwiftUI

class ServiciosViewModel: ObservableObject {
    @Published var searchText: String = ""
    
    // Simulación de base de datos de servicios disponibles
    let serviciosDisponibles: [Servicio] = [
        Servicio(nombre: "CFE", convenio: "12345"),
        Servicio(nombre: "Telmex", convenio: "67890"),
        Servicio(nombre: "Agua", convenio: "11223"),
        Servicio(nombre: "Gas Natural", convenio: "44556"),
        Servicio(nombre: "IZZI", convenio: "77889")
    ]
    
    // Filtrar servicios según lo que escriba el usuario
    var filteredServicios: [Servicio] {
        if searchText.isEmpty {
            return []
        } else {
            return serviciosDisponibles.filter {
                $0.nombre.lowercased().contains(searchText.lowercased()) ||
                $0.convenio.contains(searchText)
            }
        }
    }
}

struct Servicio: Identifiable {
    let id = UUID()
    let nombre: String
    let convenio: String
}
