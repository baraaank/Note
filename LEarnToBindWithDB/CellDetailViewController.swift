//
//  AddNoteViewController.swift
//  LEarnToBindWithDB
//
//  Created by BaranK Kutlu on 8.12.2021.
//

import UIKit
class CellDetailViewController: UIViewController {
    

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
    
    var note: NoteModel?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
        titleTextField.text = note!.title
        noteTextView.text = note!.note
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        title = "Update a note"
        
        view.addSubview(titleTextField)
        view.addSubview(noteTextView)
        
        print(note)
        
        
        let button1 = UIBarButtonItem(title: "Update", style: .done, target: self, action: #selector(updateButtonPressed))
        let button2 = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteNotePressed))
        
        navigationItem.rightBarButtonItems = [button1, button2]
        
        
    }
    
    override func viewDidLayoutSubviews() {
        titleTextField.frame = CGRect(x: 10, y: view.safeAreaInsets.top + 10, width: view.frame.size.width - 20, height: 30)
        noteTextView.frame = CGRect(x: 10, y: view.safeAreaInsets.top + 30 + 20, width: view.frame.size.width - 20, height: 80)
    }
    
    @objc func updateButtonPressed() {
        NoteManager.shared.updateNote(note: noteTextView.text!, title: titleTextField.text!, date: "date placeholder", _id: (note?._id)!)
    }
    
    @objc func deleteNotePressed() {
        NoteManager.shared.deleteNote(_id: (note?._id)!)
    }
    

}
