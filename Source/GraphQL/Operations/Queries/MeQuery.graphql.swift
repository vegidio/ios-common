// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension Countries {
    class MeQuery: GraphQLQuery {
        public static let operationName = "me"
        public static let document: ApolloAPI.DocumentType = .notPersisted(
            definition: .init(
                #"""
                query me {
                  me {
                    __typename
                    id
                    name
                    username
                    email
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
                .field("me", Me.self),
            ] }

            public var me: Me { __data["me"] }

            /// Me
            ///
            /// Parent Type: `User`
            public struct Me: Countries.SelectionSet {
                public let __data: DataDict
                public init(data: DataDict) { __data = data }

                public static var __parentType: ApolloAPI.ParentType { Countries.Objects.User }
                public static var __selections: [ApolloAPI.Selection] { [
                    .field("id", Int.self),
                    .field("name", String.self),
                    .field("username", String.self),
                    .field("email", String.self),
                ] }

                public var id: Int { __data["id"] }
                public var name: String { __data["name"] }
                public var username: String { __data["username"] }
                public var email: String { __data["email"] }
            }
        }
    }
}