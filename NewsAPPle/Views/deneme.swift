//
//  deneme.swift
//  NewsAPPle
//
//  Created by berat can beduk on 19.12.2022.
//

import SwiftUI

struct deneme: View {
    @State var myBool : Bool
    @State var counter : Int
    @State var circleList : [circleView] = [circleView(),circleView(),circleView(),circleView()]
   
    
    var body: some View {
        VStack{
            Button("Push"){
               getBool()
            }
            HStack{
                ForEach(0..<4) { element in
                    circleList[element]
                }
            }
        }
    }
    func getBool(){
        
        if(counter < 4){
            counter += 1
            circleList[counter - 1 ].bool = true
            
        }
        
    }
    
    
}

struct deneme_Previews: PreviewProvider {
    static var previews: some View {
        deneme(myBool: false,counter: 0)
    }
}

struct circleView : View {
    var bool = false
    var body: some View{
        Circle().frame(width: 50,height: 50).foregroundColor(bool == true ? .green : .gray)
    }
}

