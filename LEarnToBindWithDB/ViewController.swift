//
//  ViewController.swift
//  LEarnToBindWithDB
//
//  Created by BaranK Kutlu on 1.12.2021.
//

import UIKit

class ViewController: UIViewController, NoteManagerDelegate, UINavigationControllerDelegate {
    
    func didNoteFetch(note: String) {
        let decoder = JSONDecoder()
        do {
            notesArray = try decoder.decode([NoteModel].self, from: note.data(using: .utf8)!)
        } catch {
            print(error)
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    var notesArray = [NoteModel]()
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notes"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Note", style: .done, target: self, action: #selector(addNotePressed))
        
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        NoteManager.shared.delegate = self
        NoteManager.shared.fetchNotes()
        
        navigationController?.delegate = self
        
        
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
    }
    
    
    
    @objc func addNotePressed() {
        let vc = AddNoteViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.indentationLevel = 2
        
        cell.textLabel?.text = notesArray[indexPath.row].title
        cell.detailTextLabel?.text = notesArray[indexPath.row]._id
        print(notesArray[indexPath.row]._id)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CellDetailViewController()
        vc.note = notesArray[tableView.indexPathForSelectedRow!.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

