//
//  ChatRoomView.swift
//  Discord
//
//  Created by Apple on 27/01/2025.
//

import SwiftUI

struct ChatRoomView: View {
    @State private var messageText = ""

    
    var mockMessages = [
        Message(id:"1",message: "hello", imageURL: "profile",createdAt: .now,username: "rabi11e"),
        Message(id:"2",message: "how are you", imageURL: "profile",createdAt: .now,username: "rabie"),
        Message(id:"3",message: "fine", imageURL: "profile",createdAt: .now,username: "rabie hoss"),
        Message(id:"4",message: "good", imageURL: "profile",createdAt: .now,username: "rabie houssainiee"),
    ]
    var body: some View {
        VStack(alignment:.leading){
            ScrollView {
                VStack{
                    VStack(alignment:.leading) {
                        Image(systemName: "number")
                            .imageScale(.large)
                            .padding()
                            .background {
                                Circle()
                                    .fill( Color(uiColor: .systemGray3))
                            }
                          
                            .padding(.bottom,24)
                        Text("Welcome To  General")
                            .font(.title2)
                            .bold()
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)

                    .padding()
                    
                    
                    LazyVStack{
                        ForEach(mockMessages){message in
                            HStack(alignment:.top){
                                Image(message.imageURL)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:48,height: 48)
                                    .clipShape(Circle())
                                VStack(alignment:.leading){
                                    HStack{
                                        Text(message.username)
                                            .bold()
                                        Text(message.createdAt.formatted())
                                            .font(.caption)
                                    }
                                    Text(message.message)
                                }
                                    
                                    
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.horizontal)
                            .padding(.bottom,8)

                          

                        }
                    }
                }
          
                 
            }
            Divider()
                .overlay {
                    Color.black
                }
            HStack{
                TextField("Message #general", text: $messageText)
                    .padding()
                    .background {
                        Capsule()
                            .fill(
                                Color(uiColor: .systemGray6)
                            )
                    }
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32)
                        .background {
                            Circle()
                                .fill(.gray)
                        }
                        .foregroundStyle(Color(uiColor: .systemGray6))
                    
                }
                .frame(height: 70)

            }
            .padding(.horizontal,8)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .leading)    }
}

#Preview {
    ChatRoomView()
}
