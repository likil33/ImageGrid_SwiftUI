//
//  ImageGridView.swift
//  ImageGrid
//
//  Created by Santhosh K on 07/01/26.
//

import SwiftUI

struct ImageGridView: View {
    let images = ["image1", "image2", "image3", "image4","image1", "image2", "image3", "image4"]
    let gridSpacing: CGFloat = 1
    var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: gridSpacing), count: 3)
    }
    
    @State private var selectedIndex:Int = 0
    @State private var showViewer = false
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: gridSpacing) {
                ForEach(images.indices, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .aspectRatio(1, contentMode: .fill)
                        .clipped()
                        .cornerRadius(8)
                        .onTapGesture {
                            selectedIndex = index
                            showViewer = true
                        }
                }
            }
            .padding(.horizontal, gridSpacing)
        }
        .fullScreenCover(isPresented:$showViewer) {
            FullImageViewer(
                images: images,
                selectedIndex: $selectedIndex,
                isPresented: $showViewer)
        }
    }
}

#Preview {
    ImageGridView()
}



/*
 
 AsyncImage(url: URL(string: url)) { image in
     image
         .resizable()
         .scaledToFill()
 } placeholder: {
     Color.gray.opacity(0.3)
 }
 .aspectRatio(1, contentMode: .fill)
 .clipped()

 
 */
