//extension Array {
///// Returns the element at the specified index iff it is within bounds, otherwise nil.
//subscript(safe index: Index) -> Element? {
//return indices.contains(index) ? self[ index] : nil
//}
//}

extension Array {
subscript(safe index: Index) -> Element? {
get {
return indices.contains(index) ? self[ index] : nil
}

set(newValue) {
if let newValue = newValue, indices.contains(index) {
self[ index] = newValue
}
}
}
}
var a:[String] = ["q","w","e"]

a[safe: 3]="r"


print (a)
