import DynamicStackView

struct Content {

    let text: String
}

extension Content: DynamicStackViewModel {

    var cellType: DynamicStackViewCell.Type {
        return ContentCell.self
    }
}
