extension Future {
    @available(*, deprecated, renamed: "cascade(promise:)")
    public func chain(to promise: Promise<T>) {
        self.cascade(promise: promise)
    }
}

extension Array where Element == Future<Void> {
    @available(*, deprecated)
    public func transform<T>(on worker: Worker, to callback: @escaping () throws -> Future<T>) -> Future<T> {
        return flatten(on: worker).flatMap(to: T.self, callback)
    }
}
