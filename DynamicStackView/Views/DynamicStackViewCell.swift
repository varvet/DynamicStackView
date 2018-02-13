import UIKit

/**
 View used to populate a DynamicStackView. Should be subclassed rather than instantiated directly. Requires a corresponding .xib file with the same name, connected through "File's Owner" in Interface Builder.
 */
open class DynamicStackViewCell: XibView {

    /**
     Callback for taps. Can be overriden to enable own implementation.
     */
    public var tapCallback: Callback?
    private var handleTap = true

    /**
     Setup method, providing the DynamicStackViewModel used when adding models to the DynamicStackView. Must be overriden.
     - parameter model: The DynamicStackViewModel used when adding models to the DynamicStackView.
     */
    open func setup(model: DynamicStackViewModel) {
        fatalError("DynamicStackView: Must implement setup(model: DynamicStackViewModel) in each DynamicStackViewCell.")
    }

    func setup(model: DynamicStackViewModel, handleTap: Bool, tapCallback: Callback? = nil) {
        self.handleTap = handleTap
        self.tapCallback = tapCallback
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))

        setup(model: model)
    }

    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        if handleTap { tapCallback?() }
    }
}
