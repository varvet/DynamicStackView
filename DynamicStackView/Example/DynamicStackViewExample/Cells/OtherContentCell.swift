import DynamicStackView

import UIKit

class OtherContentCell: DynamicStackViewCell {

    @IBOutlet weak var label: UILabel!

    override func setup(model: DynamicStackViewModel) {
        if let model = model as? Content {
            label.text = model.text
        } else if let model = model as? OtherContent {
            label.text = model.text
        }
    }
}
