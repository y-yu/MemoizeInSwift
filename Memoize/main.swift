import Foundation

func test(b: Bool) -> Int {
    print("called: " + b.description)
    if (b) {
        return 1
    } else {
        return 0
    }
}

var memoizeTest = memoize(test)

print(memoizeTest(false))
print(memoizeTest(false))
print(memoizeTest(false))
print(memoizeTest(false))

print(memoizeTest(true))
print(memoizeTest(true))
print(memoizeTest(true))
print(memoizeTest(true))