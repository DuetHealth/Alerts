import Testing
@testable import Alerts

@Suite("AlertAction Tests")
struct AlertActionTests {

    @Test("Cancel action has cancel behavior")
    func cancelActionHasCancelBehavior() {
        let action = AlertAction.cancel(title: "Cancel")
        #expect(action.behavior == .cancel)
        #expect(action.title == "Cancel")
        #expect(action.action == nil)
    }

    @Test("Default action has default behavior")
    func defaultActionHasDefaultBehavior() {
        let action = AlertAction.default(title: "OK")
        #expect(action.behavior == .default)
        #expect(action.title == "OK")
    }

    @Test("Destructive action has destructive behavior")
    func destructiveActionHasDestructiveBehavior() {
        let action = AlertAction.destructive(title: "Delete")
        #expect(action.behavior == .destructive)
        #expect(action.title == "Delete")
    }

    @Test("Action stores provided closure")
    func actionStoresClosure() {
        var called = false
        let action = AlertAction.default(title: "OK") { called = true }
        action.action?()
        #expect(called)
    }

}

@Suite("Alert Tests")
struct AlertTests {

    @Test("Alert stores title and message")
    func alertStoresTitleAndMessage() {
        let alert = Alert(title: "Hello", message: "World")
        #expect(alert.title == "Hello")
        #expect(alert.message == "World")
    }

    @Test("Alert stores actions")
    func alertStoresActions() {
        let action = AlertAction.default(title: "OK")
        let alert = Alert(title: nil, actions: action)
        #expect(alert.actions.count == 1)
        #expect(alert.actions.first?.title == "OK")
    }

    @Test("Alert has empty text fields by default")
    func alertHasEmptyTextFieldsByDefault() {
        let alert = Alert(title: "Test")
        #expect(alert.textFields.isEmpty)
    }

}

@Suite("AlertTextField Tests")
struct AlertTextFieldTests {

    @Test("AlertTextField stores placeholder and initial value")
    func textFieldStoresValues() {
        let textField = AlertTextField(placeholder: "Enter text", initialValue: "Hello")
        #expect(textField.placeholder == "Enter text")
        #expect(textField.initialValue == "Hello")
    }

    @Test("AlertTextField has empty defaults")
    func textFieldHasEmptyDefaults() {
        let textField = AlertTextField()
        #expect(textField.placeholder == "")
        #expect(textField.initialValue == "")
    }

}
