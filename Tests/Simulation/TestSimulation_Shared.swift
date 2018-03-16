import XCTest
@testable import entropy

class TestSimulation_Shared:XCTestCase {
    private var simulation:Simulation?
    private var expect:XCTestExpectation?
    private struct Constants {
        static let updatedName:String = "updatedName"
        static let expectationWait:TimeInterval = 0.5
    }
    
    override func setUp() {
        super.setUp()
        self.simulation = Simulation()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.simulation, "Failed to create simulation")
    }
    
    func testSaveProject() {
        self.startExpectation()
        self.loadProjectOnBackground { [weak self] (project:Project) in
            self?.updateProject(project:project)
            self?.reloadProject()
        }
        self.onExpectationDone { [weak self] in
            XCTAssertNotNil(self?.simulation?.project, "Project not found")
        }
    }
    
    private func updateProject(project:Project) {
        self.validateProjectNameIsDifferent(project:project, name:Constants.updatedName)
        self.changeProject(project:project)
        self.simulation?.saveProject()
    }
    
    private func reloadProject() {
        self.loadProjectOnBackground { [weak self] (project:Project) in
            self?.validateProjectHasChanges(project:project)
            self?.expect?.fulfill()
        }
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func onExpectationDone(completion:@escaping(() -> ())) {
        waitForExpectations(timeout:Constants.expectationWait) { (error:Error?) in
            completion()
        }
    }
    
    private func loadProjectOnBackground(completion:@escaping((Project) -> ())) {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async {
            self.loadProject(completion:completion)
        }
    }
    
    private func loadProject(completion:@escaping((Project) -> ())) {
        self.simulation?.loadProject {
            DispatchQueue.main.async { [weak self] in
                self?.confirmProjectLoadedOnMainThread(completion:completion)
            }
        }
    }
    
    private func confirmProjectLoadedOnMainThread(completion:@escaping((Project) -> ())) {
        let project:Project? = self.simulation?.project
        XCTAssertNotNil(project, "Project not loaded")
        guard
            let loadedProject:Project = project
        else {
            return
        }
        completion(loadedProject)
    }
    
    private func validateProjectNameIsDifferent(project:Project, name:String) {
        XCTAssertNotEqual(project.name, name, "Names should be different")
    }
    
    private func changeProject(project:Project) {
        project.name = Constants.updatedName
    }
    
    private func validateProjectHasChanges(project:Project) {
        XCTAssertEqual(project.name, Constants.updatedName)
    }
}
