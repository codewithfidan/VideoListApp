//
//  VideoListAppApp.swift
//  VideoListApp
//
//  Created by Fidan Oruc on 08.09.22.
//

import SwiftUI

@main
struct VideoListApp: App {
    var body: some Scene {
        WindowGroup {
            VideoListView().environmentObject(ContentModel())
        }
    }
}
