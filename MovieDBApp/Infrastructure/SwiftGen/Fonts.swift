// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias Font = FontConvertible.Font

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
  internal enum SourceSansPro {
    internal static let black = FontConvertible(name: "SourceSansPro-Black", family: "Source Sans Pro", path: "SourceSansPro-Black.otf")
    internal static let blackItalic = FontConvertible(name: "SourceSansPro-BlackIt", family: "Source Sans Pro", path: "SourceSansPro-BlackIt.otf")
    internal static let bold = FontConvertible(name: "SourceSansPro-Bold", family: "Source Sans Pro", path: "SourceSansPro-Bold.otf")
    internal static let boldItalic = FontConvertible(name: "SourceSansPro-BoldIt", family: "Source Sans Pro", path: "SourceSansPro-BoldIt.otf")
    internal static let extraLight = FontConvertible(name: "SourceSansPro-ExtraLight", family: "Source Sans Pro", path: "SourceSansPro-ExtraLight.otf")
    internal static let extraLightItalic = FontConvertible(name: "SourceSansPro-ExtraLightIt", family: "Source Sans Pro", path: "SourceSansPro-ExtraLightIt.otf")
    internal static let italic = FontConvertible(name: "SourceSansPro-It", family: "Source Sans Pro", path: "SourceSansPro-It.otf")
    internal static let light = FontConvertible(name: "SourceSansPro-Light", family: "Source Sans Pro", path: "SourceSansPro-Light.otf")
    internal static let lightItalic = FontConvertible(name: "SourceSansPro-LightIt", family: "Source Sans Pro", path: "SourceSansPro-LightIt.otf")
    internal static let regular = FontConvertible(name: "SourceSansPro-Regular", family: "Source Sans Pro", path: "SourceSansPro-Regular.otf")
    internal static let semibold = FontConvertible(name: "SourceSansPro-Semibold", family: "Source Sans Pro", path: "SourceSansPro-Semibold.otf")
    internal static let semiboldItalic = FontConvertible(name: "SourceSansPro-SemiboldIt", family: "Source Sans Pro", path: "SourceSansPro-SemiboldIt.otf")
    internal static let all: [FontConvertible] = [black, blackItalic, bold, boldItalic, extraLight, extraLightItalic, italic, light, lightItalic, regular, semibold, semiboldItalic]
  }
  internal static let allCustomFonts: [FontConvertible] = [SourceSansPro.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  #if os(OSX)
  internal typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Font = UIFont
  #endif

  internal func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
