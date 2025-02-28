//
//  BanorteApp.swift
//  Banorte
//
//  Created by Eduardo Rodriguez on 13/02/25.
//
import SwiftUI
import MapKit

struct InicioView: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 25.6866, longitude: -100.3161),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    var body: some View {
        NavigationStack {

        ZStack {
            VStack(spacing: 0) {
                ZStack {
                    Color.red
                        .frame(height: UIScreen.main.bounds.height * 0.14)
                        .edgesIgnoringSafeArea(.top)
                    
                    Image("banorte_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height * 0.07)
                        .offset(y: -10)
                }
                
                ZStack {
                    Image("banorte_news")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.27)
                        .clipped()
                        .offset(y: -20)
                                        
                    HStack {
                        VStack(alignment: .leading) {
                            BotonFlotante(icono: "bell.fill", destination: AnyView(NotificacionesView()))
                            BotonFlotante(icono: "dollarsign.arrow.circlepath", destination: AnyView(CambiosView()))
                            BotonFlotante(icono: "bubble.fill", destination: AnyView(MayaView()))
                        }
                        .padding(.leading)
                        Spacer()
                    }
                }
                
                VStack {
                    Text("Hola, Eduardo")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("¿Qué vamos a hacer?")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray5))
                
                HStack {
                    NavigationLink(destination: LlamadasView())
                    {
                        BotonAccion(icono: "phone.fill", texto: "Llamadas", color: .orange)
                    }
                    NavigationLink(destination: AyudaView())
                    {
                        BotonAccion(icono: "lightbulb.fill", texto: "Conocer", color: .yellow)
                    }
                    NavigationLink(destination: CorreoView())
                    {
                        BotonAccion(icono: "envelope.fill", texto: "Correo", color: .green)
                    }
                }
                .padding(.top, 10)
                
                // Mapa
                Map(position: $position)
                    .frame(height: UIScreen.main.bounds.height * 0.25)
                    .cornerRadius(15)
                    .padding(.horizontal)
                
                Spacer()
                
                HStack {
                    NavigationLink(destination: LoginView())
                    { // Enlazamos a LoginView
                    BarraIcono(icono: "person.fill", texto: "Cuentas")
                    }
                    NavigationLink(destination: RetirarView())
                    {
                    BarraIcono(icono: "dollarsign.circle", texto: "Retirar")
                    }
                    NavigationLink(destination: TokenView())
                    {
                        BarraIcono(icono: "key.fill", texto: "Token")
                    }
                    NavigationLink(destination: DigitalView())
                    {
                        BarraIcono(icono: "creditcard", texto: "Digital")
                    }
                    NavigationLink(destination: MigrarView())
                    {
                        BarraIcono(icono: "arrow.2.circlepath", texto: "Migrar")
                    }
                }
                .frame(height: 70)
                .background(Color(.systemGray6))
                .padding(.bottom, 10)
            }
        }
    }
}

struct BotonAccion: View {
    var icono: String
    var texto: String
    var color: Color
    
    var body: some View {
        VStack {
            Image(systemName: icono)
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .background(color)
                .clipShape(Circle())
            
            Text(texto)
                .font(.footnote)
                .foregroundColor(.black)
        }
    }
}

struct BarraIcono: View {
    var icono: String
    var texto: String
    
    var body: some View {
        VStack {
            Image(systemName: icono)
                .font(.title3)
                .foregroundColor(.black)
            
            Text(texto)
                .font(.footnote)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
    }
}

    struct BotonFlotante: View {
        var icono: String
        var destination: AnyView

        var body: some View {
            NavigationLink(destination: destination) {
                Image(systemName: icono)
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.red)
                    .clipShape(Circle())
                    .shadow(radius: 4)
            }
            .padding(.bottom, 12)
            .navigationBarHidden(true)
        }
        
    }
}

#Preview {
    InicioView()
}
