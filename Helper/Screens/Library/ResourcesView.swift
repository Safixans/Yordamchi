//
//  LibraryView.swift
//  Helper
//
//  Created by Asror Aliqulov on 23/01/24.
//

import SwiftUI
import Charts
import SwiftyJSON
enum LocationJSON: String, CaseIterable {
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
struct ResourcesView: View {
    enum Sectors:String,CaseIterable{
        case qishloq = "Qishloq, o'rmon vа bаliq xo'jаligi"
        case togKon = "Tog`-kon sаnoаti vа ochiq konlаrni ishlаsh"
        case ishlabChiqarish = "Ishlab chiqarish sanoati"
        case qurilish = "Qurilish"
        case ilmiy = "Professionаl, ilmiy vа texnik fаoliyat"
        case boshqarish = "Boshqаrish bo'yichа fаoliyat vа yordаmchi xizmаtlаr ko'rsаtish"
        case davlatBoshqaruvi = "Dаvlаt boshqаruvi vа mudofаа; mаjburiy ijtimoiy tа'minot"
        case sanat = "Sаn'аt, ko'ngil ochish vа dаm olish"
        case boshqa = "Boshqа turdаgi xizmаtlаr ko'rsаtish"
        case elektr = "Elektr, gаz, bug` bilаn tа'minlаsh vа hаvoni konditsiyalаsh"
        case suv = "Suv bilаn tа'minlаsh; kаnаlizаtsiya tizimi, chiqindilаrni yig`ish vа utilizаtsiya qilish"
        case axborot = "Аxborot vа аloqа"
        case sugurta = "Moliyaviy vа sug`urtа fаoliyati"
        case tashish = "Tаshish vа sаqlаsh"
        case yashash = "Yashаsh vа ovqаtlаnish bo'yichа xizmаtlаr"
        case ulgurji = "Ulgurji vа chаkаnа sаvdo; motorli trаnsport vositаlаri vа mototsikllаrni tа'mirlаsh"
        case kochmas = "Ko'chmаs mulk bilаn operаtsiyalа"
        case talim = "Tа'lim"
        case sogliq = "Sog`liqni sаqlаsh vа ijtimoiy xizmаtlаr ko'rsаtish"
    }
    @State var text:String = ""
    let years = ["2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022"]
    @State var amounts:[Double] = []
    @State var selectedSector:Sectors = .qishloq
    @State var location:LocationJSON = .tashkent
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Hududni tanlang:")
                    Picker("", selection: $location) {
                        ForEach(LocationJSON.allCases,id: \.self){location in
                            Text(location.rawValue)
                                .lineLimit(1)
                                .tag(location)
                        }
                        
                    }
                    Spacer()
                }
                HStack{
                    Text("Sohani tanlang:")
                    Picker("", selection: $selectedSector) {
                        ForEach(Sectors.allCases,id: \.self){sector in
                            Text(sector.rawValue)
                                .lineLimit(1)
                                .tag(sector)
                            
                            
                        }
                        
                    }
                    Spacer()
                }
                
                Chart {
                    if amounts.count == 13{
                        ForEach(years.indices,id: \.self){index in
                            BarMark(
                                x: .value("Year", years[index]),
                                y: .value("Amount", amounts[index])
                            )
                            .foregroundStyle(by: .value("Year", years[index]))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .annotation {
                                Text("\(amounts[index],specifier: "%.1f")")
                                    .font(.system(size: 8))
                            }
                        }
                    }

                    
                }
                .frame(height: 400)
            }
            .padding()
            
        }
        .onChange(of: location) {
            loadJSON(fileName: location.rawValue)
        }
        .onChange(of: selectedSector) {
            loadJSON(fileName: location.rawValue)
        }
        .onAppear{
            loadJSON(fileName: location.rawValue)
        }
    }
    func loadJSON(fileName:String){
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                let json = try JSON(data: data)
                getData(from: json)
            }
            catch{
                print(error.localizedDescription)
            }
        }
        else{
            print("Unable to load the file")
        }
    }
    func getData(from json: JSON){
        let datas = json[0]["data"]
        amounts.removeAll()
        for data in datas.arrayValue{
            if selectedSector.rawValue == data["Klassifikator"].stringValue{
                amounts.append(Double(data["2010"].stringValue) ?? 0)
                amounts.append(Double(data["2011"].stringValue)  ?? 0)
                amounts.append(Double(data["2012"].stringValue) ?? 0)
                amounts.append(Double(data["2013"].stringValue) ?? 0)
                amounts.append(Double(data["2014"].stringValue) ?? 0)
                amounts.append(Double(data["2015"].stringValue)  ?? 0)
                amounts.append(Double(data["2016"].stringValue)  ?? 0)
                amounts.append(Double(data["2017"].stringValue)  ?? 0)
                amounts.append(Double(data["2018"].stringValue) ?? 0)
                amounts.append(Double(data["2019"].stringValue) ?? 0)
                amounts.append(Double(data["2020"].stringValue) ?? 0)
                amounts.append(Double(data["2021"].stringValue) ?? 0)
                amounts.append(Double(data["2022"].stringValue) ?? 0)
                
            }
        }
    }
}

#Preview {
    ResourcesView()
}
