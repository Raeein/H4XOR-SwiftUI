//
//  ContentView.swift
//  H4XOR SwiftUI
//
//  Created by Raeein Bagheri on 2021-12-05.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                HStack{
                    Text(String(post.points))
                    Text(post.title)
                }
            }
            .navigationTitle("H4X0R News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct Post: Identifiable {
//    let id: String
//    let title: String
//}
//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Salam"),
//    Post(id: "3", title: "Hola")
//]
