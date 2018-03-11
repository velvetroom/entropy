import Foundation

class SimulationController:Controller<SimulationViewModel, SimulationView> {
    private let graph:SimulationControllerGraph
    private let scroll:SimulationControllerScroll
    private let menu:SimulationControllerMenu
    
    override init() {
        self.graph = SimulationControllerGraph()
        self.scroll = SimulationControllerScroll()
        self.menu = SimulationControllerMenu()
        super.init()
        self.graph.controller = self
        self.scroll.controller = self
        self.menu.controller = self
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.specialisedView?.viewGraph?.delegate = self.graph
        self.specialisedView?.viewScroll?.delegate = self.scroll
        self.specialisedView?.viewScroll?.dataSource = self.scroll
    }
    
    override func reloadViewModel() {
        self.specialisedView?.viewGraph?.setNeedsDisplay()
    }
}
