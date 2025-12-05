import Factory

@propertyWrapper
public struct Injected<T> {
    private var dependency: T

    public var wrappedValue: T {
        get { dependency }
        mutating set { dependency = newValue }
    }

    public init(_ keyPath: KeyPath<Container, Factory<T>>) {
        dependency = Container.shared[keyPath: keyPath]()
    }
}
