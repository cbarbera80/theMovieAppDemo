//
//  Date.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 21/02/21.
//

import Foundation

extension DateFormatter {
    
    static var yearFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter
    }()
}

extension Date {
    
    enum DateFormat {
        case year
       
        var formatter: DateFormatter {
            switch self {
            case .year:
                return .yearFormatter

            }
        }
    }
    
    func toString(format: DateFormat) -> String? {
        
        return format.formatter.string(from: self)
    }
}

extension NumberFormatter {
    
    static var durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .full
       
        return formatter
    }()
}

extension Double {
    
    enum DoubleFormat {
        case duration
    }
    
    func toString(format: DoubleFormat) -> String? {
        
        switch format {
        case .duration:
            return NumberFormatter.durationFormatter.string(from: self)
        }
    }
}
