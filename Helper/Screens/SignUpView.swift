//
//  SignUpView.swift
//  Helper
//
//  Created by Davron Abdukhakimov on 25/01/24.
//

import SwiftUI

struct SignUpView: View {
    @State var userName = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationStack{
            VStack{
                TextField("Username:", text: $userName)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray)
                    }
                TextField("Email:", text: $email)
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
                    Text("Create Account")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Sign Up")
            
        }
    }
}

#Preview {
    SignUpView()
}
