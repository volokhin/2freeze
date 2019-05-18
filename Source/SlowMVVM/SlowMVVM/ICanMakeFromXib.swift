import UIKit

public protocol ICanMakeFromXib {

	static func makeFromXib() -> Self

}

public extension ICanMakeFromXib where Self: UIView {

	static func nib() -> UINib {
		let bundle = Bundle.main
		let name = "\(Self.self)"
		return UINib(nibName: name, bundle: bundle)
	}

	static func makeFromXib() -> Self {

		let bundle = Bundle.main
		let name = "\(Self.self)"
		let nibs = bundle.loadNibNamed(
			name,
			owner: nil,
			options: nil
		)
		if let view = nibs?.first as? Self {
			return view
		}

		fatalError("Unable to create \(Self.self) from nib.")
	}

}