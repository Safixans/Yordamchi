//
//  ChatView.swift
//  Helper
//
//  Created by Asror Aliqulov on 23/01/24.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        NavigationStack{
            ScrollView(.vertical) {
                VStack{
                    ForEach(0..<5){_ in
                        NavigationLink{
                            MessagesView()
                        }label: {
                            ChatCell()
                                .foregroundStyle(Color(UIColor.label))
                        }
                        Divider()
                    }
                }
                .padding()
            }
            .navigationTitle("Chat")
        }
    }
}

struct ChatCell:View {
    var body: some View {
        HStack{
            Image("mockPhoto")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50,height: 50)
                .clipShape(Circle())
                .padding(.trailing,10)
            VStack(alignment:.leading){
                Text("Asror")
                    .font(.title2)
                    .fontWeight(.medium)
                Text("Hello Davron.")
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
    }
}
#Preview {
    ChatView()
}
