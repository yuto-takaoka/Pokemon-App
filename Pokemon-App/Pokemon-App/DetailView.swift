
import SwiftUI

struct DetailView: View {
    var num: Int = 0
    var body: some View {
        VStack {
            Text("No.\(num + 1)")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    DetailView()
}
