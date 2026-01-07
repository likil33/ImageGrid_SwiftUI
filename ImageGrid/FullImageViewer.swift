//
//  FullImageViewer.swift
//  ImageGrid
//
//  Created by Santhosh K on 07/01/26.
//

import SwiftUI

struct FullImageViewer: View {
    let images : [String]
    
    @Binding var selectedIndex:Int
    @Binding var isPresented:Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.black.ignoresSafeArea()
            
            TabView(selection: $selectedIndex) {
                ForEach(images.indices, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFit()
                        .tag(index)
                        .ignoresSafeArea()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            
            //close button
            Button {
                isPresented = false
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
                    .padding()
            }
        }
    }
}

