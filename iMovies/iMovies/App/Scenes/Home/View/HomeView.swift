//
//  ContentView.swift
//  iMovies
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import SwiftUI
import CoreData
import DesignSystem

struct HomeView: View {
    @State var viewModel: HomeViewModel

    var body: some View {
        VStack {

        }
        .onAppear {
            viewModel.viewDidLoad.send()
        }
    }
}

#Preview {
    HomeView(viewModel: Container.homeViewModel)
}
