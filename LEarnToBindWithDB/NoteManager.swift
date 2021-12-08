//
//  NoteManager.swift
//  LEarnToBindWithDB
//
//  Created by BaranK Kutlu on 1.12.2021.
//

import Foundation

protocol NoteManagerDelegate {
    func didNoteFetch(note: String)
}


struct NoteManager {
    let noteURL = "http://192.168.1.20:8081"
    
    var delegate: NoteManagerDelegate?
    
    static var shared = NoteManager()
    
    func fetchNotes() {
        let urlString = "\(noteURL)/fetch"
        performFetch(with: urlString)
    }
    
    func performFetch(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    return
                }
                if let data = data {
                    self.delegate?.didNoteFetch(note: String(data: data, encoding: .utf8)!)
                }
            }
            task.resume()
        }
    }
    
//    func parseJson(_ noteData: Data) -> [NoteModel]? {
//
//    }
}
