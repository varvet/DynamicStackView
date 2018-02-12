import UIKit
import DynamicStackView

class ContentCell: DynamicStackViewCell {

    @IBOutlet weak var label: UILabel!

    override func setup(model: DynamicStackViewModel) {
        if let model = model as? Content {
            label.text = model.text
        }
    }
}
