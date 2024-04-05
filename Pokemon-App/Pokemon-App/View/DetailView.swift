
import SwiftUI

struct DetailView: View {
    @StateObject var pokeAPI = PokeAPI()
    @State var id: Int
    @State var image: String
    
    var body: some View {
        VStack {
            Text("No. \(id)")
                .font(.largeTitle)
            Image(image)
            AsyncImage(url: URL(string: image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }.frame(width: 200, height: 200)
            Text(pokeAPI.name)
            HStack {
                if !pokeAPI.types.isEmpty {
                    if pokeAPI.types.count == 2 {
                        Text("\(pokeAPI.types[0]), \(pokeAPI.types[1])")
                        
                    } else if pokeAPI.types.count == 1 {
                        Text(pokeAPI.types[0])
                    }
                }
            }
            .onAppear() {
                pokeAPI.fetchPokemonData(id: id)
            }
        }
        .fontWeight(.bold)
    }
}

#Preview {
    DetailView(id: 0, image: "")
}
