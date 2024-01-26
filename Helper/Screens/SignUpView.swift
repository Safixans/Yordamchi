//
//  SignUpView.swift
//  Helper
//
//  Created by Davron Abdukhakimov on 25/01/24.
//

import SwiftUI

enum Location: String, CaseIterable {
    case tashkent = "Tashkent"
    case tashkentRegion = "Tashkent Region"
    case andijanRegion = "Andijan Region"
    case bukharaRegion = "Bukhara Region"
    case ferganaRegion = "Fergana Region"
    case jizzakhRegion = "Jizzakh Region"
    case karakalpakstan = "Karakalpakstan"
    case namanganRegion = "Namangan Region"
    case navoiyRegion = "Navoiy Region"
    case samarkandRegion = "Samarkand Region"
    case sirdaryoRegion = "Sirdaryo Region"
    case surkhandaryaRegion = "Surkhandarya Region"
    case syrdaryaRegion = "Syrdarya Region"
    case khorezmRegion = "Khorezm Region"
}



struct SignUpView: View {
    enum FocusField {
        case fullName, location, email, password
    }
    @State var fullName = ""
    @State var email = ""
    @State var password = ""
    @State var location: Location = .tashkent
    @FocusState var focus: FocusField?
    var body: some View {
        NavigationStack{
            Form {
                Section("Personal Information"){
                    TextField("Full Name:", text: $fullName)
                        .focused($focus, equals: .fullName)
                    Picker("Location", selection: $location) {
                        ForEach(Location.allCases, id: \.rawValue) { city in
                            Text(city.rawValue)
                        }
                    }
                }
                Section {
                    TextField("Email:", text: $email)
                        
                    TextField("Password:", text: $password)
                }
                    
                Button{
                    
                }label: {
                    Text("Create Account")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Sign Up")
        }
    }
}

#Preview {
    SignUpView()
}
