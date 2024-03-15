
import SwiftUI

struct LazyGridView: View {
    let pokemons = ["aaa", "bbb", "ccc", "ddd", "eee"]
    let num: Int = 151
    
    let columns: [GridItem] = [GridItem((.adaptive(minimum: 180)))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(0 ..< 151) { num in
                    ZStack {
                        Circle()
                            .trim(from: 0.5, to: 1.0)
                            .frame(width: 180, height: 180)
                            .foregroundColor(.red)
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .frame(width: 180, height: 180)
                            .foregroundColor(.white)
                        Text("\(num + 1)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    .overlay(Circle().stroke(.black, lineWidth: 1.0))
                }
            }
            .onTapGesture {
                // MARK: LazyVGridにタップ判定を付与する (DetailViewへ遷移)
                //                NavigationLink(destination: DetailView(num: num))
            }
        }
    }
}


#Preview {
    LazyGridView()
}
