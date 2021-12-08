////
////  NoteCell.swift
////  LEarnToBindWithDB
////
////  Created by BaranK Kutlu on 1.12.2021.
////
//
//import UIKit
//
//class NoteCell: UITableViewCell /*, NoteManagerDelegate */ {
//    
////    func didNoteFetch(note: [NoteModel]) {
//////        DispatchQueue.main.async {
//////            self.noteLabel.text = note.last?.title
//////            print(note.first?._id)
//////        }
//////        print(note)
//////        let notes = note.map { $0.date }
//////        print(notes)
//////        print(note[1])
////
////
////
////    }
//    
//    
//
//    var noteManager = NoteManager()
//    
//    private let noteLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.attributedText = NSAttributedString(string: "NOTE1", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 48, weight: .medium)])
//        return label
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        addSubview(noteLabel)
////        noteManager.delegate = self
////        noteManager.fetchNotes()
//        
//        
//        NSLayoutConstraint.activate([
//            noteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            noteLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            noteLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
//        ])
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("oooooooooo")
//    }
//
//    
//
//}
