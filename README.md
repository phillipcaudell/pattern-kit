<img src="http://phillipcaudell.com/images/patternkit-logo.png" style="max-width:470px; width:100%;" alt="Pattern Kit Logo">

#### PatternKit is a collection of classes and categories that simplify common tasks in UIKit. 

## Pattern Goals
- Patterns reduce "Massive View Controllers" by offloading functionality into smaller manageable classes.
- Patterns are succinct and reusable across multiple projects.
- Patterns are well tested and have robust implementations. 

## Patterns 
### Table View
Provides a declarative API to model and manage `UITableView`.

### Collection View
Provides a declarative API to model and manage `UICollectionView`.

### Image Picker
Provides a flow for a user to select an image from their camera or library.

## Getting Started
- Download the project and have a play with the Demo app.
- Embed the PatternKit.framework binary into your project.
- Import "PatternKit.h" where appropriate.

## Contributing 
Contributions to PatternKit are welcomed and encouraged, though please take a second to read the following.

As a general rule of thumb, a pattern should be a commonly repeated series of tasks to achieve something in UIKit. Patterns should also be versatile enough to be used across multiple applications and projects. 

An example of a pattern is a user selecting a photo. You need to present options for  the user to select either the camera or photo library, check if the device supports it, present the picker interface, then return the image. This requires multiple callbacks which can add complexity to your view controllers, so instead we can silo it all into a single pattern.

## Proposed Patterns
- Drag and Drop
- Styles 
- Layout

## Project Status
PatternKit is still in early development, but we've decided to develop it out in the open to get feedback right from the start.

## Maintainers
- [Phillip Caudell (@phillipcaudell)](https://twitter.com/phillipcaudell)

## License 
PatternKit is available under the MIT license. 

Copyright (c) 2016 Phillip Caudell

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.