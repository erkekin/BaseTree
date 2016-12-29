enum Bases:Character{
    case A = "A"
    case T = "T"
    case G = "G"
    case C = "C"
}

public class Base{
    
    public var char:Character?
    public var bases:(A:Base?,T:Base?,G:Base?,C:Base?)? = (nil,nil,nil,nil)
    public var count:Int = 1
    
    init() {
        self.char = nil
        
    }
    init(char:Character) {
        self.char = char
    }
}

public class BaseTree{
    
    public var root = Base()
    public init() {
        
        
    }
    private func convert(dnaSequence:String, roots:inout Base){
        let bases = dnaSequence.characters
            .lazy
            .map{$0}
        
        var previousBase:Base = root
        
        for char in bases{
            
            var currentBase:Base!
            let base = Base(char:char)
            switch char {
            case "A":
                if let a = previousBase.bases?.A {
                    a.count += 1
                    
                }else
                {
                    previousBase.bases?.A = base
                    
                }
                currentBase = previousBase.bases!.A!
            case "T":
                if let t = previousBase.bases?.T {
                    t.count += 1
                }else
                {
                    previousBase.bases?.T = base
                    
                }
                currentBase = previousBase.bases!.T!
            case "G":
                if let g = previousBase.bases?.G {
                    g.count += 1
                }else
                {
                    previousBase.bases?.G = base
                    
                }
                currentBase = previousBase.bases!.G!
            case "C":
                if let c = previousBase.bases?.C {
                    c.count += 1
                }else
                {
                    previousBase.bases?.C = base
                    
                }
                currentBase = previousBase.bases!.C!
            default:
                fatalError()
                
            }
            previousBase = currentBase
        }
        previousBase = root
        
    }
    
    public func append(dna:String){
        
        convert(dnaSequence: dna, roots: &root)
        
    }
}
//
//extension Character {
//    var scalarValue: Int {
//        let unicodeScalarView = String(self).unicodeScalars
//        let firstUnicodeScalar: UnicodeScalar = unicodeScalarView[unicodeScalarView.startIndex]
//
//        return Int(firstUnicodeScalar.value)
//    }
//}
