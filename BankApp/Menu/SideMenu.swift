import SwiftUI

import SwiftUI

struct SideMenu: View {
    @EnvironmentObject var authModel: AuthViewModel
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            if isShowing {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isShowing = false
                        }
                    }
                
                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        UserHeaderView()
                        
                        ScrollView {
                            VStack(alignment: .leading, spacing: 25) {
                                MenuRow(icon: "house", title: "Ana Sayfa", isSelected: true)
                                MenuRow(icon: "creditcard", title: "Hesaplarım")
                                MenuRow(icon: "creditcard.fill", title: "Kartlarım")
                                MenuRow(icon: "arrow.left.arrow.right", title: "Para Transferleri")
                                MenuRow(icon: "chart.line.uptrend.xyaxis", title: "Yatırımlar")
                                MenuRow(icon: "cart", title: "Ödemeler")
                                MenuRow(icon: "banknote", title: "Krediler")
                            }
                            .padding()
                        }
                        
                        Spacer()
                        
                        HStack {
                            Label("Ayarlarım", systemImage: "gearshape")
                            Spacer()
                            
                            Button{
                                authModel.signout()
                                
                            }label: {
                                Label("Çıkış", systemImage: "power")
                                    .foregroundColor(.red)
                            }
                            
                            
                            
                           
                        }
                        .padding()
                        .padding(.bottom, 30)
                    }
                    .frame(width: 300)
                    .background(Color.white)
                    .transition(.move(edge: .leading))
                    
                    Spacer()
                }
            }
        }
    }
}

struct UserHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.2.fill")
                    .foregroundColor(.blue)
                    .padding(10)
                    .background(Color.blue.opacity(0.1))
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text("Kazandıran Davet")
                        .fontWeight(.bold)
                    Text("Yılda 72 bin TL fırsatı...")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        }
        .padding(.top, 60)
        .padding(.horizontal)
    }
}

struct MenuRow: View {
    let icon: String
    let title: String
    var isSelected: Bool = false
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .foregroundColor(isSelected ? .blue : .gray)
                .frame(width: 25)
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 16, weight: isSelected ? .semibold : .regular))
            Spacer()
        }
    }
}
#Preview {
    SideMenu(isShowing: .constant(true))
}
