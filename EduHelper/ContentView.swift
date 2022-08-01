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

class RegionSettings: ObservableObject {
    @Published var isUS = false
}

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) private var openURL
    @State private var quickiPad = false
    @State private var quickMac = false
    @State private var quickAcc = false
    @StateObject var region = RegionSettings()
    
    var body: some View {
        NavigationView{
            ScrollView{
                //LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))]) {
                HStack{
                    //Text("Back to School Shopping Guide")
                    //Text("welcome \(region)")
                    //Text(welcomeStringKey) + Text(regionStringKey)
                    Text("welcome")
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.gray)
                        .padding([.leading, .bottom], 20.0)
                    Text(region.isUS ? "usLocale" : "cnLocale")
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.gray)
                        .padding([.bottom, .trailing], 20.0)
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
                NavigationLink(destination: infoPage(),
                                         label: {infoButton.padding(.horizontal, 30.0)})
                Text("usefullinks")
                    .font(.callout)
                    .fontWeight(.light)
                    .padding([.top, .leading, .trailing], 20.0)
                quickButton.padding(1.0)
                Text("storeregion")
                    .font(.callout)
                    .fontWeight(.light)
                    .padding([.top, .leading, .trailing], 20.0)
                regionPicker
                    .padding([.bottom, .leading, .trailing], 20.0)
                Group{
                    Text("trademark")
                        .font(.footnote)
                        .fontWeight(.ultraLight)
                        .foregroundColor(Color.gray)
                        .padding([.leading, .top, .trailing], 20.0)
                    Text("@ Disaur")
                        .font(.footnote)
                        .fontWeight(.ultraLight)
                        .foregroundColor(Color.gray)
                        .padding([.leading, .top, .trailing], 20.0)
                    Text("Ver. 1.1(4)")
                        .font(.caption)
                        .fontWeight(.ultraLight)
                        .foregroundColor(Color.gray)
                        .padding(.all, 1)
                }
                //}
            }
            .background(Color(.systemGray6))
                //.background(colorScheme == .dark ? Color(red: 38, green: 38, blue: 38) : Color(red: 242, green: 242, blue: 242))
        .navigationTitle("appName")}
        .navigationViewStyle(.stack)
        .environmentObject(region)
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
    
    var infoButton: some View {
            HStack {
                Image(systemName: "doc.append")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45)
                Text("info")
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
        VStack{
            Button(action: {
                if let url = URL(string: region.isUS ? "https://support.apple.com/ipad/repair/service" : "https://support.apple.com/zh-cn/ipad/repair/service") {
                    openURL(url)}
            }) {Text("ipadService")
                    .fontWeight(.thin)
                    .padding(.horizontal)
                    .foregroundColor(Color.gray)
                    .frame(maxWidth: 200, alignment: .center)
                    .font(.body)
                }
            .padding(.bottom, 1)
            Button(action: {
                if let url = URL(string: region.isUS ? "https://support.apple.com/mac/repair/service" : "https://support.apple.com/zh-cn/mac/repair/service") {
                    openURL(url)}
            }) {Text("macService")
                    .fontWeight(.thin)
                    .padding(.horizontal)
                    .foregroundColor(Color.gray)
                    .frame(maxWidth: 200, alignment: .center)
                    .font(.body)
                }
            .padding(.bottom, 1)
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
    }
    
    init() {
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.systemGray], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.systemGray2], for: .normal)
        }
    
    var regionPicker: some View {
        Picker(selection: $region.isUS, label: Text("Region")) {
                Text("cnLocaleSymbol")
                .tag(false)
                Text("usLocaleSymbol")
                .tag(true)
        }
        .pickerStyle(.segmented)
    }
    
//        Menu {
//            Button {
//                region.isUS = false
//                viewUS = false
//            } label: {
//                Text("cnLocaleSymbol")
//                Image(systemName: "globe.asia.australia.fill")
//            }
//            Button {
//                region.isUS = true
//                viewUS = true
//            } label: {
//                Text("usLocaleSymbol")
//                Image(systemName: "globe.americas.fill")
//            }
//        } label: {
//            Image(systemName: "globe")
//            Text("Select Region...")
//        }.foregroundColor(Color.gray)
//    }
    
    //Table View Test
    
