//
//  AddNoteViewController.swift
//  LEarnToBindWithDB
//
//  Created by BaranK Kutlu on 8.12.2021.
//

import UIKit

//protocol CreateNoteDelegate {
//    func didCreateNote("title": title)
//}

class AddNoteViewController: UIViewController {
    

    
    
    
    let notes = [NoteModel]()
    let note = NoteManager()
    
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .quaternaryLabel
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8.0
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return textField
    }()
    
    private let noteTextView: UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 8.0
        textView.backgroundColor = .quaternaryLabel
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Note"
        
        view.addSubview(titleTextField)
        view.addSubview(noteTextView)
        
        
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonPressed))
    }
    
    override func viewDidLayoutSubviews() {
        titleTextField.frame = CGRect(x: 10, y: view.safeAreaInsets.top + 10, width: view.frame.size.width - 20, height: 30)
        noteTextView.frame = CGRect(x: 10, y: view.safeAreaInsets.top + 30 + 20, width: view.frame.size.width - 20, height: 80)
    }
    
    @objc func addButtonPressed() {
        note.createNotes(note: noteTextView.text!, title: titleTextField.text!, date: "date placeholder")
    }
    

}
