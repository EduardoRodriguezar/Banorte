import SwiftUI

struct DashBoardView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        NavigationLink(destination: PerfilView()) {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.white)
                                            }
                        Spacer()
                        Text("Hola, Eduardo")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                        NavigationLink(destination: NotificacionesView()) {
                                Image(systemName: "bell.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                            }
                    }
                    .padding()
                    Text("Último Ingreso: 2025-02-06 8:00:00 vía Móvil")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(Color.red)
                
                Spacer()

                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Mis cuentas")
                            .font(.headline).padding(.horizontal)
                        Spacer()
                        TarjetasView()
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Mis Tarjetas")
                            .font(.headline)
                        
                        Spacer()

                        VStack {
                            HStack {
                                Text("Tarjeta de Crédito").bold()
                                Spacer()
                                Text("Saldo a pagar $4,000").bold()
                            }
                            .padding(.bottom, 5)
                            
                            HStack {
                                NavigationLink(destination: PagarView()) {
                                    BarraIcono(icono: "dollarsign.circle", texto: "Pagar")
                                }
                                NavigationLink(destination: FechasView()) {
                                    BarraIcono(icono: "calendar", texto: "Fechas")
                                }
                                NavigationLink(destination: LimiteView()) {
                                    BarraIcono(icono: "chart.bar", texto: "Límite")
                                }
                                NavigationLink(destination: DiferirView()) {
                                    BarraIcono(icono: "arrow.right", texto: "Diferir")
                                }
                            }
                        }
                        .padding()
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    NavigationLink(destination: BeneficiosView()) {
                        Text("Beneficios de mis tarjetas\nPromociones, puntos y más...")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    NavigationLink(destination: ContratarView()) {
                        Text("Contrata aquí\nTarjeta de crédito, pagarés y más...")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 10)
                
                Spacer()

                HStack {
                    Spacer()
                    NavigationLink(destination: MayaView()) {
                            Image(systemName: "message")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .clipShape(Circle())
                        }
                    .padding(.bottom, 20)
                    .padding(.trailing, 20)
                }
                
                HStack {
                    NavigationLink(destination: SucursalView()) {
                        BarraIcono(icono: "map", texto: "Sucursal")
                    }
                    NavigationLink(destination: ServiciosView()) {
                        BarraIcono(icono: "doc.text", texto: "Servicios")
                    }
                    NavigationLink(destination: TokenView()) {
                        BarraIcono(icono: "key", texto: "Token")
                    }
                    NavigationLink(destination: AjustesView()) {
                        BarraIcono(icono: "gear", texto: "Ajustes")
                    }
                    NavigationLink( destination: AyudaView()) {
                        BarraIcono(icono: "questionmark.circle", texto: "Ayuda")
                    }
                }
                .padding()
                .background(Color.white)
                .shadow(radius: 5)
            }
            .navigationBarHidden(true)
        }
    }
}

struct BarraIcono: View {
    let icono: String
    let texto: String
    
    var body: some View {
        VStack {
            Image(systemName: icono)
                .foregroundColor(.black)
            Text(texto)
                .font(.footnote)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    let authViewModel = AuthViewModel(accountsModel: AccountsModel()) // Crear una instancia de AuthViewModel
    return DashBoardView()
        .environmentObject(authViewModel) // Inyectar AuthViewModel en el entorno
}
