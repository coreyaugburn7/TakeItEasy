//
//  DbHandler.swift
//  TakeItEasy
//
//  Created by admin on 6/8/22.
//

import Foundation
import UIKit
import CoreData

class DbHandler{
    static var dbHandler = DbHandler()
    
    private let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func createNote(title: String, body: String){
        let entry = NSEntityDescription.insertNewObject(forEntityName: "Journal", into: context!) as! Journal
        entry.title = title
        entry.body = body
        do{
            try context?.save()
            print("data saved")
        }
        catch{
            print("not saved")
        }
    }
    
    func retrieveNote(title: String) -> Journal{
        var entry = Journal()
        var fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Journal")
        fetchrequest.predicate = NSPredicate(format: "title == %@", title)
        do{
            let request = try context?.fetch(fetchrequest) as! [Journal]
            if(request.count != 0){
                entry = request.first as! Journal
            }
            else{
                print("entry not found")
            }
        }
        catch{
            print("Error")
        }
        return entry
    }
    
    func updateNote(title: String, body: String){
        var entry = Journal()
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Journal")
        fetchRequest.predicate = NSPredicate(format: "title == %@")
        do{
            let ent = try context?.fetch(fetchRequest) as! [Journal]
            if (ent.count != 0){
                entry = (ent.first)!
                entry.body = body
                try context?.save()
            }
        }
        catch{
            print("data not overwritten")
        }
    }
    
    func removeNote(name: String){
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Journal")
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        do{
            let entry = try context?.fetch(fetchRequest)
            context?.delete(entry?.first as! Journal)
            try context?.save()
            print("data deleted")
        }
        catch{
            print("error no data deleted")
        }
    }
}
