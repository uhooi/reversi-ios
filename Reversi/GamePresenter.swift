protocol GameEventHandler: AnyObject {
    func viewDidLoad()
}

final class GamePresenter {

    // MARK: Stored Instance Properties

    private unowned let view: GameUserInterface
    private let router: GameRouterInput
    
    // MARK: Initializers

    init(view: GameUserInterface, router: GameRouterInput) {
        self.view = view
        self.router = router
    }
}

extension GamePresenter: GameEventHandler {

    func viewDidLoad() {
        // TODO:
    }
}
