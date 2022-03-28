//
//  Date.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 01/03/22.
//

import Foundation


extension Date
{
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int
    {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }

}
