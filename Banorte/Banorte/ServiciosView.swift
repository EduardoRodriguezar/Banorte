//
//  PruebaView.swift
//  banorte
//
//  Created by Alumno on 19/02/25.
//

import SwiftUI

struct ServiciosView: View {
    @StateObject private var viewModel = ServiciosViewModel()
    @State private var pagos: [Pago] = [
            Pago(nombre: "CFE", usuario: "Edson Leyva", monto: "$100", fecha: "01/01/2026"),
            Pago(nombre: "CFE", usuario: "Edson Leyva", monto: "$200", fecha: "02/01/2026"),
            Pago(nombre: "CFE", usuario: "Edson Leyva", monto: "$300", fecha: "03/01/2026")
        ]
    @State private var S_Guardados: [S_Guardado] = [
            S_Guardado(nombre: "IZZI", usuario: "Edson Leyva", monto: "$100", fecha: "01/01/2026"),
            S_Guardado(nombre: "CFE", usuario: "Edson Leyva", monto: "$200", fecha: "02/01/2026"),
            S_Guardado(nombre: "CFE", usuario: "Edson Leyva", monto: "$300", fecha: "03/01/2026")
        ]
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HStack {
                    Image(systemName: "person.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Spacer()
                    Text("PAGO DE SERVICIOS")
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
                
                // Barra de búsqueda
                TextField("Buscar servicio...", text: $viewModel.searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                // Lista de resultados de búsqueda
                List(viewModel.filteredServicios) { servicio in
                    NavigationLink(destination: PagosServiciosView(servicio: servicio)) { // Se envía el servicio seleccionado
                        VStack(alignment: .leading) {
                            Text(servicio.nombre).bold()
                            Text("Convenio: \(servicio.convenio)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                //lista de pagos programados
                VStack {
                    Text("Pagos programados").font(.headline)
                    
                    ForEach(pagos.prefix(2)) { pago in
                        NavigationLink(destination: PagoDetalleView()) {
                            PagoItem(nombre: pago.nombre, usuario: pago.usuario, monto: pago.monto, fecha: pago.fecha)
                        }
                    }
                    
                    if pagos.count > 2 {
                        NavigationLink(destination: PagosCompletoView(pagos: pagos)) {
                            Text("Ver más").font(.footnote).foregroundColor(.yellow)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()
                
                //lista de Servicios Guardados
                VStack {
                    Text("Servicios Guardados").font(.headline)
                    
                    ForEach(S_Guardados.prefix(2)) { S_Guardado in
                        NavigationLink(destination: S_GuardadoDetalleView()) {
                            S_GuardadoItem(nombre: S_Guardado.nombre, usuario: S_Guardado.usuario, monto: S_Guardado.monto, fecha: S_Guardado.fecha)
                        }
                    }
                    
                    if S_Guardados.count > 2 {
                        NavigationLink(destination: S_GuardadosView(S_Guardados: S_Guardados)) {
                            Text("Ver más").font(.footnote).foregroundColor(.yellow)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()
                Spacer()
                
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ServiciosView()
}

//-------------Pagos Programados-----------------
struct Pago: Identifiable {
    let id = UUID()
    let nombre: String
    let usuario: String
    let monto: String?
    let fecha: String?
}

struct PagosCompletoView: View {
    let pagos: [Pago]
    
    var body: some View {
        List(pagos) { pago in
            NavigationLink(destination: PagoDetalleView()) {
                PagoItem(nombre: pago.nombre, usuario: pago.usuario, monto: pago.monto, fecha: pago.fecha)
            }
        }
        .navigationTitle("Pagos Completos")
    }
}

struct PagoItem: View {
    let nombre: String
    let usuario: String
    let monto: String?
    let fecha: String?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(nombre).bold()
                Text(usuario).font(.subheadline).foregroundColor(.gray)
            }
            Spacer()
            if let monto = monto, let fecha = fecha {
                VStack(alignment: .trailing) {
                    Text(monto).bold()
                    Text(fecha).font(.subheadline).foregroundColor(.gray)
                }
            }
        }
        .padding()
    }
}
//--------------------------------------

struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Buscar servicio", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

//-------------Guardado-----------------

struct S_Guardado: Identifiable {
    let id = UUID()
    let nombre: String
    let usuario: String
    let monto: String?
    let fecha: String?
}

struct S_GuardadosView: View {
    let S_Guardados: [S_Guardado]
    
    var body: some View {
        List(S_Guardados) { S_Guardado in
            NavigationLink(destination: S_GuardadoDetalleView()) {
                S_GuardadoItem(nombre: S_Guardado.nombre, usuario: S_Guardado.usuario, monto: S_Guardado.monto, fecha: S_Guardado.fecha)
            }
        }
        .navigationTitle("Servicios Guardados")
    }
}

struct S_GuardadoItem: View {
    let nombre: String
    let usuario: String
    let monto: String?
    let fecha: String?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(nombre).bold()
                Text(usuario).font(.subheadline).foregroundColor(.gray)
            }
            Spacer()
            if let monto = monto, let fecha = fecha {
                VStack(alignment: .trailing) {
                    Text(monto).bold()
                    Text(fecha).font(.subheadline).foregroundColor(.gray)
                }
            }
        }
        .padding()
    }
}
//----------------------------------
