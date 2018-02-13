import UIKit

/**
 A lightweight, smarter UIStackView that works in a similar fashion to a UITableView, adding flexibility without complexity. Ideal when you just need to list a couple of views but not requiring the whole package.
 */
public class DynamicStackView: UIStackView {

    /**
     Callback for tapped cell.
     */
    public var didTapCell: ValueCallback<DynamicStackViewCell>?
    /**
     Whether tapped should be handled automatically or on a per-cell basis by the developer. Defaults to true.
     */
    public var handleTap = true
}

public extension DynamicStackView {

    /**
     Appends cell based on its corresponding model.
     - parameter model: Any data model adhering to DynamicStackViewModel.
     - parameter cellType: Setting this overrides cell matching and uses the supplied cell type instead. Optional.
    */
    public func append(model: DynamicStackViewModel, cellType: DynamicStackViewCell.Type? = nil) {
        append(models: [model], cellType: cellType)
    }

    /**
     Appends cells based on their corresponding models.
     - parameter models: Any data model adhering to DynamicStackViewModel.
     - parameter cellType: Setting this overrides cell matching and uses the supplied cell type instead. Optional.
     */
    public func append(models: [DynamicStackViewModel], cellType: DynamicStackViewCell.Type? = nil) {
        models.forEach { model in
            self.addArrangedSubview(createCell(from: model, cellType: cellType))
        }
    }

    /**
     Sets cell based on its corresponding model. Overwrites all existing cells.
     - parameter model: Any data model adhering to DynamicStackViewModel.
     - parameter cellType: Setting this overrides cell matching and uses the supplied cell type instead. Optional.
     */
    public func set(model: DynamicStackViewModel, cellType: DynamicStackViewCell.Type? = nil) {
        removeAll()
        append(models: [model], cellType: cellType)
    }

    /**
     Sets cells based on their corresponding models. Overwrites all existing cells.
     - parameter models: Any data model adhering to DynamicStackViewModel.
     - parameter cellType: Setting this overrides cell matching and uses the supplied cell type instead. Optional.
     */
    public func set(models: [DynamicStackViewModel], cellType: DynamicStackViewCell.Type? = nil) {
        removeAll()
        append(models: models, cellType: cellType)
    }

    /**
     Inserts cell based on its corresponding models, at a certain starting position.
     - parameter model: Any data model adhering to DynamicStackViewModel.
     - parameter at: Position for the cell.
     - parameter cellType: Setting this overrides cell matching and uses the supplied cell type instead. Optional.
     */
    public func insert(model: DynamicStackViewModel, at position: Int, cellType: DynamicStackViewCell.Type? = nil) {
        insert(models: [model], at: position, cellType: cellType)
    }

    /**
     Inserts cells based on their corresponding models, at a certain starting position.
     - parameter models: Any data model adhering to DynamicStackViewModel.
     - parameter at: Starting position for the cells.
     - parameter cellType: Setting this overrides cell matching and uses the supplied cell type instead. Optional.
     */
    public func insert(models: [DynamicStackViewModel], at position: Int, cellType: DynamicStackViewCell.Type? = nil) {
        var finalPosition = (position >= cells.count) ? cells.count - 1 : position
        finalPosition = (finalPosition < 0) ? 0 : finalPosition

        for i in 0 ..< models.count {
            insertArrangedSubview(createCell(from: models[i], cellType: cellType), at: position + i)
        }
    }

    private func createCell(from model: DynamicStackViewModel, cellType: DynamicStackViewCell.Type? = nil) -> DynamicStackViewCell {
        let cell = (cellType != nil) ? cellType!.init() : model.cellType.init()
        cell.setup(model: model, handleTap: handleTap, tapCallback: { self.didTapCell?(cell) })

        return cell
    }
}

public extension DynamicStackView {

    /**
     Removes cell at a certain position.
     - parameter at: Position of the cell.
     */
    public func remove(at index: Int) {
        remove(at: [index])
    }

    /**
     Removes cells at certain positions.
     - parameter at: Positions of the cells.
     */
    public func remove(at indexes: [Int]) {
        var cellsToRemove = [DynamicStackViewCell]()

        for i in 0 ..< cells.count {
            if indexes.contains(i) { cellsToRemove.append(cells[i]) }
        }

        cellsToRemove.forEach { $0.removeFromSuperview() }
    }

    /**
     Removes all cells.
     */
    public func removeAll() {
        cells.forEach { $0.removeFromSuperview() }
    }
}

public extension DynamicStackView {

    /**
     All existing cells in the DynamicStackView.
     */
    public var cells: [DynamicStackViewCell] {
        return subviews as! [DynamicStackViewCell]
    }

    /**
     All existing cells of a certain type in the DynamicStackView.
     - parameter ofType: Any type subclassing DynamicStackViewCell.
     - returns: All cells of the specified type.
     */
    public func cells<T>(ofType type: T.Type) -> [T] {
        return cells.flatMap { $0 as? T }
    }

    /**
     Cell at a certain position in the DynamicStackView.
     - returns: The cell at the specified position.
     */
    public func cell(at index: Int) -> DynamicStackViewCell? {
        guard cells.count < index else { return nil }
        return cells[index]
    }

    /**
     Cells at certain positions in the DynamicStackView.
     - returns: The cells at the specified positions.
     */
    public func cells(at indexes: [Int]) -> [DynamicStackViewCell] {
        return indexes.flatMap { index in
            guard cells.count < index else { return nil }
            return cells[index]
        }
    }
}
