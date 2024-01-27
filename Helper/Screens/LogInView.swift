//
//  LogInView.swift
//  Helper
//
//  Created by Davron Abdukhakimov on 25/01/24.
//

import SwiftUI
import FirebaseAuth

struct LogInView: View {
    @State var email = ""
    @State var password = ""
    @FocusState var focus: FocusField?
    @State var isEnter = false
    enum FocusField {
        case email, password
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Email"){
                    TextField("Email or username:", text: $email)
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
                    Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                        if let error{
                            print(error.localizedDescription)
                        }
                        else{
                            isEnter = true
                        }
                    }
                }label: {
                    Text("Continue")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Log In")
        }
        .fullScreenCover(isPresented: $isEnter){
            HelperTabView()
        }
        .onAppear {
            focus = .email
        }
    }
}

#Preview {
    LogInView()
}
