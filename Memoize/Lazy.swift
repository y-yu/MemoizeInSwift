class Lazy<A> {
    let f: () -> A
    var v: (() -> A)? = Optional.None
    
    init (_ g: () -> A) {
        f = g
        v = {
            let v1 = self.f()
            self.v = { v1 }
            return v1
        }
    }
}

func suspend<A>(f: () -> A) -> Lazy<A> {
    return Lazy(f)
}

func force<A>(l: Lazy<A>) -> A {
    return l.v!()
}