
import SwiftUI

struct LazyGridView: View {
    let pokeAPI = PokeAPI()
    
    let num: Int = 151
    let baseImageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    
    let columns: [GridItem] = [GridItem((.adaptive(minimum: 180)))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(0 ..< num) { i in
                    let id = i + 1
                    
                    let imageURL = baseImageURL + "\(id).png"
                    NavigationLink(destination: DetailView(id: id, image: imageURL)) {
                        ZStack {
                            Circle()
                                .trim(from: 0.5, to: 1.0)
                                .frame(width: 180, height: 180)
                                .foregroundColor(.red)
                            Circle()
                                .trim(from: 0, to: 0.5)
                                .frame(width: 180, height: 180)
                                .foregroundColor(.white)
                            AsyncImage(url: URL(string: imageURL)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }.frame(width: 130, height: 130)
                        }
                    }
                    .overlay(Circle().stroke(.black, lineWidth: 1.0))
                    .contentShape(Circle())
                }
            }
        }
    }
}

#Preview {
    LazyGridView()
}
