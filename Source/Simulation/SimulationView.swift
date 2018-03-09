import UIKit

class SimulationView:AbstractView {
    private(set) weak var viewGraph:SimulationViewGraph?
    
    override func factoryViews() {
        super.factoryViews()
        
        let viewGraph:SimulationViewGraph = SimulationViewGraph()
        self.viewGraph = viewGraph
        
        self.addSubview(viewGraph)
        
        viewGraph.layoutTopToTop(view:self)
        viewGraph.layoutHeight(constant:Constants.graphHeight)
        viewGraph.layoutEqualsHorizontal(view:self)
    }
}
