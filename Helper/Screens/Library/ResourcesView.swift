//
//  LibraryView.swift
//  Helper
//
//  Created by Asror Aliqulov on 23/01/24.
//

import SwiftUI
import Charts
import SwiftyJSON

struct ResourcesView: View {
    @State var text:String = ""
    @State var sectors:[String] = []
    @State var amounts:[Double] = []
    var body: some View {
        Chart {
            ForEach(sectors.indices,id: \.self){index in
                BarMark(
                    x: .value("Sector", sectors[index]),
                    y: .value("Amount", amounts[index])
                )
                .foregroundStyle(by: .value("Sector", sectors[index]))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .annotation {
                    Text("\(amounts[index],specifier: "%.1f")")
                        .font(.system(size: 8))
                }
            }
            
        }
        .padding()
        .onAppear{
            loadJSON(fileName: "ToshkentShahri")
        }
    }
    func loadJSON(fileName:String){
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                let json = try JSON(data: data)
                getSectors(from: json)
            }
            catch{
                print(error.localizedDescription)
            }
        }
        else{
            print("Unable to load the file")
        }
    }
    func getSectors(from json: JSON){
        let datas = json[0]["data"]
        for data in datas.arrayValue{
            var jsonString = data["Klassifikator"].stringValue
            jsonString = jsonString.replacingOccurrences(of: "'", with: "`")
            sectors.append(jsonString)
            amounts.append(Double(data["2022"].stringValue)!)
        }
    }
}

#Preview {
    ResourcesView()
}
