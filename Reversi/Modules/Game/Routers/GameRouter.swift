import UIKit

protocol GameRouterInput: AnyObject {
}

final class GameRouter {

    // MARK: Stored Instance Properties

    private unowned let viewController: GameViewController

    // MARK: Initializers

    private init(viewController: GameViewController) {
        self.viewController = viewController
    }

    // MARK: Type Methods

    static func assembleModule() -> GameViewController {
        let sb = UIStoryboard(name: "Game", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "GameViewController")
        guard let view = vc as? GameViewController else {
            fatalError("Fail to load GametViewController from Storyboard.")
        }
        let router = GameRouter(viewController: view)
        let presenter = GamePresenter(view: view, router: router)

        view.presenter = presenter

        return view
    }
}

extension GameRouter: GameRouterInput {
}
