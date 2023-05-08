import SwiftUI
/// The examples
/// struct ExampleView: _View {
///
///   @State private var isOK: Bool = false
///
///   var anyBody: any View {
///     if isOK {
///       Text(String(isOK))
///         .onTapGesture {
///           isOK.toggle()
///         }
///     } else {
///       Button(String(isOK)) {
///         isOK.toggle()
///       }
///     }
///   }
/// }

public protocol _View: View {

  @ViewBuilder var anyBody: any View { get }
}

extension _View where Body: View {
  var body: some View {
    AnyView(anyBody)
  }
}
