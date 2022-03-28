//
//  PersistentStorage.swift
//  VIPER_DI
//
//  Created by prakhar gupta on 01/03/22.
//

import Foundation
import CoreData


///
/// A persistent storage class to ave the context and fetching the object.
///
final class PersistentStorage
{
	private init() {}

	lazy var context = persistentContainer.viewContext
	static let shared = PersistentStorage()

	///  A persistent Container
	lazy var persistentContainer: NSPersistentContainer =
	{
		let container = NSPersistentContainer(name: "CoreData")
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError?
			{
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		return container
	}()
}


// MARK: - Core Data Saving support
extension PersistentStorage
{
	///
	/// Saving the context.
	///
	func saveContext()
	{
		if context.hasChanges
		{
			do
			{
				try context.save()
			} catch
			{
				let nserror = error as NSError
				fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
			}
		}
	}
}


// MARK: - Core Data fetch support
extension PersistentStorage
{
	///
	/// Fetching the object.
	///
	func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type) -> [T]?
	{
		do
		{
			guard let result = try PersistentStorage.shared.context
				.fetch(managedObject.fetchRequest()) as? [T]
			else
			{
				return nil
			}
			return result
		}
		catch let error
		{
			debugPrint(error)
		}
		return nil
	}
}
