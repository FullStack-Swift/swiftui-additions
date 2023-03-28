import SwiftUI

public struct _NavigationStack<Content: View>: View {
  private let content: () -> Content
  
  public init(@ViewBuilder builder: @escaping () -> Content) {
    self.content = builder
  }
  
  public var body: some View {
    if #available(iOS 16.0, macOS 13, *) {
      NavigationStack(root: content)
    } else {
      NavigationView(content: content)
    }
  }
}

struct _NavigationStack_Previews: PreviewProvider {
  static var previews: some View {
    _NavigationStack {
      
    }
  }
}
