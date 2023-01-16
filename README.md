# iOS Common

In this project I keep the list of most libraries and helper classes that I commonly use during the development of my iOS apps. I will try to keep this project updated constantly as I find better libraries to do the tasks or when I improve code in one of my classes.

## 🏛️ Architecture

This project uses of the [MVVM](https://en.wikipedia.org/wiki/Model–view–viewmodel) pattern and makes de binding between the Views and the ViewModels through reactive programming, with Apple Combine.

## ⚙️ Dependencies

I used a set of well-known Android libraries so we don't have to reinvent the wheel 🙃

* __Alamofire:__ to make HTTP requests and process the responses.

## Classes

* `interface/Callback` - a generic callback interface using class templates.

## 🎨 Code Style

This project uses [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) to keep the code format following a set of rules. To keep the code format, run the command below in the project's root dir:

```
$ swiftformat .
```

## 👨🏾‍💻 Author

Vinicius Egidio ([vinicius.io](http://vinicius.io))
