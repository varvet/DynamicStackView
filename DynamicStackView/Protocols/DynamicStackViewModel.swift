/**
 Protocol specifying requirements for adapting a generic data model to be usable with DynamicStackView.
*/
public protocol DynamicStackViewModel {

    /**
     Matches this data model with a DynamicStackViewCell.
     */
    var cellType: DynamicStackViewCell.Type { get }
}
