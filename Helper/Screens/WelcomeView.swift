//
//  WelcomeView.swift
//  Helper
//
//  Created by Davron Abdukhakimov on 25/01/24.
//

import SwiftUI

struct WelcomeView: View {
    @State var pageOrder = 0
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    var body: some View {
        NavigationStack{
            VStack{
                TabView(selection: $pageOrder){
                    Text("Tab Content 1")
                        .tabItem { Text("Tab Label 1") }
                        .tag(0)
                    Text("Tab Content 2")
                        .tabItem { Text("Tab Label 2") }
                        .tag(1)
                    Text("Tab Content 3")
                        .tabItem { Text("Tab Label 3") }
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .onAppear() {
                    UIPageControl.appearance().currentPageIndicatorTintColor = .blue
                    UIPageControl.appearance().pageIndicatorTintColor = .gray
                }
                HStack{
                    NavigationLink{
                        SignUpView()
                    }label: {
                        Text("Sign Up")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.bordered)
                    .padding(.trailing,50)
                    NavigationLink{
                        LogInView()
                    }label: {
                        Text("Log In")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle("Helper")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onReceive(timer){ _ in
            withAnimation {
                pageOrder += 1
                if pageOrder == 3{
                    pageOrder = 0
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
