import UIKit
import DynamicStackView

class MainViewController: UIViewController {

    @IBOutlet weak var stackChatView: DynamicStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Append Content model.
        let content = Content(text: "ContentCell")
        stackChatView.append(model: content)

        // Append Content model, but with another cell type. This requires the setup method in OtherContentCell to be able to handle it.
        let overriddenContent = Content(text: "Overriden ContentCell")
        stackChatView.append(model: overriddenContent, cellType: OtherContentCell.self)

        // Append OtherContent models as array.
        let otherContentArray = [
            OtherContent(text: "OtherContentCell"),
            OtherContent(text: "OtherContentCell"),
            OtherContent(text: "OtherContentCell"),
            OtherContent(text: "OtherContentCell"),
            OtherContent(text: "OtherContentCell")
        ]
        stackChatView.append(models: otherContentArray)

        // Check taps.
        stackChatView.didTapCell = { cell in
            print(cell)
        }
    }
}
