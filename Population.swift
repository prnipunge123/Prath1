//
//  Population.swift
//  MachineTest3
//
//  Created by Mac on 23/10/23.
//

import Foundation
struct PopulationApi : Codable{
    let data: [Population]
    enum population :String ,CodingKey{
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let data = try  decoder.container(keyedBy: population.self)
        self.data = try data.decode([Population].self, forKey: .data)
    }
}
struct Population : Codable{
    var idNation : String
    var nation  : String
    var year : String
    var population : Int
    var idYear : Int
    enum data :String , CodingKey {
        case nation = "Nation"
        case year = "Year"
        case population = "Population"
        case idNation = "ID Nation"
        case idYear = "ID Year"
    }
    init(from decoder: Decoder) throws {
   
        let eachdata = try decoder.container(keyedBy: data.self)
        self.population =  try eachdata.decode(Int.self, forKey: .population)
        self.nation = try eachdata.decode(String.self, forKey: .nation)
        self.year = try eachdata.decode(String.self, forKey: .year)
        self.idNation = try eachdata.decode(String.self, forKey: .idNation)
        self.idYear = try eachdata.decode(Int.self, forKey: .idYear)
        
    }
}
