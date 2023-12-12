//
//  PlaylistScrollView.swift
//  WeatherPlaylist
//
//  Created by 김태훈 on 12/6/23.
//

import Foundation
import SwiftUI
struct PlaylistScrollView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    @State var title: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.bold20)
                Spacer()
            }.padding(.leading, 25)
                .padding(.top, 50)
                .padding(.bottom,-10)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(viewModel.playlistModelList) { model in
                        VStack(alignment:.leading) {
                            if let imageURL = model.image {
                                CachedImage(url: URL(string: imageURL)){phase in
                                    switch phase {
                                    case .success(let image) :
                                        image
                                            .resizable()
                                    case .failure(_), .empty:
                                        Image(uiImage: .emptyImage)
                                            .resizable()
                                    }
                                }.aspectRatio(contentMode: .fit)
                                    .frame(width: 100,height: 100)
                            } else {
                                Image(uiImage: .emptyImg)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100,height: 100)
                            }
                            Text(model.mainTitle)
                                .font(.bold14)
                            Text(model.singers ?? "가수들")
                                .font(.light10)
                                .lineLimit(1)
                        }.frame(width: 100)
                        .padding(.vertical,20)
                        .padding(.horizontal,10)
                    }
                }
            }.padding(.leading, 25)
                .frame(width: UIScreen.main.bounds.width)
                .aspectRatio(contentMode: .fit)
        }
    }
}
#Preview {
    PlaylistScrollView(title: "저장한 플레이리스트")
        .environmentObject(ProfileViewModel())
}
