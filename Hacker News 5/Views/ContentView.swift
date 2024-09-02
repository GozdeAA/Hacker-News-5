//
//  ContentView.swift
//  Hacker News 5
//
//  Created by Gözde Aydin on 2.09.2024.
//

import SwiftUI

struct ContentView: View {
    // subscribe networkmanager updates
    @ObservedObject var manager = NetworkManager()

    var body: some View {
        NavigationStack {
            List(manager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }.navigationTitle("super news")
        }.onAppear(perform: {
            manager.fetchAllNews()
        })
    }
}

// onappear = viewdidload, oninit
#Preview {
    ContentView()
}
