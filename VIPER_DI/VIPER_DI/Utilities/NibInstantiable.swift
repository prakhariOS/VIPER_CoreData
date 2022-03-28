//
//  NibInstantiable.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 25/02/22.
//

import UIKit

/// Load View from Xib
public protocol NibInstantiatable: NSObject
{
	/// Override the nibName if xib file has different name
	static var nibName: String { get }
}


public extension NibInstantiatable
{
	static var nibName: String { return String(describing: self) }

	static func instantiate() -> Self
	{
		return self.instantiate(name: nibName)
	}

	static func instantiate(owner: AnyObject?) -> Self
	{
		return self.instantiate(name: nibName, owner: owner)
	}

	static func instantiate(
		name: String,
		owner: AnyObject? = nil)
		-> Self
	{
		let nib = UINib(nibName: name, bundle: Bundle(for: self))
		guard let view = nib.instantiate(withOwner: owner, options: nil).first as? Self
		else { fatalError("failed to load \(name) nib file") }
		return view
	}
}


/// Load ViewController from Storyboard
public protocol StoryboardInstantiatable: NSObject
{
	/// Override the storyboardName if storyboard file has different name
	static var storyboardName: String { get }
}


public extension StoryboardInstantiatable
{
	static var storyboardName: String { return String(describing: self) }

	static func instantiate() -> Self
	{
		return self.instantiate(name: self.storyboardName)
	}

	static func instantiate(name: String) -> Self
	{
		let storyboard = UIStoryboard(name: name, bundle: Bundle(for: self))
		guard let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? Self
			else { fatalError("failed to load \(name) storyboard file.") }
		return viewController
	}
}
