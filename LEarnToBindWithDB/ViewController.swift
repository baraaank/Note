//
//  ViewController.swift
//  LEarnToBindWithDB
//
//  Created by BaranK Kutlu on 1.12.2021.
//

import UIKit

class ViewController: UIViewController, NoteManagerDelegate {
    
    func didNoteFetch(note: String) {
        let decoder = JSONDecoder()
        do {
            notesArray = try decoder.decode([NoteModel].self, from: note.data(using: .utf8)!)
//            print(notesArray)
        } catch {
            print(error)
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    
//    func didNoteFetch(note: [NoteModel]) {
//        var notes = note.map { $0.date }
//        print(notes[0])
//
////        notesArray.append(contentsOf: note)
////        print(note[0].title)
//        self.tableView.reloadData()
//    }
//
    var notesArray = [NoteModel]()
    
   // var noteManager = NoteManager()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//
////       noteManager.fetchNotes()
//
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        NoteManager.shared.delegate = self
        NoteManager.shared.fetchNotes()
//        print(notesArray)
        
//        print(notesArray)
        

        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
    }
    
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notesArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.accessoryType = .checkmark
        cell.indentationLevel = 5
        cell.editingStyle
        
        cell.textLabel?.text = notesArray[indexPath.row].title
        cell.detailTextLabel?.text = notesArray[indexPath.row]._id
        print(notesArray[indexPath.row]._id)
        
        
//        cell.textLabel?.text = "sa"
//        cell.textLabel?.text = notesArray[indexPath.row].date
        return cell
    }
    
    
}

