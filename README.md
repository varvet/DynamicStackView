
# DynamicStackView

A lightweight, smarter UIStackView that works in a similar fashion to a UITableView, adding flexibility without complexity. Ideal when you just need to list a couple of views but not requiring the whole package.

 1. [Installation](#installation)
 2. [Usage](#usage)
 3. [Example project](#example-project)

## Installation

#### Supported platforms

- iPhone/iPad
- Swift 4

#### Carthage

    github "varvet/DynamicStackView"

## Usage

Basically there are three parts to DynamicStackView:

 1. [DynamicStackViewModel](#dynamicstackviewmodel---protocol)
 2. [DynamicStackViewCell](#dynamicstackviewcell---superclass)
 3. [DynamicStackView](#dynamicstackview---view)

#### DynamicStackViewModel - Protocol

All models to be used with `DynamicStackView` has to adhere to this protocol. By doing so, you'll be matching a `DynamicStackViewCell` to automatically generate a view for you:

    extension Content: DynamicStackViewModel {
        var cellType: DynamicStackViewCell.Type {
            return ContentCell.self
        }
    }

#### DynamicStackViewCell - Superclass

By subclassing `DynamicStackViewCell` you can (**must**) override its setup method to get access to the matching `DynamicStackViewModel`:

    override func setup(model: DynamicStackViewModel) {
        if let model = model as? Content {
            label.text = model.text
        }
    }

#### DynamicStackView - View

This is the custom `UIStackView` that manages our cells. Simply add one as an `IBOutlet`:

    @IBOutlet weak var dynamicStackView: DynamicStackView!
    
Now add your `DynamicStackViewModel` adhering data models to it:

    let content = Content(text: "My content")
    dynamicStackView.append(model: content)

Or as an array:

    let contentArray = [
        Content(text: "My content"),
        Content(text: "More content")
    ]
    dynamicStackView.append(models: contentArray)

If you want to manually override the cell type, simply specify it when adding models:

    let overriddenContent = Content(text: "Overriden content")
    dynamicStackView.append(model: overriddenContent, cellType: OtherContentCell.self)

**Note:** When overriding the cell type, make sure that your subclassed `DynamicStackViewCell` can handle the new `DynamicStackViewModel`:

    override func setup(model: DynamicStackViewModel) {
        if let model = model as? Content {
            label.text = model.text
        } else if let model = model as? OtherContent {
            label.text = model.text
        }
    }
	
## Example project

[DynamicStackView/Example](https://github.com/varvet/DynamicStackView/tree/master/DynamicStackView/Example)
