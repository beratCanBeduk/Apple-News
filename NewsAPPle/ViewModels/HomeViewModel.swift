//
//  HomeViewModel.swift
//  NewsAPPle
//
//  Created by berat can beduk on 14.12.2022.
//

import Foundation

class HomeViewModel : ObservableObject {
    @Published var news = [Article]()
    @Published var showIndicator = false
    private let url = "https://newsapi.org/v2/everything?q=apple&from=2022-12-13&to=2022-12-13&sortBy=popularity&apiKey=bb5c6835f1a4471b86ae3b2307557a40"
    
    func getNews() {
        guard let requestUrl = URL(string: url) else {return}
        let urlRequest = URLRequest(url: requestUrl)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            self.showIndicator = true
            guard let response = response as? HTTPURLResponse else {
                print("response hatası")
                
                return}
            print(response.statusCode)
            
            if response.statusCode == 200 {
                self.showIndicator = false
                guard let data = data else {return}
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                DispatchQueue.main.async {
                    do{
                        
                        let decodedData = try decoder.decode(NewsModel.self, from: data)
                        self.news = decodedData.articles
                        print(self.news.count)
                    }catch{
                        
                        print(String(describing: error))
                    }
                }
            }
        }
        dataTask.resume()
    }
}
