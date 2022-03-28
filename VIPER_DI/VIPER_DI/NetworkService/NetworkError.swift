//
//  NetworkError.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import Foundation

///
/// A network error.
///
enum NetworkError: Error
{
    case unknown
    case noConnection
    case connectionRefused
    case timeout
    case notFound
}
