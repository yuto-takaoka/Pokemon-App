
import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            ForEach(0 ..< 151) { num in
                HStack {
                    NavigationLink(destination: DetailView(num: num)) {
                        Image(systemName: ("sun.max.fill"))
                        Text("\(num + 1)")
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

#Preview {
    ListView()
}
