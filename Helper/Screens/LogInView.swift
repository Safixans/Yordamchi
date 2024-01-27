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
    @FocusState var focus: FocusField?
    
    enum FocusField {
        case email, password
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Email"){
                    TextField("Email or username:", text: $emailOrUserName)
                        .focused($focus, equals: .email)
                        .onSubmit {
                            focus = .password
                        }
                }
                
                Section("Password"){
                    SecureField("Password:", text: $password)
                        .focused($focus, equals: .password)
                        .onSubmit {
                            print("Submit login and password")
                        }
                    
                }
                
                Spacer()
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                Button{
                    
                }label: {
                    Text("Continue")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .listRowInsets(EdgeInsets())
            }
            .onAppear {
                focus = .email
            }
            
            .navigationTitle("Log In")
            
        }
    }
}

#Preview {
    LogInView()
}
