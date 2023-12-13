//
//  PlaylistRowView.swift
//  WeatherPlaylist
//
//  Created by seobe22 on 12/6/23.
//

import SwiftUI

struct PlaylistRowView: View {
    var id: String
    var songName: String
    var artist: String
    var coverImage: String
    var songTime: Int
    
    var body: some View {
        // MARK: 이미지 임시 구성
        HStack() {
            AsyncImage(url: URL(string: coverImage)) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 48, height: 48)
            .padding(.trailing, 24)
            
            VStack(alignment: .leading) {
                Text(songName)
                    .font(.bold16)
                    .foregroundStyle(.colorBlack)
                HStack {
                    Text(artist)
                        .font(.light14)
                        .foregroundStyle(.colorBlack)
                    Text(changeTimeIntToString(songTime))
                        .font(.light14)
                        .foregroundStyle(.colorBlack)
                }
            }
            Spacer()
        }
    }
    
    func changeTimeIntToString(_ time: Int) -> String {
        let totalSeconds = time / 1000
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        let second = seconds >= 10 ? String(seconds) : ("0" + String(seconds))
        return "\(minutes):\(second)"
    }
}
