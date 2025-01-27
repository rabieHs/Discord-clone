//
//  MenuView.swift
//  Discord
//
//  Created by Apple on 27/01/2025.
//

import SwiftUI

struct Server: Identifiable{
    var id: Int?
    let createdAt:Date
    let name:String
    
}
struct Channel: Identifiable, Equatable{
    var id: Int?
    let createdAt:Date
    let name:String
    
}

struct MenuView: View {
    
    var mockServers = [
        Server(id: 1, createdAt: .now, name: "iOS"),
        Server(id: 2, createdAt: .now, name: "OpenAI"),
        Server(id: 3, createdAt: .now, name: "SwifDevelopers")
    ]
    
    var mockChannels = [
        Channel(id: 1, createdAt: .now, name: "general"),
        Channel(id: 2, createdAt: .now, name: "ask?"),
        Channel(id: 3, createdAt: .now, name: "community"),
        Channel(id: 4, createdAt: .now, name: "live-podcats")
    ]
    
    @State var selectedChannel:Channel?
    @State var showChannels : Bool = true
    
    
    var body: some View {
        HStack(spacing:0){
            ScrollView {
                VStack{
                    ForEach(mockServers) { server in
                        Text(server.name.prefix(1))
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical,8)
                            .background{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.discord)
                            }
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24)
                            .foregroundStyle(.green)
                            .padding(16)
                            .background{
                                Circle()
                                    .fill(.ultraThinMaterial)
                                
                            }
                    }
                    
                    
                

                        
                    
                }
              
            }  .frame(width: 60)
                .frame(maxHeight: .infinity,alignment: .topLeading)
                .padding(8)
                .background(.ultraThickMaterial)
            
            VStack(alignment:.leading){
                HStack{
                    Text("hello")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Image(systemName: "ellipsis")
                        .fontWeight(.heavy)
                    
                }
                .padding(.bottom,24)
                .padding(.trailing)
                
                Button {
                    withAnimation {
                        showChannels.toggle()
                    }
                } label: {
                    HStack(spacing:0){
                        Image(systemName: showChannels ?  "chevron.down": "chevron.right")
                            .frame(width: 24)
                        
                        Text("Text Channels")
                            .textCase(.uppercase)
                            .font(.caption)
                            .bold()
                    }
                }
                .foregroundStyle(.gray)
                
                if showChannels {
                    ScrollView{
                        ForEach(mockChannels) { channel in
                            
                            Button{
                                withAnimation {
                                    selectedChannel = channel
                                }
                            }label:{
                                HStack{
                                    Image(systemName: "number")
                                        .foregroundStyle(.gray)
                                    Text(channel.name)
                                        .font(.title3)
                                        .bold(selectedChannel == channel)
                                        .foregroundStyle(selectedChannel == channel ? .white : .gray)
                                       
                                     

                                }
                            }
                            .padding(8)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundStyle(.gray)
                            .background{
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(
                                        selectedChannel == channel ? Color(uiColor: .systemGray3)
                                        : .clear
                                    )
                            }
                        }
                    }
                }
                
              else  if let selectedChannel, !showChannels {
                    HStack{
                        Image(systemName: "number")
                            .foregroundStyle(.gray)
                        Text(selectedChannel.name)
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.white)
                    }
                    .padding(8)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .foregroundStyle(.gray)
                    .background{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(
                                Color(uiColor: .systemGray3)
                               
                            )
                    }
                }

            }
            .frame(maxHeight: .infinity,alignment: .topLeading)
            .frame(width: 230)
            .padding(.top,60)
            .padding()
            .background{
                Color(.background)
            }
            .ignoresSafeArea()

           
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
        
      
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MenuView()
}
