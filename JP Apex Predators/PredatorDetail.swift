//
//  PredatorDetail.swift
//  JP Apex Predators
//
//  Created by David Laczkovits on 08.10.23.
//

import SwiftUI

struct PredatorDetail: View {
    
    let predator : ApexPredator
    
    var body: some View {
        ScrollView {
            
            // selbiges mit ZStack
            
            //            ZStack {
            //                Image(predator.type)
            //                    .resizable()
            //                    .scaledToFit()
            //                Image(predator.name.lowercased().filter { $0 != " " } )
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 4)
            //                    .position(x: UIScreen.main.bounds.width / 4.5, y: UIScreen.main.bounds.height / 5.25)
            //                    .shadow(color: .black,radius: 6, x: 0, y:0)
            //                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            //            }
            
            // selbiges mit VStack übereinander
            VStack(alignment: .trailing) {
                
                Image(predator.type)
                    .resizable()
                    .scaledToFit()
                
                Image(predator.name.lowercased().filter { $0 != " " } )
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 4)
                    .shadow(color: .black,radius: 6, x: 0, y:0)
                    .offset(y: -210)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                
                VStack(alignment: .leading) {
                
                    Text(predator.name)
                        .font(.largeTitle)
                        .padding(.bottom, 8)
                    
                    Text("Appears In:")
                        .font(.title3)
                    
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("• \(movie)")
                            .font(.subheadline)
                    }
                    
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding([.top, .bottom], 1)
                        
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    
                    Text("Read More:")
                        .font(.caption)
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundColor(.blue)
                }
                .padding(.top, -230)
            }

        }.edgesIgnoringSafeArea(.top)
    }
}



/*#Preview {
    PredatorDetail(predator: pred)
        .preferredColorScheme(.dark)
}*/

struct PredatorDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        let movieScene = MovieScene(id: 2, movie: "Jurassic Park III", sceneDescription: "Passengers of the plane N622DC saw a herd of Brachiosaurus during their fly-over of Isla Sorna at the beginning of the Isla Sorna Incident of 2001.\n\nAnother herd was seen by Dr. Alan Grant and the Kirby family at a river bank.")
        let movieScene2 = MovieScene(id: 3, movie: "Jurassic World: Fallen Kingdom", sceneDescription: "It is revealed that there are some surviving Brachiosaurus populations on Isla Nublar, but the species faces danger in the form of an impending erupting volcano.\n\nA Brachiosaurus is later seen walking down the ruins of Main Street, in front of Owen, Claire, Zia and others.\n\nA Brachiosaurus skeleton was seen near the radio tower's hatch.\n\nWhen Mt. Sibo erupts, the Brachiosaurs were among the dinosaurs stampeding from the eruption, facing many heavy casualties, most notably: as the boat Arcadia leaves Nublar to its fate, a Brachiosaurus, the same one seen by Grant and Sattler 25 years ago, is seen walking down the East Dock, crying out and standing on its hind legs as it is slowly engulfed by the toxic smoke and debris from the erupting volcano, letting out its final cries.\n\nDespite the massive casualties, the species' survival is confirmed by the Arcadia's manifest, and by J.A. Bayona himself, which shows that at least two adult Brachiosaurus had been captured and escaped the estate off-screen.\n\nSome of Mill's mercenaries managed to salvage its viable embryo, as seen during Malcolm's voiced over final testimony with the committee, implying that more Brachiosaurus may be engineered in the future.")
        let predator = ApexPredator(id: 1, name: "Brachiosaurus", type: "land", movies: ["Jurassic Park","Jurassic Park III","Jurassic World: Fallen Kingdom"], movieScenes: [movieScene, movieScene2], link: "https://jurassicpark.fandom.com/wiki/Brachiosaurus")
        
        
        PredatorDetail(predator: predator)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
