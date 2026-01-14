//
//  CityFilter.swift
//  SeSAC8_260113_CityInfo
//
//  Created by Hwangseokbeom on 1/14/26.
//

enum CityFilter: Int {
    case all = 0
    case domestic
    case international
    
    var title: String {
        switch self {
        case .all: return "모두"
        case .domestic: return "국내"
        case .international: return "해외"
        }
    }
}
