import UIKit

class SimulationView:AbstractView {
    private(set) weak var viewGraph:SimulationViewGraph?
    private(set) weak var viewScroll:SimulationViewScroll?
    
    override func factoryViews() {
        super.factoryViews()
        
        let viewGraph:SimulationViewGraph = SimulationViewGraph()
        self.viewGraph = viewGraph
        
        let viewScroll:SimulationViewScroll = SimulationViewScroll()
        self.viewScroll = viewScroll
        
        self.addSubview(viewGraph)
        self.addSubview(viewScroll)
        
        viewGraph.layoutTopToTop(view:self)
        viewGraph.layoutHeight(constant:Constants.graphHeight)
        viewGraph.layoutEqualsHorizontal(view:self)
        
        viewScroll.layoutEquals(view:self)
    }
}
