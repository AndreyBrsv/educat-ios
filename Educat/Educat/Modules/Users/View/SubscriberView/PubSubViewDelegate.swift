
import Foundation

@objc protocol PubSubViewDelegate: class {
    
    func setupPubSubView() -> Void

    /// Данный метод вызывается тогда, когда кнопка подписки была
    /// нажата. Должен быть определен, если нужно как-то на это
    /// событие реагировать.
    @objc optional func subscribeButtonTapped() -> Void
    
}
