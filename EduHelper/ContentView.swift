//
//  ContentView.swift
//  EduHelper
//
//  Created by Disaur on 30/6/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isShowingiPad = false
    @State private var isShowingMac = false
    @State private var isShowingAcc = false
    
    var body: some View {
        NavigationView{
            if isShowingiPad {
                iPadPricing
            }
            else {
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))]) {
                        HStack{
                            Text("For Internal Use Only")
                                .font(.headline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                                .padding([.leading, .bottom, .trailing], 20.0)
                            Spacer()
                        }
                        iPadButton.padding(.horizontal, 30.0)
                        macButton.padding(.horizontal, 30.0)
                        accButton.padding(.horizontal, 30.0)
                        Text("@ Disaur")
                            .font(.footnote)
                            .fontWeight(.ultraLight)
                            .foregroundColor(Color.gray)
                            .padding(.all, 20.0)
                    }
                }
                .background(Color(.systemGray6))
                //.background(colorScheme == .dark ? Color(red: 38, green: 38, blue: 38) : Color(red: 242, green: 242, blue: 242))
                .navigationTitle("China Edu Pricing")
            }
        }
        .navigationViewStyle(.stack)
    }
    
    var iPadButton: some View {
        Button(action: {
            isShowingiPad.toggle()
        }) {
            HStack {
                Image(systemName: "ipad")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                Text("iPad")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.title)
            }
            //.foregroundColor(Color(UIColor.systemBackground))
            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
        }
        .frame(maxWidth: .infinity, minHeight: 120)
        //.background(Color(UIColor.label))
        .background(colorScheme == .dark ? Color.black : Color.white)
        .cornerRadius(20)
    }
    
    var macButton: some View {
        Button(action: {
            isShowingMac.toggle()
        }) {
            HStack {
                Image(systemName: "laptopcomputer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                Text("Mac")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.title)
            }
            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            .padding(EdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 40))
        }
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(colorScheme == .dark ? Color.black : Color.white)
        .cornerRadius(20)
    }
    
    var accButton: some View {
        Button(action: {
            isShowingAcc.toggle()
        }) {
            HStack {
                Image(systemName: "applepencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45)
                Text("Accessory")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.title)
            }
            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            .padding(EdgeInsets(top: 30, leading: 40, bottom: 30, trailing: 30))
        }
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(colorScheme == .dark ? Color.black : Color.white)
        .cornerRadius(20)
    }
    
    var iPadPricing: some View {
        VStack {
            Button(action: {
                    isShowingiPad.toggle()
                }) {
                    HStack {
                        Image(systemName: "chevron.backward.circle.fill")
                            .font(.largeTitle)
                        Spacer()
                    }
                    .padding(.leading)
                    //.foregroundColor(Color(UIColor.systemBackground))
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 150)
                //.background(Color(UIColor.label))
                .background(colorScheme == .dark ? Color.black : Color.white)
                .buttonStyle(.borderless)
                .cornerRadius(30)
            
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
                .padding(.bottom)
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
