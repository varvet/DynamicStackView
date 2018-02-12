import UIKit
import DynamicStackView

class MainViewController: UIViewController {

    @IBOutlet weak var dynamicStackView: DynamicStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Append Content model.
        let content = Content(text: "My content")
        dynamicStackView.append(model: content)

        // Append OtherContent models as array.
        let contentArray = [
            Content(text: "My content"),
            Content(text: "More content")
        ]
        dynamicStackView.append(models: contentArray)

        // Append Content model, but with another cell type. This requires the setup method in OtherContentCell to be able to handle it.
        let overriddenContent = Content(text: "Overriden content")
        dynamicStackView.append(model: overriddenContent, cellType: OtherContentCell.self)

        // Check taps.
        dynamicStackView.didTapCell = { cell in
            print(cell)
        }
    }
}
