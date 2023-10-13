//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by David Laczkovits on 08.10.23.
//

import SwiftUI

struct MainView: View {
    
    let apController = PredatorController()
    @State var sortAlphabetical = false
    @State var currentFilter = "All"
    
    var body: some View {
        
        apController.filterBy(type: currentFilter)
        
        if sortAlphabetical {
            apController.sortByAlphabetical()
        } else {
            apController.sortByMovie()
        }
        
        return NavigationView {
            List {
                ForEach(apController.apexPredators) { predator in
                    NavigationLink(destination: PredatorDetail(predator: predator)) {
                        PredatorRow(predator: predator)
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation {
                            sortAlphabetical.toggle()
                        }
                    } label: {
                        HStack {
                            Text("Sort by")
                            if sortAlphabetical {
                                Image(systemName: "film")
                            } else {
                                Image(systemName: "textformat")
                            }
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentFilter.animation()) {
                            ForEach(apController.typeFilters, id: \.self) { type in
                                HStack {
                                    Text(type)
                                    Spacer()
                                    Image(systemName: apController.typeIcon(for: type))
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
        .preferredColorScheme(.dark)
}