//    struct ExampleRow: View {
//        var body: some View {
//            Text("Example Row")
//        }
//    }
//
//    struct TableView: View {
//        var body: some View {
//
//            ZStack {
//                HStack {
//                    List {
//                        Section(header: Text("Column A")) {
//                            ExampleRow()
//                            ExampleRow()
//                            ExampleRow()
//                        }
//                    }.listStyle(GroupedListStyle())
//                        .disabled(true)
//
//                    List {
//                        Section(header: Text("Column B")) {
//                            ExampleRow()
//                            ExampleRow()
//                            ExampleRow()
//                        }
//                    }.listStyle(GroupedListStyle())
//                        .disabled(true)
//                }
//                Rectangle().fill(Color.gray).opacity(0.4).frame(width: CGFloat(1))
//            }
//        }
//    }

    
    struct iPadPricing: View {
        
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var region: RegionSettings
        
    @State private var scene = 1
    
    var backButton: some View { Button(action: {
        dismiss()
            }) {
                    Image(systemName: "chevron.backward.circle.fill")
                        .font(.title3)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            }
        }
        
        var switchButton: some View { Button(action: {
            if scene == 1 {scene = 2}
            else if scene == 2 {scene = 3}
            else {scene = 1}
            }) {
                        if scene == 1 {Text("education")
                            .foregroundColor(Color.gray)
                            .fontWeight(.light)
                            .font(.subheadline)}
                        else if scene == 2 {Text("original")
                            .foregroundColor(Color.gray)
                            .fontWeight(.light)
                            .font(.subheadline)}
                        else {Text("discount")
                            .foregroundColor(Color.gray)
                            .fontWeight(.light)
                            .font(.subheadline)}
                    
                        Image(systemName: "repeat.circle.fill")
                            .font(.title3)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }
            }
        
        var discountOn: some View {
            Button(action: {
            }) {Text("education")
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
                }) {Text("education")
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
            }) {Text("original")
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
                }) {Text("original")
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
            }) {Text("discount")
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
                }) {Text("discount")
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
                        
                        Group{
                        Text("128GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$749" : "￥5799")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$849" : "￥6599")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("512GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$999" : "￥7799")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("1TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1399" : "￥10999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("2TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1799" : "￥14199")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Group{
                            Text("128GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$949" : "￥6999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("256GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1049" : "￥7799")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("512GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1199" : "￥8999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("1TB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1599" : "￥12199")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("2TB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1999" : "￥15399")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                    }
                    Spacer()
                }
                    Image("applecare")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding([.leading, .top, .trailing])
                    Text(region.isUS ? "$103" : "￥798")
                        .font(.headline)
                    Text("(BTS 20% off)")
                        .font(.headline)
                        .padding([.leading, .bottom, .trailing])
                }
                
                Group{
                Text("iPad Pro 12.9'' (5th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.all)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Group{
                        Text("128GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$999" : "￥7699")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1099" : "￥8499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("512GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1299" : "￥10099")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("1TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1699" : "￥13299")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("2TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$2099" : "￥16499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Group{
                        Text("128GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$1199" : "￥8899")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1299" : "￥9699")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("512GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1499" : "￥11299")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("1TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1899" : "￥14499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("2TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$2299" : "￥17699")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                }
                    Image("applecare")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding([.leading, .top, .trailing])
                    Text(region.isUS ? "$119" : "￥948")
                        .font(.headline)
                    Text("(BTS 20% off)")
                        .font(.headline)
                        .padding([.leading, .bottom, .trailing])
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
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$549" : "￥3999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$699" : "￥5099")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$699" : "￥5099")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$849" : "￥6199")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
                    Image("applecare")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding([.leading, .top, .trailing])
                    Text(region.isUS ? "$63" : "￥498")
                        .font(.headline)
                    Text("(BTS 20% off)")
                        .font(.headline)
                        .padding([.leading, .bottom, .trailing])
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
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$449" : "￥3399")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$599" : "￥4599")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$599" : "￥4499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$749" : "￥5799")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
                    Image("applecare")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding([.leading, .top, .trailing])
                    Text(region.isUS ? "$69" : "￥548")
                        .font(.headline)
                    Text("(No BTS promo)")
                        .font(.headline)
                        .padding([.leading, .bottom, .trailing])
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
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$309" : "￥2399")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$459" : "￥3499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$439" : "￥3299")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$589" : "￥4499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
                    Image("applecare")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding([.leading, .top, .trailing])
                    Text(region.isUS ? "$69" : "￥548")
                        .font(.headline)
                    Text("(No BTS promo)")
                        .font(.headline)
                        .padding([.leading, .bottom, .trailing])
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
                        
                        Group{
                        Text("128GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$799" : "￥6199")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$899" : "￥6999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("512GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1099" : "￥8599")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("1TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1499" : "￥11799")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("2TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1899" : "￥14999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Group{
                            Text("128GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$999" : "￥7399")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("256GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1099" : "￥8199")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("512GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1299" : "￥9799")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("1TB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1699" : "￥12999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("2TB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$2099" : "￥16199")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                    }
                    Spacer()
                }
                    Image("applecare")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding([.leading, .top, .trailing])
                    Text(region.isUS ? "$129" : "￥998")
                        .font(.headline)
                        .padding([.leading, .bottom, .trailing])
                }
                
                Group{
                Text("iPad Pro 12.9'' (5th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.all)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Group{
                        Text("128GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$1099" : "￥8499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1199" : "￥9299")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("512GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1399" : "￥10899")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("1TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1799" : "￥14099")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("2TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$2199" : "￥17299")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Group{
                        Text("128GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$1299" : "￥9699")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1399" : "￥10499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("512GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1599" : "￥12099")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("1TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$1999" : "￥15299")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("2TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$2399" : "￥18499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                }
                    Image("applecare")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding([.leading, .top, .trailing])
                    Text(region.isUS ? "$149" : "￥1198")
                        .font(.headline)
                        .padding([.leading, .bottom, .trailing])
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
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$599" : "￥4399")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$749" : "￥5499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$749" : "￥5499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$899" : "￥6599")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
                    Image("applecare")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding([.leading, .top, .trailing])
                    Text(region.isUS ? "$79" : "￥548")
                        .font(.headline)
                        .padding([.leading, .bottom, .trailing])
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
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$499" : "￥3799")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$649" : "￥4999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$649" : "￥4999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$799" : "￥6199")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
                    Image("applecare")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding([.leading, .top, .trailing])
                    Text(region.isUS ? "$69" : "￥548")
                        .font(.headline)
                        .padding([.leading, .bottom, .trailing])
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
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$329" : "￥2499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$479" : "￥3699")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$459" : "￥3499")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$609" : "￥4699")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
                    Image("applecare")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding([.leading, .top, .trailing])
                    Text(region.isUS ? "$69" : "￥548")
                        .font(.headline)
                        .padding([.leading, .bottom, .trailing])
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
                        
                        Group{
                        Text("128GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$50" : "￥400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$50" : "￥400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("512GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$100" : "￥800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("1TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$100" : "￥800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("2TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$100" : "￥800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Group{
                            Text("128GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$50" : "￥400")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("256GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$50" : "￥400")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("512GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$100" : "￥800")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("1TB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$100" : "￥800")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("2TB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$100" : "￥800")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                    }
                    Spacer()
                }
                    Image("applecare")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding([.leading, .top, .trailing])
                    Text(region.isUS ? "$26" : "￥200")
                        .font(.headline)
                    Text("(BTS 20% off)")
                        .font(.headline)
                        .padding([.leading, .bottom, .trailing])
                }
                
                Group{
                Text("iPad Pro 12.9'' (5th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.all)
                HStack{
                    Spacer()
                    VStack{
                        Text("WiFi")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Group{
                        Text("128GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$100" : "￥800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$100" : "￥800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("512GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$100" : "￥800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("1TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$100" : "￥800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("2TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$100" : "￥800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Group{
                        Text("128GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$100" : "￥800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$100" : "￥800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("512GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$100" : "￥800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("1TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$100" : "￥800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("2TB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$100" : "￥800")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                }
                    Image("applecare")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding([.leading, .top, .trailing])
                    Text(region.isUS ? "$30" : "￥250")
                        .font(.headline)
                    Text("(BTS 20% off)")
                        .font(.headline)
                        .padding([.leading, .bottom, .trailing])
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
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$50" : "￥400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$50" : "￥400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$50" : "￥400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$50" : "￥400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
                    Image("applecare")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding([.leading, .top, .trailing])
                    Text(region.isUS ? "$16" : "￥150")
                        .font(.headline)
                    Text("(BTS 20% off)")
                        .font(.headline)
                        .padding([.leading, .bottom, .trailing])
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
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$50" : "￥400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$50" : "￥400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$50" : "￥500")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$50" : "￥400")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
                    
                    Text("(No BTS promo)")
                        .font(.headline)
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
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$20" : "￥100")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$20" : "￥200")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                    VStack{
                        Text("WiFi + Cellular")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("64GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$20" : "￥200")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        
                        Text("256GB")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$20" : "￥200")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
                    Text("(No BTS promo)")
                        .font(.headline)
                        .padding(.all)
                }
                
            }
            
        }
        .navigationTitle("iPad")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton, trailing: switchButton)
    }
}

    struct macPricing: View {
            
        @Environment(\.dismiss) private var dismiss
        @Environment(\.colorScheme) var colorScheme
        @EnvironmentObject var region: RegionSettings
            
        @State private var scene = 1
        
        var backButton: some View { Button(action: {
            dismiss()
                }) {
                        Image(systemName: "chevron.backward.circle.fill")
                            .font(.title3)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }
            }
        
        var switchButton: some View { Button(action: {
            if scene == 1 {scene = 2}
            else if scene == 2 {scene = 3}
            else {scene = 1}
            }) {
                        if scene == 1 {Text("education")
                            .foregroundColor(Color.gray)
                            .fontWeight(.light)
                            .font(.subheadline)}
                        else if scene == 2 {Text("original")
                            .foregroundColor(Color.gray)
                            .fontWeight(.light)
                            .font(.subheadline)}
                        else {Text("discount")
                            .foregroundColor(Color.gray)
                            .fontWeight(.light)
                            .font(.subheadline)}
                    
                        Image(systemName: "repeat.circle.fill")
                            .font(.title3)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }
            }
            
            var discountOn: some View {
                Button(action: {
                }) {Text("education")
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
                    }) {Text("education")
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
                }) {Text("original")
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
                    }) {Text("original")
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
                }) {Text("discount")
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
                    }) {Text("discount")
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
                            
                            Text("8GB+256GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1099" : "￥8749")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("8GB+512GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1399" : "￥11149")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("16GB+1TB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1759" : "￥13849")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        Spacer()
                        VStack{
                            Text("M1 Series")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("8GB+256GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$899" : "￥7199")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Spacer()
                        }
                        Spacer()
                    }
                        Image("applecare")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "M2 - $183" : "M2 - ￥1098")
                            .font(.headline)
                        Text(region.isUS ? "M1 - $159" : "M1 - ￥998")
                            .font(.headline)
                        Text("(BTS 20% off)")
                            .font(.headline)
                            .padding([.leading, .bottom, .trailing])
                    }
                    
                    Group{
                    Text("MacBook Pro")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Group{
                            Text("14''")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("16GB+512GB(M1 Pro)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1849" : "￥13899")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("16GB+1TB(M1 Pro)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$2299" : "￥17499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("64GB+2TB(M1 Max)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$3739" : "￥28299")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            }
                            
                            Group{
                            Text("13'' (M2)")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.all)
                            
                            Text("8GB+256GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1199" : "￥9249")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("8GB+512GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1399" : "￥10749")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                                
                            Text("24GB+1TB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1939" : "￥14799")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            }
                        }
                        Spacer()
                        VStack{
                            Text("16''")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("16GB+512GB(M1 Pro)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$2299" : "￥17499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("16GB+1TB(M1 Pro)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$2499" : "￥18999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("32GB+1TB(M1 Max)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$3199" : "￥24199")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                                
                            Text("64GB+4TB(M1 Max)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$4459" : "￥33649")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        Spacer()
                    }
                        Image("applecare")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "13'' - $199" : "13'' - ￥1298")
                            .font(.headline)
                        Text(region.isUS ? "14'' - $223" : "14'' - ￥1398")
                            .font(.headline)
                        Text(region.isUS ? "16'' - $319" : "16'' - ￥2048")
                            .font(.headline)
                        Text("(BTS 20% off)")
                            .font(.headline)
                            .padding([.leading, .bottom, .trailing])
                    }
                    
                    Group{
                    Text("iMac")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("7-Core GPU \("8GB+256GB")")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1249" : "￥9599")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("8-Core GPU \("8GB+256GB")")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1399" : "￥10699")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        Spacer()
                        VStack{
                            Text("8GB+512GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1599" : "￥12199")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("16GB+1TB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1959" : "￥14899")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Spacer()
                        }
                        Spacer()
                    }
                        Image("applecare")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$135" : "￥918")
                            .font(.headline)
                        Text("(BTS 20% off)")
                            .font(.headline)
                            .padding([.leading, .bottom, .trailing])
                    }
                    
                    Group{
                    Text("Desktop Mac")
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
                            
                            Text("8GB+256GB(M1)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$649" : "￥4899")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("8GB+512GB(M1)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$849" : "￥6399")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("8GB+512GB(Intel)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1049" : "￥7899")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        Spacer()
                        VStack{
                            Text("Mac Studio")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("32GB+512GB(M1 Max)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1799" : "￥13499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("64GB+1TB(M1 Ultra)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$3599" : "￥26999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        Spacer()
                    }
                        Image("applecare")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "Mac mini - $89" : "Mac mini - ￥681")
                            .font(.headline)
                        Text(region.isUS ? "Mac Studio - $149" : "Mac Studio - ￥1198")
                            .font(.headline)
                        Text("(No BTS promo)")
                            .font(.headline)
                            .padding([.leading, .bottom, .trailing])
                    }
                    
                    Group{
                    Text("Studio Display")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("Standard Glass")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1499" : "￥10799")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("+ Height-Adjustable Stand")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1899" : "￥13799")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        Spacer()
                        VStack{
                            Text("Nano-Texture Glass")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1799" : "￥12799")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("+ Height-Adjustable Stand")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$2199" : "￥15799")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        Spacer()
                    }
                        Image("applecare")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$129" : "￥898")
                            .font(.headline)
                        Text("(No BTS promo)")
                            .font(.headline)
                            .padding([.leading, .bottom, .trailing])
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
                            
                            Text("8GB+256GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1199" : "￥9499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("8GB+512GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1499" : "￥11899")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("16GB+1TB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1899" : "￥14899")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        Spacer()
                        VStack{
                            Text("M1 Series")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("8GB+256GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$999" : "￥7999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Spacer()
                        }
                        Spacer()
                    }
                        Image("applecare")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "M2 - $229" : "M2 - ￥1398")
                            .font(.headline)
                        Text(region.isUS ? "M1 - $199" : "M1 - ￥1248")
                            .font(.headline)
                            .padding([.leading, .bottom, .trailing])
                    }
                    
                    Group{
                    Text("MacBook Pro")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Group{
                            Text("14''")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("16GB+512GB(M1 Pro)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1999" : "￥14999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("16GB+1TB(M1 Pro)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$2499" : "￥18999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("64GB+2TB(M1 Max)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$4099" : "￥30999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            }
                            
                            Group{
                            Text("13'' (M2)")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.all)
                            
                            Text("8GB+256GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1299" : "￥9999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("8GB+512GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1499" : "￥11499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                                
                            Text("24GB+1TB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$2099" : "￥15999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            }
                        }
                        Spacer()
                        VStack{
                            Text("16''")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("16GB+512GB(M1 Pro)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$2499" : "￥18999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("16GB+1TB(M1 Pro)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$2699" : "￥20499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("32GB+1TB(M1 Max)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$3499" : "￥26499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                                
                            Text("64GB+4TB(M1 Max)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$4899" : "￥36999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        Spacer()
                    }
                        Image("applecare")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "13'' - $249" : "13'' - ￥1648")
                            .font(.headline)
                        Text(region.isUS ? "14'' - $279" : "14'' - ￥1748")
                            .font(.headline)
                        Text(region.isUS ? "16'' - $399" : "16'' - ￥2598")
                            .font(.headline)
                            .padding([.leading, .bottom, .trailing])
                    }
                    
                    Group{
                    Text("iMac")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("7-Core GPU \("8GB+256GB")")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1299" : "￥9999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("8-Core GPU \("8GB+256GB")")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1499" : "￥11499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        Spacer()
                        VStack{
                            Text("8GB+512GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1699" : "￥12999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("16GB+1TB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$2099" : "￥15999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Spacer()
                        }
                        Spacer()
                    }
                        Image("applecare")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$169" : "￥1168")
                            .font(.headline)
                            .padding([.leading, .bottom, .trailing])
                    }
                    
                    Group{
                    Text("Desktop Mac")
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
                            
                            Text("8GB+256GB(M1)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$699" : "￥5299")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("8GB+512GB(M1)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$899" : "￥6799")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("8GB+512GB(Intel)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1099" : "￥8299")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        Spacer()
                        VStack{
                            Text("Mac Studio")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("32GB+512GB(M1 Max)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1999" : "￥14999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("64GB+1TB(M1 Ultra)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$3999" : "￥29999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        Spacer()
                    }
                        Image("applecare")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "Mac mini - $99" : "Mac mini - ￥681")
                            .font(.headline)
                        Text(region.isUS ? "Mac Studio - $169" : "Mac Studio - ￥1198")
                            .font(.headline)
                            .padding([.leading, .bottom, .trailing])
                    }
                    
                    Group{
                    Text("Studio Display")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("Standard Glass")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1599" : "￥11499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("+ Height-Adjustable Stand")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$1999" : "￥14499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        Spacer()
                        VStack{
                            Text("Nano-Texture Glass")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$1899" : "￥13499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("+ Height-Adjustable Stand")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$2299" : "￥16499")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        Spacer()
                    }
                        Image("applecare")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$149" : "￥898")
                            .font(.headline)
                            .padding([.leading, .bottom, .trailing])
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
                            
                            Text("8GB+256GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$100" : "￥750")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("8GB+512GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$100" : "￥750")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("16GB+1TB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$140" : "￥1050")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        Spacer()
                        VStack{
                            Text("M1 Series")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("8GB+256GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$100" : "￥800")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        Spacer()
                    }
                        Image("applecare")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "M2 - $46" : "M2 - ￥300")
                            .font(.headline)
                        Text(region.isUS ? "M1 - $40" : "M1 - ￥250")
                            .font(.headline)
                        Text("(BTS 20% off)")
                            .font(.headline)
                            .padding([.leading, .bottom, .trailing])
                    }
                    
                    Group{
                    Text("MacBook Pro")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Group{
                            Text("14''")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("15GB+512GB(M1 Pro)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$150" : "￥1100")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("16GB+1TB(M1 Pro)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$200" : "￥1500")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("64GB+2TB(M1 Max)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$360" : "￥2700")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            }
                            
                            Group{
                            Text("13'' (M2)")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.all)
                            
                            Text("8GB+256GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$100" : "￥750")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("8GB+512GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$100" : "￥750")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                                
                            Text("24GB+1TB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$160" : "￥1200")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            }
                        }
                        Spacer()
                        VStack{
                            Text("16''")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("16GB+512GB(M1 Pro)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$200" : "￥1500")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("16GB+1TB(M1 Pro)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$200" : "￥1500")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("32GB+1TB(M1 Max)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$300" : "￥2300")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                                
                            Text("64GB+4TB(M1 Max)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$440" : "￥3350")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        Spacer()
                    }
                        Image("applecare")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "13'' - $50" : "13'' - ￥400")
                            .font(.headline)
                        Text(region.isUS ? "14'' - $56" : "14'' - ￥350")
                            .font(.headline)
                        Text(region.isUS ? "16'' - $80" : "16'' - ￥550")
                            .font(.headline)
                        Text("(BTS 20% off)")
                            .font(.headline)
                            .padding([.leading, .bottom, .trailing])
                    }
                    
                    Group{
                    Text("iMac")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("7-Core GPU \("8GB+256GB")")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$50" : "￥400")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("8-Core GPU \("8GB+256GB")")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$100" : "￥800")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        Spacer()
                        VStack{
                            Text("8GB+512GB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$100" : "￥800")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("16GB+1TB")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$140" : "￥1100")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Spacer()
                        }
                        Spacer()
                    }
                        Image("applecare")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$34" : "￥250")
                            .font(.headline)
                        Text("(BTS 20% off)")
                            .font(.headline)
                            .padding([.leading, .bottom, .trailing])
                    }
                    
                    Group{
                    Text("Desktop Mac")
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
                            
                            Text("8GB+256GB(M1)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$50" : "￥400")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("8GB+512GB(M1)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$50" : "￥400")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("8GB+512GB(Intel)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$50" : "￥400")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        Spacer()
                        VStack{
                            Text("Mac Studio")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("32GB+512GB(M1 Max)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$200" : "￥1500")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("64GB+1TB(M1 Ultra)")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$400" : "￥3000")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        Spacer()
                    }
                        Text("(No BTS promo)")
                            .font(.headline)
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
                            Text("Standard Glass")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$100" : "￥700")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("+ Height-Adjustable Stand")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$100" : "￥700")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        Spacer()
                        VStack{
                            Text("Nano-Texture Glass")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .top, .trailing])
                            Text(region.isUS ? "$100" : "￥700")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                            
                            Text("+ Height-Adjustable Stand")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Text(region.isUS ? "$100" : "￥700")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        Spacer()
                    }
                        Text("(No BTS promo)")
                            .font(.headline)
                            .padding(.all)
                    }
                    
                }
            }
            .navigationTitle("Mac")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton, trailing: switchButton)
        }
    }

    struct accPricing: View {
        
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var region: RegionSettings
        
    @State private var scene = 1
    
    var backButton: some View { Button(action: {
        dismiss()
            }) {
                    Image(systemName: "chevron.backward.circle.fill")
                        .font(.title3)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            }
        }
        
        var switchButton: some View { Button(action: {
            if scene == 1 {scene = 2}
            else if scene == 2 {scene = 3}
            else {scene = 1}
            }) {
                        if scene == 1 {Text("education")
                            .foregroundColor(Color.gray)
                            .fontWeight(.light)
                            .font(.subheadline)}
                        else if scene == 2 {Text("original")
                            .foregroundColor(Color.gray)
                            .fontWeight(.light)
                            .font(.subheadline)}
                        else {Text("discount")
                            .foregroundColor(Color.gray)
                            .fontWeight(.light)
                            .font(.subheadline)}
                    
                        Image(systemName: "repeat.circle.fill")
                            .font(.title3)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }
            }
        
        var discountOn: some View {
            Button(action: {
            }) {Text("education")
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
                }) {Text("education")
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
            }) {Text("original")
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
                }) {Text("original")
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
            }) {Text("discount")
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
                }) {Text("discount")
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
                    Text("iPad Acc.")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("1st-Gen \("Apple Pencil")")
                               .fixedSize(horizontal: false, vertical: true)
                               .font(.body)
                               .multilineTextAlignment(.center)
                               .padding([.leading, .top, .trailing], 10.0)
                            Text(region.isUS ? "$89" : "￥645")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("2nd-Gen \("Apple Pencil")")
                               .fixedSize(horizontal: false, vertical: true)
                               .font(.body)
                               .multilineTextAlignment(.center)
                               .padding([.leading, .top, .trailing], 10.0)
                            Text(region.isUS ? "$119" : "￥895")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("Magic Keyboard \("10.9/11''")")
                               .fixedSize(horizontal: false, vertical: true)
                               .font(.body)
                               .multilineTextAlignment(.center)
                               .padding([.leading, .top, .trailing], 10.0)
                            Text(region.isUS ? "$279" : "￥2199")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("Magic Keyboard \("12.9''")")
                               .fixedSize(horizontal: false, vertical: true)
                               .font(.body)
                               .multilineTextAlignment(.center)
                               .padding([.leading, .top, .trailing], 10.0)
                            Text(region.isUS ? "$329" : "￥2549")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                        }
                        Spacer()
                        VStack{
                            Text("Smart Keyboard \("10.2''")")
                               .fixedSize(horizontal: false, vertical: true)
                               .font(.body)
                               .multilineTextAlignment(.center)
                               .padding([.leading, .top, .trailing], 10.0)
                            Text(region.isUS ? "$149" : "￥1159")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("Smart Keyboard Folio \("10.9/11''")")
                               .fixedSize(horizontal: false, vertical: true)
                               .font(.body)
                               .multilineTextAlignment(.center)
                               .padding([.leading, .top, .trailing], 10.0)
                            Text(region.isUS ? "$159" : "￥1199")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("Smart Keyboard Folio \("12.9''")")
                               .fixedSize(horizontal: false, vertical: true)
                               .font(.body)
                               .multilineTextAlignment(.center)
                               .padding([.leading, .top, .trailing], 10.0)
                            Text(region.isUS ? "$179" : "￥1409")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Spacer()
                    }
                    Spacer()
                    }
                    
                }
                
                Group{
                Text("Mac Apps")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Spacer()
                VStack{
                        Text("Pro Apps Education Bundle")
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
                        Text("Bundle Price")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$199.99" : "￥1298")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        }
                    }
                
            } else if scene == 2 {
                HStack{
                    discountOff
                    originalOn
                    differenceOff
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Group{
                    Text("iPad Acc.")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Spacer()
                        VStack{
                            Text("1st-Gen \("Apple Pencil")")
                               .fixedSize(horizontal: false, vertical: true)
                               .font(.body)
                               .multilineTextAlignment(.center)
                               .padding([.leading, .top, .trailing], 10.0)
                            Text(region.isUS ? "$99" : "￥722")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("2nd-Gen \("Apple Pencil")")
                               .fixedSize(horizontal: false, vertical: true)
                               .font(.body)
                               .multilineTextAlignment(.center)
                               .padding([.leading, .top, .trailing], 10.0)
                            Text(region.isUS ? "$129" : "￥969")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("Magic Keyboard \("10.9/11''")")
                               .fixedSize(horizontal: false, vertical: true)
                               .font(.body)
                               .multilineTextAlignment(.center)
                               .padding([.leading, .top, .trailing], 10.0)
                            Text(region.isUS ? "$299" : "￥2399")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("Magic Keyboard \("12.9''")")
                               .fixedSize(horizontal: false, vertical: true)
                               .font(.body)
                               .multilineTextAlignment(.center)
                               .padding([.leading, .top, .trailing], 10.0)
                            Text(region.isUS ? "$349" : "￥2699")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                        }
                        Spacer()
                        VStack{
                            Text("Smart Keyboard \("10.2''")")
                               .fixedSize(horizontal: false, vertical: true)
                               .font(.body)
                               .multilineTextAlignment(.center)
                               .padding([.leading, .top, .trailing], 10.0)
                            Text(region.isUS ? "$159" : "￥1239")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("Smart Keyboard Folio \("10.9/11''")")
                               .fixedSize(horizontal: false, vertical: true)
                               .font(.body)
                               .multilineTextAlignment(.center)
                               .padding([.leading, .top, .trailing], 10.0)
                            Text(region.isUS ? "$179" : "￥1399")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Text("Smart Keyboard Folio \("12.9''")")
                               .fixedSize(horizontal: false, vertical: true)
                               .font(.body)
                               .multilineTextAlignment(.center)
                               .padding([.leading, .top, .trailing], 10.0)
                            Text(region.isUS ? "$199" : "￥1558")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing], 10.0)
                            Spacer()
                    }
                    Spacer()
                    }}
                
                Group{
                Text("Mac Apps")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Spacer()
                VStack{
                        Text("Pro Apps Education Bundle")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                    
                    Group{
                        Text("Final Cut Pro")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$299.99" : "￥1998")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        Text("Logic Pro")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$199.99" : "￥1298")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        Text("Motion")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$49.99" : "￥328")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        Text("Compressor")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$49.99" : "￥328")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        Text("MainStage")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$29.99" : "￥198")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                    }
                    
                        Text("Total")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .top, .trailing])
                        Text(region.isUS ? "$629.95" : "￥4150")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        }
                    }
                
            } else {
                HStack{
                    discountOff
                    originalOff
                    differenceOn
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Group{
                Text("iPad Acc.")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    VStack{
                        Text("1st-Gen \("Apple Pencil")")
                           .fixedSize(horizontal: false, vertical: true)
                           .font(.body)
                           .multilineTextAlignment(.center)
                           .padding([.leading, .top, .trailing], 10.0)
                        Text(region.isUS ? "$10" : "￥77")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("2nd-Gen \("Apple Pencil")")
                           .fixedSize(horizontal: false, vertical: true)
                           .font(.body)
                           .multilineTextAlignment(.center)
                           .padding([.leading, .top, .trailing], 10.0)
                        Text(region.isUS ? "$10" : "￥74")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("Magic Keyboard \("10.9/11''")")
                           .fixedSize(horizontal: false, vertical: true)
                           .font(.body)
                           .multilineTextAlignment(.center)
                           .padding([.leading, .top, .trailing], 10.0)
                        Text(region.isUS ? "$20" : "￥200")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("Magic Keyboard \("12.9''")")
                           .fixedSize(horizontal: false, vertical: true)
                           .font(.body)
                           .multilineTextAlignment(.center)
                           .padding([.leading, .top, .trailing], 10.0)
                        Text(region.isUS ? "$20" : "￥150")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                    }
                    Spacer()
                    VStack{
                        Text("Smart Keyboard \("10.2''")")
                           .fixedSize(horizontal: false, vertical: true)
                           .font(.body)
                           .multilineTextAlignment(.center)
                           .padding([.leading, .top, .trailing], 10.0)
                        Text(region.isUS ? "$10" : "￥80")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("Smart Keyboard Folio \("10.9/11''")")
                           .fixedSize(horizontal: false, vertical: true)
                           .font(.body)
                           .multilineTextAlignment(.center)
                           .padding([.leading, .top, .trailing], 10.0)
                        Text(region.isUS ? "$20" : "￥200")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Text("Smart Keyboard Folio \("12.9''")")
                           .fixedSize(horizontal: false, vertical: true)
                           .font(.body)
                           .multilineTextAlignment(.center)
                           .padding([.leading, .top, .trailing], 10.0)
                        Text(region.isUS ? "$20" : "￥149")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing], 10.0)
                        Spacer()
                }
                Spacer()
                }}
            
            Group{
            Text("Mac Apps")
                .font(.title)
                .fontWeight(.bold)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer()
            VStack{
                    Text("Pro Apps Education Bundle")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(region.isUS ? "$426.96" : "￥2852")
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
        .navigationBarItems(leading: backButton, trailing: switchButton)
    }
}
    
    struct infoPage: View {
        
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var region: RegionSettings
        
    
    var backButton: some View { Button(action: {
        dismiss()
            }) {
                    Image(systemName: "chevron.backward.circle.fill")
                        .font(.title3)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            }
        }
        
    var body: some View {
        ScrollView{
            
//            if !region.isUS {
//                Group{
//                    Text("Summer Shopping Event")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//                    Image("Summer")
//                        .resizable()
//                        .scaledToFit()
//                        .padding([.leading, .bottom, .trailing])
//                }
//            }
            
            Group{
            Text("Service Pricing")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Group{
            Text("iPad Pro 11'' (3rd Gen)")
                .font(.title)
                .fontWeight(.bold)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Group{
                Text("AC+ Service Pricing")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Text(region.isUS ? "$49" : "￥368")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .bottom, .trailing])
                
                Text("Out-of-Warranty Service Pricing")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .bottom,.trailing])
                    HStack{
                        VStack{
                            Text("WiFi")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text(region.isUS ? "$499" : "￥3799")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                        }
                        VStack{
                            Text("WiFi + Cellular")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text(region.isUS ? "$549" : "￥4199")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                        }
                    }
                
                Text("Battery Replacement")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Text(region.isUS ? "$99" : "￥799")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                }
            }
                Spacer()
            }
            
            Group{
            Text("iPad Pro 12.9'' (5th Gen)")
                .font(.title)
                .fontWeight(.bold)
                .padding(.all)
            VStack{
                Group{
                Text("AC+ Service Pricing")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Text(region.isUS ? "$49" : "￥368")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .bottom, .trailing])
                
                Text("Out-of-Warranty Service Pricing")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .bottom,.trailing])
                    HStack{
                        VStack{
                            Text("WiFi")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text(region.isUS ? "$699" : "￥5399")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                        }
                        VStack{
                            Text("WiFi + Cellular")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text(region.isUS ? "$749" : "￥5699")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                        }
                    }
                
                Text("Battery Replacement")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Text(region.isUS ? "$99" : "￥799")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                }
            }
                Spacer()
            }
            
            Group{
            Text("iPad Air (5th Gen)")
                .font(.title)
                .fontWeight(.bold)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Group{
                Text("AC+ Service Pricing")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Text(region.isUS ? "$49" : "￥368")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .bottom, .trailing])
                
                Text("Out-of-Warranty Service Pricing")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .bottom,.trailing])
                    HStack{
                        VStack{
                            Text("WiFi")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text(region.isUS ? "$419" : "￥3099")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                        }
                        VStack{
                            Text("WiFi + Cellular")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text(region.isUS ? "$469" : "￥3419")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                        }
                    }
                
                Text("Battery Replacement")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Text(region.isUS ? "$99" : "￥799")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                }
            }
                Spacer()
            }
            
            Group{
            Text("iPad mini (6th Gen)")
                .font(.title)
                .fontWeight(.bold)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Group{
                Text("AC+ Service Pricing")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Text(region.isUS ? "$49" : "￥368")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .bottom, .trailing])
                
                Text("Out-of-Warranty Service Pricing")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .bottom,.trailing])
                    HStack{
                        VStack{
                            Text("WiFi")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text(region.isUS ? "$349" : "￥2549")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                        }
                        VStack{
                            Text("WiFi + Cellular")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                            Text(region.isUS ? "$399" : "￥2999")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .bottom, .trailing])
                        }
                    }
                
                Text("Battery Replacement")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Text(region.isUS ? "$99" : "￥799")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                }
            }
                Spacer()
            }
            
            Group{
                Text("iPad (9th Gen)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Spacer()
                    VStack{
                        Group{
                        Text("AC+ Service Pricing")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$49" : "￥368")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("Out-of-Warranty Service Pricing")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$249" : "￥1999")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("Battery Replacement")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$99" : "￥799")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                }
            }
            
            Group{
                Text("Apple Pencil")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack{
                    Group{
                    Text("AC+ Service Pricing")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    Text(region.isUS ? "$29" : "￥188")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom, .trailing])
                    
                    Text("Out-of-Warranty Service Pricing")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom,.trailing])
                        HStack{
                            VStack{
                                Text("1st-Gen")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .fixedSize(horizontal: false, vertical: true)
                                Text(region.isUS ? "$79" : "￥645")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding([.leading, .bottom, .trailing])
                            }
                            VStack{
                                Text("2nd-Gen")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .fixedSize(horizontal: false, vertical: true)
                                Text(region.isUS ? "$109" : "￥827")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding([.leading, .bottom, .trailing])
                            }
                        }
                    
                    Text("Battery Replacement")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    Text(region.isUS ? "$29" : "￥210")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    }
                }
                    Spacer()
                }
            
            Group{
                Text("Magic Keyboard")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack{
                    Group{
                    Text("AC+ Service Pricing")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    Text(region.isUS ? "$29" : "￥188")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom, .trailing])
                    
                    Text("Out-of-Warranty Service Pricing")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom,.trailing])
                        HStack{
                            VStack{
                                Text("10.9/11''")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .fixedSize(horizontal: false, vertical: true)
                                Text(region.isUS ? "-" : "￥1999")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            VStack{
                                Text("12.9''")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .fixedSize(horizontal: false, vertical: true)
                                Text(region.isUS ? "-" : "￥2329")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                    Spacer()
                }
            
            Group{
                Text("Smart Keyboard Folio")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack{
                    Group{
                    Text("AC+ Service Pricing")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    Text(region.isUS ? "$29" : "￥188")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom, .trailing])
                    
                    Text("Out-of-Warranty Service Pricing")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom,.trailing])
                        HStack{
                            VStack{
                                Text("10.9/11''")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .fixedSize(horizontal: false, vertical: true)
                                Text(region.isUS ? "-" : "￥1169")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            VStack{
                                Text("12.9''")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .fixedSize(horizontal: false, vertical: true)
                                Text(region.isUS ? "-" : "￥1329")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                    Spacer()
                }
            
            Group{
                Text("10.2'' Smart Keyboard")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Spacer()
                    VStack{
                        Group{
                        Text("AC+ Service Pricing")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "$29" : "￥188")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("Out-of-Warranty Service Pricing")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Text(region.isUS ? "-" : "￥1049")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                }
            
            Spacer()
        }
        .navigationTitle("info")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
