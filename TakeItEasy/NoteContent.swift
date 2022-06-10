//
//  NoteContent.swift
//  TakeItEasy
//
//  Created by Jacob on 6/9/22.
//

import UIKit

class NoteContent: UIViewController {

    var header = ""
    var body = ""
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var content: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = header
        content.text = body
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("disapeared")
        DbHandler.dbHandler.updateNote(orig: header, title: name.text!, body: content.text!)
    }

}
