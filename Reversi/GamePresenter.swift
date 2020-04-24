protocol GameEventHandler: AnyObject {
    func viewDidLoad()
    func viewDidAppear()
}

final class GamePresenter {
    
    // MARK: Stored Instance Properties
    
    private unowned let view: GameUserInterface
    private let router: GameRouterInput
    
    private var viewHasAppeared: Bool = false
    
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
    
    func viewDidAppear() {
        if self.viewHasAppeared { return }
        self.viewHasAppeared = true
        self.view.waitForPlayer()
    }
    
    /// ゲームの状態を初期化し、新しいゲームを開始します。
    private func newGame() {
        self.view.reset()
        try? self.view.saveGame()
    }
}
