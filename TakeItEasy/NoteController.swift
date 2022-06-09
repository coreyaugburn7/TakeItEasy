//
//  NoteController.swift
//  TakeItEasy
//
//  Created by admin on 6/8/22.
//

import UIKit

class NoteController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let note = storyboard.instantiateViewController(withIdentifier: "content")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func add(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let note = storyboard.instantiateViewController(withIdentifier: "content")
        
    }
}
