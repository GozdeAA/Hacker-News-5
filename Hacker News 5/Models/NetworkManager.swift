//
//  NetworkManager.swift
//  Hacker News 5
//
//  Created by Gözde Aydin on 2.09.2024.
//

import Foundation
// listens changes
class NetworkManager: ObservableObject {
    let allNews = "https://hn.algolia.com/api/v1/search?tags=front_page"

    // FIXME: fixed https://www.hackingwithswift.com/forums/swiftui/message-publishing-changes-from-background-threads-is-not-allowed/21045
    @Published var posts = [Post]()

    func fetchAllNews() {
        if let url = URL(string: allNews) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, _, e in
                if let newError = e {
                    print(newError)
                } else {
                    if let safeData = data {
                        do {
                            let decoder = JSONDecoder()
                            let results = try decoder.decode(Results.self, from: safeData)

                            self
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
