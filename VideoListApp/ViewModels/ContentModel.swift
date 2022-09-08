//
//  ContentModel.swift
//  VideoListApp
//
//  Created by Fidan Oruc on 08.09.22.
//

import Foundation

class ContentModel: ObservableObject{
    
    @Published var videos = [Video]()
    
    @Published var currentVideo: Video?
    var currentVideoIndex = 0
    
    init(){
        
        getRemoteData()
    }
    
    func getRemoteData(){
        
        let urlString = "https://codewithfidan.github.io/VideoListApp-data/Data.json"
        
        let url = URL(string: urlString)
        
        guard url != nil else{
            return
        }
        
        let request = URLRequest(url: url!)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, request, error in
            guard error == nil else{
                return
            }
            guard let data = data else {
                return
            }

            do{
                
                let decoder = JSONDecoder()
                
                let videoData = try decoder.decode([Video].self, from: data)
                
                DispatchQueue.main.async {
                    self.videos += videoData
                }
               
            }catch{
               //print(error)
            }
            
        }
        dataTask.resume()
        
        
    }
    
    func beginVideo(videoID: Int){
        
        for index in 0..<videos.count{
            
            if videos[index].id == videoID{
                currentVideoIndex = index
                break
            }
        }
        currentVideo = videos[currentVideoIndex]
    }
}
