import XCTest

@testable import BitwardenShared

class VaultSettingsProcessorTests: BitwardenTestCase {
    // MARK: Properties

    var coordinator: MockCoordinator<SettingsRoute>!
    var subject: VaultSettingsProcessor!

    // MARK: Setup and Teardown

    override func setUp() {
        super.setUp()

        coordinator = MockCoordinator<SettingsRoute>()
        subject = VaultSettingsProcessor(coordinator: coordinator.asAnyCoordinator())
    }

    override func tearDown() {
        super.tearDown()

        coordinator = nil
        subject = nil
    }

    // MARK: Tests

    /// Receiving `.exportVaultTapped` navigates to the export vault screen.
    func test_receive_exportVaultTapped() {
        subject.receive(.exportVaultTapped)

        XCTAssertEqual(coordinator.routes.last, .exportVault)
    }

    /// Receiving `.foldersTapped` navigates to the folders screen.
    func test_receive_foldersTapped() {
        subject.receive(.foldersTapped)

        XCTAssertEqual(coordinator.routes.last, .folders)
    }
}