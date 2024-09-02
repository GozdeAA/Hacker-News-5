//
//  DetailView.swift
//  Hacker News 5
//
//  Created by Gözde Aydin on 2.09.2024.
//

import SwiftUI
import WebKit

struct DetailView: View {
    var url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
