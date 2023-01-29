# iOS Common

In this project I keep the list of most libraries and helper classes that I commonly use during the development of my iOS apps. I will try to keep this project updated constantly as I find better libraries to do the tasks or when I improve code in one of my classes.

## 🏛️ Architecture

This project uses of the [MVVM](https://en.wikipedia.org/wiki/Model–view–viewmodel) pattern and makes de binding between the Views and the ViewModels through reactive programming, with Apple Combine.

## ⚙️ Dependencies

I used a set of well-known Android libraries so we don't have to reinvent the wheel 🙃

* __Alamofire:__ to make HTTP requests and process the responses.

## 🛠️ Build

Before building the project you must use code generator to update the Swift code with the GraphQL schema:

1. Install the CLI tool by right-clicking the project and selecting "Install CLI".
2. Run this command in the project root folder:

```
$ ./apollo-ios-cli generate
```

## 🎨 Code Correctness

This project uses [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) to keep the code formatted and [SwiftLint](https://github.com/realm/SwiftLint) to follow best practices. The linting is done automatically on every build, but in order to format the code run the command below in the project's root dir:

```
$ swiftformat .
```

## 👨🏾‍💻 Author

Vinicius Egidio ([vinicius.io](http://vinicius.io))
