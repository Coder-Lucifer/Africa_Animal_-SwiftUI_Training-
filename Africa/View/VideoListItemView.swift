//
//  VideoListItem.swift
//  Africa
//
//  Created by Aviral on 23/04/21.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: - properties
    let video: VideoModel
    
    //MARK: - body
    var body: some View {
        HStack{
            ZStack {
                Image(video.videoThumbnail)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                    .frame(height:80)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height:32)
                    .shadow(radius: 4)
            }
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .font(.footnote)
            })
        }
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static let videosList: [VideoModel] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItemView(video: videosList[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
