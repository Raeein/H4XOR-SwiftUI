//
//  NetworkManager.swift
//  H4XOR SwiftUI
//
//  Created by Raeein Bagheri on 2021-12-05.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func getRandomFood() async throws {
        guard let url = URL(string: "http:hn.algolia.com/api/v1/search?tags=front_page") else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let decodedData = try JSONDecoder().decode(Results.self, from: data)
        DispatchQueue.main.async {
            self.posts = decodedData.hits
        }
    }
    
    //    func fetchData() -> Void {
    //        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
    //            let session = URLSession(configuration: .default)
    //            let task = session.dataTask(with: url) { data, URLResponse, error in
    //                if error == nil {
    //                    let decoder = JSONDecoder()
    //                    if let safeData = data {
    //                        do {
    //                        let results = try decoder.decode(Results.self, from: safeData)
    //                            DispatchQueue.main.async {
    //                                self.posts = results.hits
    //                            }
    //                        } catch {
    //                            print(error)
    //                        }
    //                    }
    //                }
    //            }
    //            task.resume()
    //        }
    //    }
}
