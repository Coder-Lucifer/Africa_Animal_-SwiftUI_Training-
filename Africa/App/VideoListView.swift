//
//  VideoListView.swift
//  Africa
//
//  Created by Aviral on 22/04/21.
//

import SwiftUI

struct VideoListView: View {
    //MARK: - properties
    @State var videos: [VideoModel] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    //MARK: - body
    var body: some View {
        NavigationView {
            List{
                ForEach(videos){video in
                    NavigationLink(destination:VideoPlayerView(videoName: video.id, videoTitle: video.name)) {
                        VideoListItemView(video: video)
                            .padding(.vertical,8)
                    }
                }
            }.listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos",displayMode: .inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            })
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
