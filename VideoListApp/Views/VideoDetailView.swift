//
//  VideoDetailView.swift
//  VideoListApp
//
//  Created by Fidan Oruc on 08.09.22.
//

import SwiftUI
import AVKit
struct VideoDetailView: View {
    @EnvironmentObject var model: ContentModel

    var body: some View {
        let url = URL(string: model.videos[model.currentVideoIndex].url)
            VStack{
                Text(model.videos[model.currentVideoIndex].title)
                    .bold()
                    .font(.title)
                
                if url != nil {
                    VideoPlayer(player: AVPlayer(url: url!))
                        .cornerRadius(10)
                        .frame(height: 250)
                        .padding()
                }
                Spacer()
            }
        
        
    }
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView()
    }
}
//model.currentVideo!.content.lessons[model.currentLessonIndex + 1].title)
