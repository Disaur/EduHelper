//
//  ContentView.swift
//  EduHelper
//
//  Created by Disaur on 30/6/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    @State private var scene = 1
    
    var body: some View {
        NavigationView{
            ScrollView{
                //LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))]) {
                    HStack{
                        Text("For Internal Use Only")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                            .padding([.leading, .bottom, .trailing], 20.0)
                        Spacer()
                    }
                    NavigationLink(destination:
                                    iPadPricing
                                    , label: {
                        iPadButton.padding(.horizontal, 30.0)
                    })
                macButton.padding(.horizontal, 30.0)
                accButton.padding(.horizontal, 30.0)
                Text("Quick Tools")
                    .font(.callout)
                    .fontWeight(.light)
                    .padding([.top, .leading, .trailing], 20.0)
                calcButton.padding(1.0)
                Text("@ Disaur")
                    .font(.footnote)
                    .fontWeight(.ultraLight)
                    .foregroundColor(Color.gray)
                    .padding(.all, 20.0)
                //}
            }
            .background(Color(.systemGray6))
                //.background(colorScheme == .dark ? Color(red: 38, green: 38, blue: 38) : Color(red: 242, green: 242, blue: 242))
            .navigationTitle("China Edu Pricing")}
        .navigationViewStyle(.stack)
    }
    
    var iPadButton: some View {
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
            .frame(maxWidth: .infinity, minHeight: 150)
        //.background(Color(UIColor.label))
        .background(colorScheme == .dark ? Color.black : Color.white)
        .cornerRadius(20)
    }
    
    var macButton: some View {
        Button(action: {
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
        .frame(maxWidth: .infinity, minHeight: 150)
        .background(colorScheme == .dark ? Color.black : Color.white)
        .cornerRadius(20)
    }
    
    var accButton: some View {
        Button(action: {
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
        .frame(maxWidth: .infinity, minHeight: 150)
        .background(colorScheme == .dark ? Color.black : Color.white)
        .cornerRadius(20)
    }
    
    var backButton: some View { Button(action: {
        dismiss()
        }) {
                Image(systemName: "chevron.backward.circle.fill")
                    .font(.title2)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
        }
    }
    
    var discountOn: some View {
        Button(action: {
        }) {Text("教育")
                .fontWeight(.medium)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: 130, alignment: .center)
                .font(.title2)
            }
        .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
        .background(colorScheme == .dark ? Color.white : Color.black)
        .cornerRadius(50)
    }
    
    var discountOff: some View {
        Button(action: {
                scene = 1
            }) {Text("教育")
                .fontWeight(.medium)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: 130, alignment: .center)
                .font(.title2)
            }
        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
        .background(Color(.systemGray6))
        .cornerRadius(50)
    }
    
    var originalOn: some View {
        Button(action: {
        }) {Text("原價")
                .fontWeight(.medium)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: 130, alignment: .center)
                .font(.title2)
            }
        .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
        .background(colorScheme == .dark ? Color.white : Color.black)
        .cornerRadius(50)
    }
    
    var originalOff: some View {
        Button(action: {
                scene = 2
            }) {Text("原價")
                .fontWeight(.medium)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: 130, alignment: .center)
                .font(.title2)
            }
        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
        .background(Color(.systemGray6))
        .cornerRadius(50)
    }
    
    var differenceOn: some View {
        Button(action: {
        }) {Text("價差")
                .fontWeight(.medium)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: 130, alignment: .center)
                .font(.title2)
            }
        .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
        .background(colorScheme == .dark ? Color.white : Color.black)
        .cornerRadius(50)
    }
    
    var differenceOff: some View {
        Button(action: {
                scene = 3
            }) {Text("價差")
                .fontWeight(.medium)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: 130, alignment: .center)
                .font(.title2)
            }
        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
        .background(Color(.systemGray6))
        .cornerRadius(50)
    }
    
    var iPadPricing: some View {
        ScrollView{
            if scene == 1 {
                HStack{
                    discountOn
                    originalOff
                    differenceOff
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Group{
                Text("iPad Pro 11'' (3rd Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("128GB\n5799")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n6599")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n7799")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n10999")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n14199")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("128GB\n6999")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n7799")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n8999")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n12199")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n15399")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text("AppleCare+: 798")
                    .font(.headline)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("*註：八折優惠僅限返校季期間")
                    .font(.footnote)
                    .padding(.bottom)
                }
                
                Group{
                Text("iPad Pro 12.9'' (5th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("128GB\n7699")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n8499")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n10099")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n13299")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n16499")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("128GB\n8899")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n9699")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n11299")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n14499")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n17699")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text("AppleCare+: 958")
                    .font(.headline)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("*註：八折優惠僅限返校季期間")
                    .font(.footnote)
                    .padding(.bottom)
                }
                
                Group{
                Text("iPad Air (5th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n3999")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n5099")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n5099")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n6199")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text("AppleCare+: 518")
                    .font(.headline)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("*註：八折優惠僅限返校季期間")
                    .font(.footnote)
                    .padding(.bottom)
                }
                
                Group{
                Text("iPad mini (6th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n3399")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n4599")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n4499")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n5799")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text("AppleCare+: 548")
                    .font(.headline)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("*註：不參與返校季活動")
                    .font(.footnote)
                    .padding(.bottom)
                }
                
                Group{
                Text("iPad (9th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n2399")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n3499")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n3299")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n4499")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text("AppleCare+: 548")
                    .font(.headline)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("*註：不參與返校季活動")
                    .font(.footnote)
                    .padding(.bottom)
                }
                
            } else if scene == 2 {
                HStack{
                    discountOff
                    originalOn
                    differenceOff
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Group{
                Text("iPad Pro 11'' (3rd Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("128GB\n6199")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n6999")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n8599")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n11799")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n14999")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("128GB\n7399")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n8199")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n9799")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n12999")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n16199")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text("AppleCare+: 998")
                    .font(.headline)
                    .padding(.vertical)
                }
                
                Group{
                Text("iPad Pro 12.9'' (5th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("128GB\n8499")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n9299")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n10899")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n14099")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n17299")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("128GB\n9699")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n10499")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n12099")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n15299")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n18499")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text("AppleCare+: 1198")
                    .font(.headline)
                    .padding(.vertical)
                }
                
                Group{
                Text("iPad Air (5th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n4399")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n5499")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n5499")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n6599")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text("AppleCare+: 648")
                    .font(.headline)
                    .padding(.vertical)
                }
                
                Group{
                Text("iPad mini (6th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n3799")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n4999")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n4999")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n6199")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text("AppleCare+: 548")
                    .font(.headline)
                    .padding(.vertical)
                }
                
                Group{
                Text("iPad (9th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n2499")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n3699")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n3499")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n4699")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text("AppleCare+: 548")
                    .font(.headline)
                    .padding(.vertical)
                }
                
            } else {
                HStack{
                    discountOff
                    originalOff
                    differenceOn
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Group{
                Text("iPad Pro 11'' (3rd Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("128GB\n400")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n400")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("128GB\n400")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n400")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text("AppleCare+: 200")
                    .font(.headline)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("*註：八折優惠僅限返校季期間")
                    .font(.footnote)
                    .padding(.bottom)
                }
                
                Group{
                Text("iPad Pro 12.9'' (5th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("128GB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("128GB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n800")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text("AppleCare+: 240")
                    .font(.headline)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("*註：八折優惠僅限返校季期間")
                    .font(.footnote)
                    .padding(.bottom)
                }
                
                Group{
                Text("iPad Air (5th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n400")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n400")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n400")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n400")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text("AppleCare+: 130")
                    .font(.headline)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("*註：八折優惠僅限返校季期間")
                    .font(.footnote)
                    .padding(.bottom)
                }
                
                Group{
                Text("iPad mini (6th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n400")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n400")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n500")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n400")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text("*註：不參與返校季活動")
                    .font(.footnote)
                    .padding(.all)
                }
                
                Group{
                Text("iPad (9th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n100")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n200")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("64GB\n200")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n200")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text("*註：不參與返校季活動")
                    .font(.footnote)
                    .padding(.all)
                }
                
            }
            
        }
        .navigationTitle("iPad")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
    var calcButton: some View {
                Text("Calculator")
            .fontWeight(.regular)
                    .font(.body)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    .background(colorScheme == .dark ? Color.black : Color.white)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                    .cornerRadius(20)
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
