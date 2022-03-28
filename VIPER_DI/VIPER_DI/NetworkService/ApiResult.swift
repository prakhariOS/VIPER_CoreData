//
//  ApiResult.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import Foundation

///
/// A API result.
///
struct ApiResult
{
	/// Is success or not.
    let success: Bool
    /// A message.
    let message: String

    init(dict: Dictionary<String, AnyObject>)
    {
		self.success = dict["success"] as? Bool ?? false
		self.message = (dict["message"] as? String)?.lowercased() ?? ""
    }
}
