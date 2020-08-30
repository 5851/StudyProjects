import SwiftUI

struct InfoView: View {

    // MARK: - Properties
    var infoTitle: Int

    // MARK: - Body
    var body: some View {
        Text("Number of rows \(infoTitle)")
    } // Body
}

struct InfoView_Previews: PreviewProvider {

    // MARK: - Previews
    static var previews: some View {
        InfoView(infoTitle: 0)
    }
}
