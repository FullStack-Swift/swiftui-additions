import SwiftUI

public struct If<TrueContent: View, FalseContent: View>: View {

  var value: Bool
  let trueContent: () -> TrueContent
  let falseContent: () -> FalseContent

  public init(
    value: Bool,
    @ViewBuilder trueContent: @escaping () -> TrueContent,
    @ViewBuilder falseContent: @escaping () -> FalseContent
  ) {
    self.value = value
    self.trueContent = trueContent
    self.falseContent = falseContent
  }

  @ViewBuilder
  public var body: some View {
    if value {
      trueContent()
    } else {
      falseContent()
    }
  }
}

public struct IfLet<T, Content: View>: View {
  let value: T?
  let content: (T) -> Content

  public init(_ value: T?, @ViewBuilder content: @escaping (T) -> Content) {
    self.value = value
    self.content = content
  }

  public var body: some View {
    if let value = value {
      content(value)
    }
  }
}

public struct IfLetTrue<Content: View>: View {
  let value: Bool?
  let content: () -> Content

  public init(_ value: Bool?, @ViewBuilder content: @escaping () -> Content) {
    self.value = value
    self.content = content
  }

  public var body: some View {
    IfLet(value) { element in
      if element == true {
        content()
      }
    }
  }
}

public struct IfLetFalse<Content: View>: View {
  let value: Bool?
  let content: () -> Content

  public init(_ value: Bool?, @ViewBuilder content: @escaping () -> Content) {
    self.value = value
    self.content = content
  }

  public var body: some View {
    IfLet(value) { element in
      if element == false {
        content()
      }
    }
  }
}

public struct IfTrue<Content: View>: View {
  var value: Bool
  let content: () -> Content

  public init(value: Bool = true, @ViewBuilder content: @escaping () -> Content) {
    self.value = value
    self.content = content
  }

  public var body: some View {
    if value == true {
      content()
    }
  }
}

public struct IfFalse<Content: View>: View {
  var value: Bool
  let content: () -> Content

  public init(value: Bool = false, @ViewBuilder content: @escaping () -> Content) {
    self.value = value
    self.content = content
  }

  public var body: some View {
    if value == false {
      content()
    }
  }
}

public struct IfLetPhone<Content: View>: View {
  let content: () -> Content

  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  public var body: some View {
#if os(iOS)
    if UIDevice.current.userInterfaceIdiom == .phone {
      content()
    } else {
      EmptyView()
    }
#else
    EmptyView()
#endif
  }
}

public struct IfLetPad<Content: View>: View {
  let content: () -> Content

  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  public var body: some View {
#if os(iOS)
    if UIDevice.current.userInterfaceIdiom == .pad {
      content()
    } else {
      EmptyView()
    }
#else
    EmptyView()
#endif
  }
}

public struct IfLetIOS<Content: View>: View {
  let content: () -> Content

  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  public var body: some View {
#if os(iOS)
    content()
#else
    EmptyView()
#endif
  }
}

public struct IfLetMacOS<Content: View>: View {
  let content: () -> Content

  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  public var body: some View {
#if os(macOS)
    content()
#else
    EmptyView()
#endif
  }
}

public struct IfLetTVOS<Content: View>: View {
  let content: () -> Content

  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  public var body: some View {
#if os(tvOS)
    content()
#else
    EmptyView()
#endif
  }
}

public struct IfLetWatchOS<Content: View>: View {
  let content: () -> Content

  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  public var body: some View {
#if os(watchOS)
    content()
#else
    EmptyView()
#endif
  }
}

@propertyWrapper
public struct LazyView<Content: View>: View {
  private let builder: () -> Content

  public init(_ builder: @autoclosure @escaping () -> Content) {
    self.builder = builder
  }
  public var body: Content {
    builder()
  }

  public var wrappedValue: Content {
    body
  }
}
