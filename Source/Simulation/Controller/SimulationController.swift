import Foundation

class SimulationController:Controller<SimulationViewModel, SimulationView> {
    private let graph:SimulationControllerGraph
    private let scroll:SimulationControllerScroll
    
    override init() {
        self.graph = SimulationControllerGraph()
        self.scroll = SimulationControllerScroll()
        super.init()
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
        guard
            let viewModel:SimulationViewModel = self.viewModel
        else {
            return
        }
        self.graph.viewModel = viewModel.graph
        self.scroll.menu.reloadMenu(viewModel:viewModel)
        self.scroll.menu.content.reloadContent(viewModel:viewModel)
        self.specialisedView?.viewGraph?.setNeedsDisplay()
    }
}
