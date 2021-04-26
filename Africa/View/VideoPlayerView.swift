//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Aviral on 23/04/21.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK: - properties
    let videoName: String
    let videoTitle: String
    
    //MARK: - body
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoName, fileFormat: "mp4"))
            .overlay(
                Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding()
                ,alignment: .topLeading
            )
        }
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle,displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoName: "lion", videoTitle: "Lion")
        }
    }
}
