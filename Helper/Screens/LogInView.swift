//
//  LogInView.swift
//  Helper
//
//  Created by Davron Abdukhakimov on 25/01/24.
//

import SwiftUI

struct LogInView: View {
    @State var emailOrUserName = ""
    @State var password = ""
    var body: some View {
        NavigationStack{
            VStack{
                TextField("Email or username:", text: $emailOrUserName)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray)
                    }
                TextField("Password:", text: $password)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray)
                    }
                Spacer()
                Button{
                    
                }label: {
                    Text("Continue")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            
            .navigationTitle("Log In")
            
        }
    }
}

#Preview {
    LogInView()
}
