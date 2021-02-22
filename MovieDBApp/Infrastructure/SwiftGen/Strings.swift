// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Details {
    internal enum Cast {
      /// Cast
      internal static let text = L10n.tr("Localizable", "details.cast.text")
    }
    internal enum Crew {
      /// Crew
      internal static let text = L10n.tr("Localizable", "details.crew.text")
    }
    internal enum Genres {
      /// Genres
      internal static let text = L10n.tr("Localizable", "details.genres.text")
    }
    internal enum Overview {
      /// Overview
      internal static let text = L10n.tr("Localizable", "details.overview.text")
    }
    internal enum Year {
      /// Year
      internal static let text = L10n.tr("Localizable", "details.year.text")
    }
  }

  internal enum Home {
    /// The MovieDB App
    internal static let title = L10n.tr("Localizable", "home.title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
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
