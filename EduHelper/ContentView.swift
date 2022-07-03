//
//  ContentView.swift
//  EduHelper
//
//  Created by Disaur on 30/6/2022.
//

import SwiftUI

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
    
    // To make it works also with ScrollView
//    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        true
//    }
}

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) private var openURL
    @State private var quickiPad = false
    @State private var quickMac = false
    @State private var quickAcc = false
    
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
                NavigationLink(destination: iPadPricing(),
                               isActive: $quickiPad,
                               label: {iPadButton.padding(.horizontal, 30.0)})
                NavigationLink(destination: macPricing(),
                               isActive: $quickMac,
                               label: {macButton.padding(.horizontal, 30.0)})
                NavigationLink(destination: accPricing(),
                               isActive: $quickAcc,
                               label: {accButton.padding(.horizontal, 30.0)})
                Text("Useful Links")
                    .font(.callout)
                    .fontWeight(.light)
                    .padding([.top, .leading, .trailing], 20.0)
                quickButton.padding(1.0)
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
        .onOpenURL {
            url in switch url.path {
            case "/iPad":
                self.quickiPad = true
            case "/mac":
                self.quickMac = true
            case "/acc":
                self.quickAcc = true
            default: break
            }
        }
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
        .frame(maxWidth: .infinity, minHeight: 150)
        .background(colorScheme == .dark ? Color.black : Color.white)
        .cornerRadius(20)
    }
    
    var accButton: some View {
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
        .frame(maxWidth: .infinity, minHeight: 150)
        .background(colorScheme == .dark ? Color.black : Color.white)
        .cornerRadius(20)
    }
    
    var quickButton: some View {
        Button(action: {
            if let url = URL(string: "applestore://") {
                openURL(url)}
        }) {Text("Apple Store")
                .fontWeight(.thin)
                .padding(.horizontal)
                .foregroundColor(Color.gray)
                .frame(maxWidth: 200, alignment: .center)
                .font(.body)
            }
    }
    
    
    
    struct iPadPricing: View {
        
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
        
    @State private var scene = 1
    
    var backButton: some View { Button(action: {
        dismiss()
            }) {
                    Image(systemName: "chevron.backward.circle.fill")
                        .font(.title3)
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
        
    var body: some View {
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
                            .fixedSize(horizontal: false, vertical: true)
                        Text("128GB\n5799")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n6599")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n7799")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n10999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n14199")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("128GB\n6999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n7799")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n8999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n12199")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n15399")
                            .fixedSize(horizontal: false, vertical: true)
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
                            .fixedSize(horizontal: false, vertical: true)
                        Text("128GB\n7699")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n8499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n10099")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n13299")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n16499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("128GB\n8899")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n9699")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n11299")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n14499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n17699")
                            .fixedSize(horizontal: false, vertical: true)
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
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n3999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n5099")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n5099")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n6199")
                            .fixedSize(horizontal: false, vertical: true)
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
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n3399")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n4599")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n4499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n5799")
                            .fixedSize(horizontal: false, vertical: true)
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
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n2399")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n3499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n3299")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n4499")
                            .fixedSize(horizontal: false, vertical: true)
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
                            .fixedSize(horizontal: false, vertical: true)
                        Text("128GB\n6199")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n6999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n8599")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n11799")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n14999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("128GB\n7399")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n8199")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n9799")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n12999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n16199")
                            .fixedSize(horizontal: false, vertical: true)
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
                            .fixedSize(horizontal: false, vertical: true)
                        Text("128GB\n8499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n9299")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n10899")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n14099")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n17299")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("128GB\n9699")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n10499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n12099")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n15299")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n18499")
                            .fixedSize(horizontal: false, vertical: true)
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
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n4399")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n5499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n5499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n6599")
                            .fixedSize(horizontal: false, vertical: true)
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
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n3799")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n4999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n4999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n6199")
                            .fixedSize(horizontal: false, vertical: true)
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
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n2499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n3699")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n3499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n4699")
                            .fixedSize(horizontal: false, vertical: true)
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
                            .fixedSize(horizontal: false, vertical: true)
                        Text("128GB\n400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("128GB\n400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n800")
                            .fixedSize(horizontal: false, vertical: true)
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
                            .fixedSize(horizontal: false, vertical: true)
                        Text("128GB\n800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("128GB\n800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("512GB\n800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("1TB\n800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2TB\n800")
                            .fixedSize(horizontal: false, vertical: true)
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
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n400")
                            .fixedSize(horizontal: false, vertical: true)
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
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n500")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n400")
                            .fixedSize(horizontal: false, vertical: true)
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
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n100")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n200")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("64GB\n200")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("256GB\n200")
                            .fixedSize(horizontal: false, vertical: true)
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
}

    struct macPricing: View {
            
        @Environment(\.dismiss) private var dismiss
        @Environment(\.colorScheme) var colorScheme
            
        @State private var scene = 1
        
        var backButton: some View { Button(action: {
            dismiss()
                }) {
                        Image(systemName: "chevron.backward.circle.fill")
                            .font(.title3)
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
            
        var body: some View {
            ScrollView{
                if scene == 1 {
                    HStack{
                        discountOn
                        originalOff
                        differenceOff
                    }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    Group{
                    Text("MacBook Air")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("M2 Series")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("8GB+256GB\n8749")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("8GB+512GB\n11149")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("16GB+1TB\n13849")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                        VStack{
                            Text("M1 Series")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("8GB+256GB\n7199")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                        }
                        Spacer()
                    }
                    Text("AppleCare+:\nM2: 1118\nM1: 998")
                        .font(.headline)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Text("*註：八折優惠僅限返校季期間")
                        .font(.footnote)
                        .padding(.bottom)
                    }
                    
                    Group{
                    Text("MacBook Pro")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("14''")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("8GB+512GB(M1 Pro)\n13899")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("16GB+1TB(M1 Pro)\n17499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("64GB+2TB(M1 Max)\n28299")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 20.0)
                            Text("13'' (M2)")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("8GB+256GB\n9249")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("8GB+512GB\n10749")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("24GB+1TB\n14799")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                        }
                        Spacer()
                        VStack{
                            Text("16''")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("16GB+512GB(M1 Pro)\n17499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("16GB+1TB(M1 Pro)\n18999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("32GB+1TB(M1 Max)\n24199")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("64GB+4TB(M1 Max)\n33649")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                    }
                    Text("AppleCare+:\n13'': 1318\n14'': 1398\n16'': 2078")
                        .font(.headline)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Text("*註：八折優惠僅限返校季期間")
                        .font(.footnote)
                        .padding(.bottom)
                    }
                    
                    Group{
                    Text("iMac")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("8GB+256GB (7核GPU)\n9599")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("8GB+256GB (8核GPU)\n10699")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                        VStack{
                            Text("8GB+512GB\n12199")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("16GB+1TB\n14899")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                    }
                    Text("AppleCare+: 934")
                        .font(.headline)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Text("*註：八折優惠僅限返校季期間")
                        .font(.footnote)
                        .padding(.bottom)
                    }
                    
                    Group{
                    Text("Mac 主機")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("Mac mini")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("8GB+256GB(M1)\n4899")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("8GB+512GB(M1)\n6399")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("8GB+512GB(Intel)\n7899")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                        VStack{
                            Text("Mac Studio")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("32GB+512GB(M1 Max)\n13499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("64GB+1TB(M1 Ultra)\n26999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                    }
                    Text("AppleCare+:\nMac mini: 681\nMac Studio: 1198")
                        .font(.headline)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Text("*註：不參與返校季活動")
                        .font(.footnote)
                        .padding(.bottom)
                    }
                    
                    Group{
                    Text("Studio Display")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("標準玻璃\n10799")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("標準玻璃可調高度\n13799")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                        VStack{
                            Text("納米紋理玻璃\n12799")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("納米紋理玻璃可調高度\n15799")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                    }
                    Text("AppleCare+: 898")
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
                    Text("MacBook Air")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("M2 Series")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("8GB+256GB\n9499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("8GB+512GB\n11899")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("16GB+1TB\n14899")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                        VStack{
                            Text("M1 Series")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("8GB+256GB\n7999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                        }
                        Spacer()
                    }
                    Text("AppleCare+:\nM2: 1398\nM1: 1248")
                        .font(.headline)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    }
                    
                    Group{
                    Text("MacBook Pro")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("14''")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("8GB+512GB(M1 Pro)\n14999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("16GB+1TB(M1 Pro)\n18999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("64GB+2TB(M1 Max)\n29499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 20.0)
                            Text("13'' (M2)")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("8GB+256GB\n9999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("8GB+512GB\n11499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("24GB+1TB\n15999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                        }
                        Spacer()
                        VStack{
                            Text("16''")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("16GB+512GB(M1 Pro)\n18999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("16GB+1TB(M1 Pro)\n20499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("32GB+1TB(M1 Max)\n26499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("64GB+4TB(M1 Max)\n36999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                    }
                    Text("AppleCare+:\n13'': 1648\n14'': 1748\n16'': 2598")
                        .font(.headline)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    }
                    
                    Group{
                    Text("iMac")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("8GB+256GB (7核GPU)\n9999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("8GB+256GB (8核GPU)\n11499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                        VStack{
                            Text("8GB+512GB\n12999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("16GB+1TB\n15999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                    }
                    Text("AppleCare+: 1168")
                        .font(.headline)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    }
                    
                    Group{
                    Text("Mac 主機")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("Mac mini")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("8GB+256GB(M1)\n5299")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("8GB+512GB(M1)\n6799")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("8GB+512GB(Intel)\n8299")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                        VStack{
                            Text("Mac Studio")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("32GB+512GB(M1 Max)\n14999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("64GB+1TB(M1 Ultra)\n29999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                    }
                    Text("AppleCare+:\nMac mini: 681\nMac Studio: 1198")
                        .font(.headline)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    }
                    
                    Group{
                    Text("Studio Display")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("標準玻璃\n11499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("標準玻璃可調高度\n14499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                        VStack{
                            Text("納米紋理玻璃\n13499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("納米紋理玻璃可調高度\n16499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                    }
                    Text("AppleCare+: 898")
                        .font(.headline)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    }
                    
                } else {
                    HStack{
                        discountOff
                        originalOff
                        differenceOn
                    }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    Group{
                    Text("MacBook Air")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("M2 Series")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("8GB+256GB\n750")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("8GB+512GB\n750")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("16GB+1TB\n1050")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                        VStack{
                            Text("M1 Series")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("8GB+256GB\n800")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                        }
                        Spacer()
                    }
                    Text("AppleCare+:\nM2: 271\nM1: 250")
                        .font(.headline)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Text("*註：八折優惠僅限返校季期間")
                        .font(.footnote)
                        .padding(.bottom)
                    }
                    
                    Group{
                    Text("MacBook Pro")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("14''")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("8GB+512GB(M1 Pro)\n1100")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("16GB+1TB(M1 Pro)\n1500")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("64GB+2TB(M1 Max)\n1200")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 20.0)
                            Text("13'' (M2)")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("8GB+256GB\n750")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("8GB+512GB\n750")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("24GB+1TB\n1200")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                        }
                        Spacer()
                        VStack{
                            Text("16''")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("16GB+512GB(M1 Pro)\n1500")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("16GB+1TB(M1 Pro)\n1500")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("32GB+1TB(M1 Max)\n2300")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("64GB+4TB(M1 Max)\n3350")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                    }
                    Text("AppleCare+:\n13'': 330\n14'': 350\n16'': 520")
                        .font(.headline)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Text("*註：八折優惠僅限返校季期間")
                        .font(.footnote)
                        .padding(.bottom)
                    }
                    
                    Group{
                    Text("iMac")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("8GB+256GB (7核GPU)\n400")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("8GB+256GB (8核GPU)\n800")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                        VStack{
                            Text("8GB+512GB\n800")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("16GB+1TB\n1100")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                    }
                    Text("AppleCare+: 234")
                        .font(.headline)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Text("*註：八折優惠僅限返校季期間")
                        .font(.footnote)
                        .padding(.bottom)
                    }
                    
                    Group{
                    Text("Mac 主機")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("Mac mini")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("8GB+256GB(M1)\n400")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("8GB+512GB(M1)\n400")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("8GB+512GB(Intel)\n400")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                        VStack{
                            Text("Mac Studio")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("32GB+512GB(M1 Max)\n1500")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("64GB+1TB(M1 Ultra)\n3000")
                                .fixedSize(horizontal: false, vertical: true)
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
                    Text("Studio Display")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("標準玻璃\n700")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("標準玻璃可調高度\n700")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                        VStack{
                            Text("納米紋理玻璃\n700")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10.0)
                            Text("納米紋理玻璃可調高度\n700")
                                .fixedSize(horizontal: false, vertical: true)
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
            .navigationTitle("Mac")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
        }
    }

    struct accPricing: View {
        
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
        
    @State private var scene = 1
    
    var backButton: some View { Button(action: {
        dismiss()
            }) {
                    Image(systemName: "chevron.backward.circle.fill")
                        .font(.title3)
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
        
    var body: some View {
        ScrollView{
            if scene == 1 {
                HStack{
                    discountOn
                    originalOff
                    differenceOff
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Group{
                Text("iPad 配件")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("一代 Apple Pencil\n648")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("二代 Apple Pencil\n895")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("10.9/11'' Magic Keyboard\n2199")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("12.9'' Magic Keyboard\n2549")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        
                        Text("10.2'' Smart Keyboard\n1159")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("10.9/11'' Smart Keyboard Folio\n1199")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("12.9'' Smart Keyboard Folio\n1409")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                
                Group{
                Text("Mac 軟件")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Spacer()
                VStack{
                        Text("Pro App 教育套裝")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("Final Cut Pro")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("Logic Pro")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("Motion")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("Compressor")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("MainStage")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("套裝價: 1298")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
            } else if scene == 2 {
                HStack{
                    discountOff
                    originalOn
                    differenceOff
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Group{
                Text("iPad 配件")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("一代 Apple Pencil\n722")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("二代 Apple Pencil\n969")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("10.9/11'' Magic Keyboard\n2399")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("12.9'' Magic Keyboard\n2699")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        
                        Text("10.2'' Smart Keyboard\n1239")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("10.9/11'' Smart Keyboard Folio\n1399")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("12.9'' Smart Keyboard Folio\n1558")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                
                Group{
                Text("Mac 軟件")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Spacer()
                VStack{
                        Text("Pro App 教育套裝")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("Final Cut Pro\n售價: 1998")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("Logic Pro\n售價: 1298")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("Motion\n售價: 328")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("Compressor\n售價: 328")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("MainStage\n售價: 198")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("合計: 4150")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
                
            } else {
                HStack{
                    discountOff
                    originalOff
                    differenceOn
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Group{
                Text("iPad 配件")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("一代 Apple Pencil\n74")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("二代 Apple Pencil\n74")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("10.9/11'' Magic Keyboard\n200")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("12.9'' Magic Keyboard\n150")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack{
                        
                        Text("10.2'' Smart Keyboard\n80")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("10.9/11'' Smart Keyboard Folio\n200")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all, 10.0)
                        Text("12.9'' Smart Keyboard Folio\n149")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                }
                Spacer()
                }}
            
            Group{
            Text("Mac 軟件")
                .font(.title)
                .fontWeight(.bold)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer()
            VStack{
                    Text("Pro App 教育套裝")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("2852")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    }
            }
            }
        }
        .navigationTitle("Accessory")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.landscapeLeft)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
