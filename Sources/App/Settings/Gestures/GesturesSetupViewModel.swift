import Foundation
import Shared

final class GesturesSetupViewModel: ObservableObject {
    @Published var settings: [AppGesture: HAGestureAction] = [:]

    init() {
        self.settings = Current.settingsStore.gestures
    }

    func selection(for gesture: AppGesture) -> HAGestureAction {
        settings[gesture] ?? .none
    }

    func setSelection(for gesture: AppGesture, newValue: HAGestureAction) {
        Current.settingsStore.gestures[gesture] = newValue
        settings = Current.settingsStore.gestures
    }
}
