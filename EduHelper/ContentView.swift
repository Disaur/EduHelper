//
//  ContentView.swift
//  EduHelper
//
//  Created by Disaur on 30/6/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))]) {
                    iPadPricing
                    //.aspectRatio(2/3, contentMode: .fit)
                }
            }
            .navigationTitle("Apple Edu Pricing")
        }
        .navigationViewStyle(.stack)
    }
    
    
    
    var iPadPricing: some View {
        VStack {
            Text("iPad")
                .font(.largeTitle)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
            Text("iPad (9th Gen)")
                .font(.headline)
                .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
            HStack{
                Spacer()
                VStack{
                    Text("WiFi")
                    Text("64GB\n2399")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(-1.0)
                    Text("原價\n2499\n差價\n100")
                        .font(.body)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                    Text("256GB\n3499")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(-1.0)
                    Text("原價\n3699\n差價\n200")
                        .font(.body)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                VStack{
                    Text("WiFi + Cellular")
                    Text("64GB\n3299")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(-1.0)
                    Text("原價\n3499\n差價\n200")
                        .font(.body)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                    Text("256GB\n4499")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(-1.0)
                    Text("原價\n4699\n差價\n200")
                        .font(.body)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }
            Text("AppleCare+: 548")
                .font(.title3)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Text("*註：不參與返校季活動")
                .font(.footnote)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
