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
    
    func createNotes(note: String, title: String, date: String) {
        guard let url = URL(string: "http://192.168.1.20:8081/create") else {
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        var body: [String: AnyHashable] = [
//            "note": "aaa",
//            "title": "Hello from barank",
//            "date": "The quick browse jump over lazy dog, body: The quick browse jump over lazy dog"
//        ]
        request.addValue(note, forHTTPHeaderField: "note")
        request.addValue(title, forHTTPHeaderField: "title")
        request.addValue(date, forHTTPHeaderField: "date")

//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
//        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
//            guard let data = data, error == nil else {
//                return
//            }
//            print("error nil ")
//            do {
////                let response = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                let response = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print("Success: \(response)")
//            } catch {
//                print(error)
//            }
//        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
        //    semaphore.signal()
            return
          }
          print(String(data: data, encoding: .utf8)!)
        //  semaphore.signal()
        }
        task.resume()
    }
    
    
    func updateNote(note: String, title: String, date: String, _id: String) {
        guard let url = URL(string: "http://192.168.1.20:8081/update") else {
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "POST"
        request.addValue(_id, forHTTPHeaderField: "id")
        request.addValue(note, forHTTPHeaderField: "note")
        request.addValue(title, forHTTPHeaderField: "title")
        request.addValue(date, forHTTPHeaderField: "date")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
    func deleteNote(_id: String) {
        guard let url = URL(string: "http://192.168.1.20:8081/delete") else {
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "POST"
        request.addValue(_id, forHTTPHeaderField: "id")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
}
