//
//  NoteModel.swift
//  LEarnToBindWithDB
//
//  Created by BaranK Kutlu on 1.12.2021.
//

import Foundation


//struct Note: Codable {
//    let _ = [NoteModel]
//}


struct NoteModel: Codable {
    let _id: String
    let note: String
    let title: String
    let date: String
}
