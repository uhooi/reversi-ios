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
        do {
            try self.view.loadGame()
        } catch _ {
            newGame()
        }
    }
    
    /// ゲームの状態を初期化し、新しいゲームを開始します。
    private func newGame() {
        self.view.reset()
        try? self.view.saveGame()
    }
}
