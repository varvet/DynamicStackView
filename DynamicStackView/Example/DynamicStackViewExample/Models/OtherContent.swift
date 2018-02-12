import DynamicStackView

struct OtherContent {

    let text: String
}

extension OtherContent: DynamicStackViewModel {

    var cellType: DynamicStackViewCell.Type {
        return OtherContentCell.self
    }
}

