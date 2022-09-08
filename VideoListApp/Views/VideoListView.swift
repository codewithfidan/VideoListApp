//
//  ContentView.swift
//  VideoListApp
//
//  Created by Fidan Oruc on 08.09.22.
//

import SwiftUI

struct VideoListView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var searchText = ""
    
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(filteredVideo){ video in
                        NavigationLink {
                            VideoDetailView().onAppear {
                                model.beginVideo(videoID: video.id)
                            }
                        } label: {
                            Text(video.title)
                        }
                    }
                }.listStyle(InsetListStyle())
                    .navigationTitle("All Videos")
                    .searchable(text: $searchText, prompt: "")
            }
        }.navigationViewStyle(.stack)
    }
    
    var filteredVideo: [Video]{
        if searchText.isEmpty{
            return model.videos
        }else{
            return model.videos.filter{$0.title.localizedCaseInsensitiveContains(searchText)}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
