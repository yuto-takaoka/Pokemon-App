
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            
            NavigationStack {
                VStack {
                    LazyGridView()
                }
                .navigationTitle("一覧(GridLayout)")
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Image(systemName: "square.grid.2x2")
                Text("LazyGrid")
            }
            
            NavigationStack {
                VStack {
                    ListView()
                }
                .navigationTitle("List")
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Image(systemName: "rectangle.grid.1x2")
                Text("List")
            }
        }
    }
}

struct MonsterBall: View {
    var body: some View {
        Circle()
            .fill(.red)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    ContentView()
}
