import UIKit

final class DiskView: UIView {
    /// このビューが表示するディスクの色を決定します。
    var disk: Disk = .dark {
        didSet { setNeedsDisplay() }
    }
    
    /// Interface Builder からディスクの色を設定するためのプロパティです。 `"dark"` か `"light"` の文字列を設定します。
    @IBInspectable var name: String {
        get { disk.name }
        set { disk = .init(name: newValue) }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    private func setUp() {
        backgroundColor = .clear
        isUserInteractionEnabled = false
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(disk.cgColor)
        context.fillEllipse(in: bounds)
    }
}

extension Disk {
    fileprivate var uiColor: UIColor {
        switch self {
        case .dark: return UIColor(named: "DarkColor")!
        case .light: return UIColor(named: "LightColor")!
        }
    }
    
    fileprivate var cgColor: CGColor {
        uiColor.cgColor
    }
    
    fileprivate var name: String {
        switch self {
        case .dark: return "dark"
        case .light: return "light"
        }
    }
    
    fileprivate init(name: String) {
        switch name {
        case Disk.dark.name:
            self = .dark
        case Disk.light.name:
            self = .light
        default:
            preconditionFailure("Illegal name: \(name)")
        }
    }
}
