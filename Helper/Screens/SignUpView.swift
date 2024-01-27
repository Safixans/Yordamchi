//
//  SignUpView.swift
//  Helper
//
//  Created by Davron Abdukhakimov on 25/01/24.
//

import SwiftUI

enum Location: String, CaseIterable {
    case tashkent = "Toshkent shahri"
    case tashkentRegion = "Toshkent viloyati"
    case andijanRegion = "Andijon viloyati"
    case bukharaRegion = "Buxoro viloyati"
    case ferganaRegion = "Farg'ona viloyati"
    case jizzakhRegion = "Jizzax viloyati"
    case karakalpakstan = "Qoraqalpog'iston Respublikasi"
    case namanganRegion = "Namangan viloyati"
    case navoiyRegion = "Navoiy viloyati"
    case samarkandRegion = "Samarkand viloyati"
    case sirdaryoRegion = "Sirdaryo viloyati"
    case surkhandaryaRegion = "Surxondaryo viloyati"
    case qashkadaryaRegion = "Qashqadaryo viloyati"
    case khorezmRegion = "Xorazm viloyati"
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
                Section("Shaxsiy ma'lumotlar"){
                    TextField("F.I.SH", text: $fullName)
                        .focused($focus, equals: .fullName)
                        .onSubmit {
                            focus = .location
                        }
                    Picker("Yashash manzili", selection: $location) {
                        ForEach(Location.allCases, id: \.rawValue) { city in
                            Text(city.rawValue)
                                .tag(city)
                        }
                    }
                    .focused($focus, equals: .location)
                    .onSubmit {
                        focus = .email
                    }
                }
                Section {
                    TextField("Pochta manzili:", text: $email)
                        .focused($focus, equals: .email)
                        .onSubmit {
                            focus = .password
                        }
                        
                    TextField("Parol:", text: $password)
                        .focused($focus, equals: .password)
                }
                
                Spacer()
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    
                Button{
                    
                }label: {
                    Text("Akkaunt yaratish")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Ro'yxatdan o'tish")
        }
    }
}

#Preview {
    SignUpView()
}
