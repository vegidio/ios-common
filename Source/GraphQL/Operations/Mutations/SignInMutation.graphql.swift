// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension Countries {
    class SignInMutation: GraphQLMutation {
        public static let operationName = "signIn"
        public static let document: ApolloAPI.DocumentType = .notPersisted(
            definition: .init(
                #"""
                mutation signIn($dto: SignInRequestDto!) {
                  signIn(dto: $dto) {
                    __typename
                    accessToken
                    refreshToken
                  }
                }
                """#
            )
        )

        public var dto: SignInRequestDto

        public init(dto: SignInRequestDto) {
            self.dto = dto
        }

        public var __variables: Variables? { ["dto": dto] }

        public struct Data: Countries.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { Countries.Objects.Mutation }
            public static var __selections: [ApolloAPI.Selection] { [
                .field("signIn", SignIn.self, arguments: ["dto": .variable("dto")]),
            ] }

            public var signIn: SignIn { __data["signIn"] }

            /// SignIn
            ///
            /// Parent Type: `TokenResponseDto`
            public struct SignIn: Countries.SelectionSet {
                public let __data: DataDict
                public init(data: DataDict) { __data = data }

                public static var __parentType: ApolloAPI.ParentType { Countries.Objects.TokenResponseDto }
                public static var __selections: [ApolloAPI.Selection] { [
                    .field("accessToken", String.self),
                    .field("refreshToken", String.self),
                ] }

                public var accessToken: String { __data["accessToken"] }
                public var refreshToken: String { __data["refreshToken"] }
            }
        }
    }
}