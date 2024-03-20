
import SwiftUI

struct ListView: View {
    var pokeAPI = PokeAPI()
    
    let num: Int = 151
    let baseImageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    
    var body: some View {
        List(0 ..< num) { i in
            let id = i + 1
            let imageURL = baseImageURL + "\(id).png"
            HStack {
                NavigationLink(destination: DetailView(id: id, image: imageURL)) {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 50, height: 50)
                    Text(pokeAPI.names[i])
                        .fontWeight(.bold)
                }
            }
        }
    }
}


#Preview {
    ListView()
}
