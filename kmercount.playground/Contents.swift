
let baseTree = BaseTree()
baseTree.append(dna: "ATA")
baseTree.append(dna: "AGA")
baseTree.append(dna: "ACA")
baseTree.append(dna: "ACA")

func goToBase(base:Base){
    
    if base.count == 0 {
        return
    }
    
    print("\(base.char as Any) \(base.count)")

    if let a = base.bases!.A{
        goToBase(base: a)
    }
    if let t = base.bases!.T{
        goToBase(base: t)
    }
    if let g = base.bases!.G{
        goToBase(base: g)
    }
    if let c = base.bases!.C{
        goToBase(base: c)
    }
    
}

goToBase(base: baseTree.root)