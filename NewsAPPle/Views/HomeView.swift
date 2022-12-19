//
//  HomeView.swift
//  NewsAPPle
//
//  Created by berat can beduk on 14.12.2022.
//

import SwiftUI
struct HomeView: View {
    @EnvironmentObject var homeVm : HomeViewModel
    init() {
          UITableView.appearance().showsVerticalScrollIndicator = false
      }
      
    var body: some View {
        GeometryReader {
            geometry in
            NavigationView{
                if homeVm.showIndicator == true {
                     ProgressView().progressViewStyle(.circular)
                }
                else {
                    ScrollView(showsIndicators: false){
                      
                        VStack(spacing : 50){
                            ForEach(homeVm.news.indices
                                    ,
                                    id: \.self){
                                element in
                                
                                NavigationLink{
                                    WebView(url: URL(string: homeVm.news[element].url)!)
                                        .ignoresSafeArea()
                      
                                        
                                } label: {
                                    CardView(geometry: geometry, element: element)
                                }.foregroundColor(.black)
                    
                                    
                            }
                        
                        }
                    }
                    
                    .navigationTitle("APPLE NEWS")
                    
                }
               
         
        
                
            }
            .onAppear {
                print("on Appear üst")
                homeVm.getNews()
                print("on Appear alt")

            }

           
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(HomeViewModel())
    }
}
