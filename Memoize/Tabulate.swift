protocol Tabulate {
    static func tabulate<R>(f: Self -> R) -> Self -> Lazy<R>
}

extension Bool: Tabulate {
    static func tabulate<R>(f: Bool -> R) -> Bool -> Lazy<R> {
        let r1 = suspend({ f(true) })
        let r2 = suspend({ f(false) })
        return {(b: Bool) -> Lazy<R> in
            if (b) {
                return r1
            } else {
                return r2
            }
        }
    }
}