//
//  NoteController.swift
//  TakeItEasy
//
//  Created by Jacob on 6/8/22.
//

import UIKit
import CoreData

class NoteController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var table = DbHandler.dbHandler.retrieveAllNote()
    
    @IBOutlet weak var tv: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = table[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let note = storyboard.instantiateViewController(withIdentifier: "content") as! NoteContent
        note.header = table[indexPath.row
        ].title!
        note.body = table[indexPath.row].body!
        self.present(note, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(table)
        tv.reloadData()
        // Do any additional setup after loading the view.
    }

    @IBAction func add(_ sender: Any) {
        DbHandler.dbHandler.createNote(title: "new", body: "notes for you")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let note = storyboard.instantiateViewController(withIdentifier: "content") as! NoteContent
        note.header = "new"
        note.body = "notes for you"
        self.navigationController?.pushViewController(note, animated: true)
        //self.present(note, animated: true)

    }
}


