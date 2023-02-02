// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension Countries {
    class CountriesQuery: GraphQLQuery {
        public static let operationName = "countries"
        public static let document: ApolloAPI.DocumentType = .notPersisted(
            definition: .init(
                #"""
                query countries {
                  countries {
                    __typename
                    code
                    name {
                      __typename
                      common
                      official
                      nativeName {
                        __typename
                        language
                        common
                        official
                      }
                    }
                    capital
                    region
                    subRegion
                    languages {
                      __typename
                      code
                      name
                    }
                    currencies {
                      __typename
                      code
                      name
                      symbol
                    }
                    population
                    area
                    coordinates
                    flags {
                      __typename
                      png
                      svg
                    }
                  }
                }
                """#
            )
        )

        public init() {}

        public struct Data: Countries.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { Countries.Objects.Query }
            public static var __selections: [ApolloAPI.Selection] { [
                .field("countries", [Country].self),
            ] }

            public var countries: [Country] { __data["countries"] }

            /// Country
            ///
            /// Parent Type: `Country`
            public struct Country: Countries.SelectionSet {
                public let __data: DataDict
                public init(data: DataDict) { __data = data }

                public static var __parentType: ApolloAPI.ParentType { Countries.Objects.Country }
                public static var __selections: [ApolloAPI.Selection] { [
                    .field("code", String.self),
                    .field("name", Name.self),
                    .field("capital", String?.self),
                    .field("region", String.self),
                    .field("subRegion", String?.self),
                    .field("languages", [Language].self),
                    .field("currencies", [Currency].self),
                    .field("population", Int.self),
                    .field("area", Double.self),
                    .field("coordinates", [Double].self),
                    .field("flags", Flags.self),
                ] }

                public var code: String { __data["code"] }
                public var name: Name { __data["name"] }
                public var capital: String? { __data["capital"] }
                public var region: String { __data["region"] }
                public var subRegion: String? { __data["subRegion"] }
                public var languages: [Language] { __data["languages"] }
                public var currencies: [Currency] { __data["currencies"] }
                public var population: Int { __data["population"] }
                public var area: Double { __data["area"] }
                public var coordinates: [Double] { __data["coordinates"] }
                public var flags: Flags { __data["flags"] }

                /// Country.Name
                ///
                /// Parent Type: `Name`
                public struct Name: Countries.SelectionSet {
                    public let __data: DataDict
                    public init(data: DataDict) { __data = data }

                    public static var __parentType: ApolloAPI.ParentType { Countries.Objects.Name }
                    public static var __selections: [ApolloAPI.Selection] { [
                        .field("common", String.self),
                        .field("official", String.self),
                        .field("nativeName", [NativeName].self),
                    ] }

                    public var common: String { __data["common"] }
                    public var official: String { __data["official"] }
                    public var nativeName: [NativeName] { __data["nativeName"] }

                    /// Country.Name.NativeName
                    ///
                    /// Parent Type: `NativeName`
                    public struct NativeName: Countries.SelectionSet {
                        public let __data: DataDict
                        public init(data: DataDict) { __data = data }

                        public static var __parentType: ApolloAPI.ParentType { Countries.Objects.NativeName }
                        public static var __selections: [ApolloAPI.Selection] { [
                            .field("language", String.self),
                            .field("common", String.self),
                            .field("official", String.self),
                        ] }

                        public var language: String { __data["language"] }
                        public var common: String { __data["common"] }
                        public var official: String { __data["official"] }
                    }
                }

                /// Country.Language
                ///
                /// Parent Type: `Language`
                public struct Language: Countries.SelectionSet {
                    public let __data: DataDict
                    public init(data: DataDict) { __data = data }

                    public static var __parentType: ApolloAPI.ParentType { Countries.Objects.Language }
                    public static var __selections: [ApolloAPI.Selection] { [
                        .field("code", String.self),
                        .field("name", String.self),
                    ] }

                    public var code: String { __data["code"] }
                    public var name: String { __data["name"] }
                }

                /// Country.Currency
                ///
                /// Parent Type: `Currency`
                public struct Currency: Countries.SelectionSet {
                    public let __data: DataDict
                    public init(data: DataDict) { __data = data }

                    public static var __parentType: ApolloAPI.ParentType { Countries.Objects.Currency }
                    public static var __selections: [ApolloAPI.Selection] { [
                        .field("code", String.self),
                        .field("name", String.self),
                        .field("symbol", String?.self),
                    ] }

                    public var code: String { __data["code"] }
                    public var name: String { __data["name"] }
                    public var symbol: String? { __data["symbol"] }
                }

                /// Country.Flags
                ///
                /// Parent Type: `Flag`
                public struct Flags: Countries.SelectionSet {
                    public let __data: DataDict
                    public init(data: DataDict) { __data = data }

                    public static var __parentType: ApolloAPI.ParentType { Countries.Objects.Flag }
                    public static var __selections: [ApolloAPI.Selection] { [
                        .field("png", String.self),
                        .field("svg", String.self),
                    ] }

                    public var png: String { __data["png"] }
                    public var svg: String { __data["svg"] }
                }
            }
        }
    }
}