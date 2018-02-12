import UIKit

extension UIView {

    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }

    func xibSetup(name: String) {
        guard let view = bundle.loadNibNamed(name, owner: self, options: nil)?.first as? UIView else { fatalError("DynamicStackView: Could not load  \(name). Each DynamicStackViewCell must have a corresponding xib file.") }

        view.frame = bounds
        addSubview(view)
    }
}
