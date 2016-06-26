func memoize<A: Tabulate, R>(f: A -> R) -> A -> R {
    let f1 = A.tabulate(f)
    return { x in force(f1(x)) }
}
