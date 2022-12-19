//
//  CardView.swift
//  NewsAPPle
//
//  Created by berat can beduk on 14.12.2022.
//

import SwiftUI

import Kingfisher



struct CardView: View {
    let cardAndImageWidth: CGFloat = 170
      let cardHeight: CGFloat = 174
      let imageHeight: CGFloat = 116
      let cornerRadius: CGFloat = 20
    let geometry : GeometryProxy
    let element : Int
    @EnvironmentObject var
    data : HomeViewModel
    var body: some View {
        
     
                   
                
                VStack(alignment: .leading, spacing: 10) {
                    if data.news[element].urlToImage != nil {
                        KFImage(URL(string: data.news[element].urlToImage!))
                            .resizable()
                            .frame(width: geometry.size.width - 30, height: geometry.size.height * 0.25)
                        
                    }else{
                        KFImage(URL(string: data.news[0].urlToImage!))
                            .resizable()
                            .frame(width: geometry.size.width - 30, height: geometry.size.height * 0.25)
                            
                    }
                    
                    Spacer()
                     
                        Text(data.news[element].title)
                            .font(.custom("Avenir", size: 14))
                            .fontWeight(.bold)
                            .padding(.leading)
                        Text(data.news[element].title)
                            .font(.custom("Avenir", size: 12))
                            .foregroundColor(SwiftUI.Color.gray)
                            .padding(.leading)
                    Spacer()
                 
                }
                .frame(width: geometry.size.width - 30, height: geometry.size.height * 0.4)
                
                .background(
                    RoundedRectangle(cornerRadius:cornerRadius)
                    .strokeBorder(SwiftUI.Color.gray, lineWidth: 1)
                    .background(.white).cornerRadius(cornerRadius)
                )
                .cornerRadius(cornerRadius, corners:[.topRight,.topLeft] )
                .onAppear {
                    print("Element : \(element)")
                }
               
            
        
    }
}


