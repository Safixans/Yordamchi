//
//  MessagesView.swift
//  Helper
//
//  Created by Davron Abdukhakimov on 25/01/24.
//

import SwiftUI

struct MessagesView: View {
    @State var text = ""
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView(.vertical) {
                    VStack{
                        OtherMessageCell()
                        MyMessageCell()
                        OtherMessageCell()
                        MyMessageCell()
                        OtherMessageCell()
                        OtherMessageCell()
                        MyMessageCell()
                        OtherMessageCell()
                        MyMessageCell()
                        OtherMessageCell()
                        OtherMessageCell()
                        MyMessageCell()
                        OtherMessageCell()
                        MyMessageCell()
                        OtherMessageCell()
                    }
                    .padding()
                }
                HStack{
                    TextField("Text", text: $text, axis: .vertical)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                    Button{
                        
                    }label: {
                        Image(systemName: "arrow.up")
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    .opacity(text == "" ? 0.6 : 1.0)
                    .disabled(text == "")
                }
                .padding(.horizontal)
            }
            .navigationTitle("Asror")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MyMessageCell:View {
    var body: some View {
        HStack{
            Spacer()
            VStack(alignment: .trailing){
                Text("Hello how are you?")
                    .font(.title3)
                Text("12:00")
                    .foregroundStyle(.secondary)
                
            }
            .padding()
            .background(Color.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

struct OtherMessageCell:View {
    var body: some View {
        HStack{
            VStack(alignment:.trailing){
                Text("Hello how are you?")
                    .font(.title3)
                Text("12:00")
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            Spacer()
        }
    }
}

#Preview {
    MessagesView()
}
