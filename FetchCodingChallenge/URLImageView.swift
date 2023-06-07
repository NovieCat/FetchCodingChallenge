//
//  URLImageView.swift
//  FetchCodingChallenge
//
//  Created by Mary Emerald on 6/6/23.
//

import SwiftUI

struct URLImage: View {
    let urlString: String
    
    @State var data: Data?

    var body: some View {
        if let data = data, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        else {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.gray)
                .onAppear() {
                    fetch()
                }
        }
    }
    
    private func fetch() {
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with:  url) { data, _, _ in
            self.data = data
        }
        
        task.resume()
    }
}
