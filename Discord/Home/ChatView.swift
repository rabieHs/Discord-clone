//
//  ChatView.swift
//  Discord
//
//  Created by Apple on 26/01/2025.
//

import SwiftUI

struct Message: Identifiable{
    let id:String
    let message: String
    let imageURL : String
    let createdAt: Date
    let username:String
}
struct ChatView: View {
    
    @Binding var showSideMenu:Bool
  
    
    var body: some View {
        VStack(spacing:0){
            HStack{
                Button {
                    withAnimation {
                        showSideMenu = true
                    }
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                        .foregroundStyle(.white)
                }
                
                Image(systemName: "number")
                Text("genral")
                    .bold()
                    .font(.callout)
                Spacer()
                Image(systemName: "person.2.fill")

            }
            .padding()
            .padding(.top,32)
            .background{
                Color(uiColor: .systemGray6)
            }
            
            
            ChatRoomView()
                .padding(.bottom,42)
         
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        
            .preferredColorScheme(.dark)
            .background{
                Color(.background)
            }
            .ignoresSafeArea()

            
    }
    
}

#Preview {
    ChatView(showSideMenu: .constant(false))
}
