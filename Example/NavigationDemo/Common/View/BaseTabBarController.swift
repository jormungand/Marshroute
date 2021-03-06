import UIKit

class BaseTabBarController: UITabBarController, ViewLifecycleObservable, DisposeBag, DisposeBagHolder
{
    // MARK: - ViewLifecycleObservable
    var onViewDidLoad: (() -> ())?
    var onViewWillAppear: (() -> ())?
    var onViewDidAppear: (() -> ())?
    var onViewWillDisappear: (() -> ())?
    var onViewDidDisappear: (() -> ())?
    
    // MARK: - DisposeBagHolder
    let disposeBag: DisposeBag = DisposeBagImpl()
    
    // MARK: - Lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable, message="Use `init()`")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onViewDidLoad?()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        onViewWillAppear?()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        onViewDidAppear?()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        onViewWillDisappear?()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        onViewDidDisappear?()
    }
}