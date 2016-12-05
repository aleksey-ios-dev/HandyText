HandyText
--------------

Purpose
--------------
HandyText is a helper library that allows to create and manage text styles in clear declarative manner.

Problem solved
--------------

Work on UI tasks is full of repetition when it goes about defining text appearance. You have to refer to mockups all the time, or to search and copy elements of same appearance. Both ways leave many ways for errors, and both make late changes in design quite painful. Amount of work for changing a font in typical elements is proportional to project's size.
The alternative way is in avoiding the use of IB for defining text appearance, but handling it in code. 


Supported OS & SDK Versions
-----------------------------

Swift 2.2
* Supported build target - iOS 9.0 (Xcode 7)

Installation
--------------

```ruby
# In your Podfile

pod 'HandyText'
```

Declare own text styles as static functions or properties of TextStyle class.

Version 1.2.0

- Release version.

Usage
--------------

First, let's define some text styles:

```swift
extension TextStyle {
  static var plainText: TextStyle {
    return TextStyle(font: .avenir)
  }
}
```

The Font is only required parameter for creating a brand new style, all other params are set to defaults. Instead of copying instances and modifying properties the library proposes more declarative 'cascade' style. Think you need a style for headers based on plain text:

```swift
  static var header1: TextStyle {
    return plainText.withSizeMultiplied(by: 1.4).uppercase().bold()
  }
```

It's remarkable that styles are chained, in other words based on each other. Changing basic style font to .georgia makes all style scheme look different, but still well fitted.

Attributed strings
----------------

The costs of using text styles is switching to attributed text, which is supported by the most of UIKit classes.

```swift
self.testLabel.attributedText = "Hello, World!".withStyle(.plainText)
```

[[https://github.com/mmrmmlrr/HandyText/blob/task/readme/img/01.png|alt=helloworld]]

Tag parser
----------------

For displaying strings with tags you define a tag scheme:

```swift
    let scheme = TagScheme()
    scheme.forTag("b") { $0.bold() }
    scheme.forTag("i") { $0.italic() }
```
In the scheme for each custom tag you register a block defining the modification of the initial text style.

To convert a string into an attributed string:

```swift
let result = "about <i>zebras</i>".withStyle(.plainText, tagScheme: scheme)
```

Nested tags are supported. Text marked as following ```"<i><b>lions</b></i>"``` will be bold italic.


Highlighting words
----------------

You can highlight specific substrings with a different text style:

```swift
let highlightedString = "African equids".withStyle(.plainText).applyStyle(.header, toOccurencesOf: "African")
```


License
----------------

    The MIT License (MIT)

    Copyright © 2016 Aleksey Chernish

    Permission is hereby granted free of charge to any person obtaining a copy of this software and associated documentation files (the "Software") to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.

