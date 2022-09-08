//
//  Video.swift
//  VideoListApp
//
//  Created by Fidan Oruc on 08.09.22.
//

import Foundation

struct Video: Identifiable,Decodable{
    
    var id: Int
    var title: String
    var url: String
}
