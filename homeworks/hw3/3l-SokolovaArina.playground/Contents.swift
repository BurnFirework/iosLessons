enum Action {
    case openWindows
    case closeWindows
    case turnOnEngine
    case turnOffEngine
    case addCargo(volume: Int)
    case dropCargo(volume: Int)
}

struct SportCar {
    let brand: String
    let release: Int
    let trunk: Int
    var engineStart: Bool
    var windows: Bool
    var volumeTrunk: Int
    mutating func actions(_ state: Action) {
        switch state {
        case .openWindows:
            if !self.windows {
            self.windows = true
            } else {
                print("Окна уже открыты!")
            }
        case .closeWindows:
            if self.windows {
                self.windows = false
            } else {
                print("Окна уже закрыты!")
            }
        case .turnOnEngine:
            if !self.engineStart {
                self.engineStart = true
            } else {
                print("Двигатель уже запущен!")
            }
        case .turnOffEngine:
            if self.engineStart {
                self.engineStart = false
            } else {
                print("Двигатель уже заглушен!")
            }
        case .addCargo(let volume):
            if self.volumeTrunk + volume < self.trunk {
                self.volumeTrunk += volume
            } else {
                print("Багажник переполнен")
            }
        case .dropCargo(let volume):
            if self.volumeTrunk - volume > 0 {
                self.volumeTrunk -= volume
            } else {
                print("Не хватает груза в багажнике")
            }
        }
    }
}

struct TrunkCar {
    let brand: String
    let release: Int
    let trunk: Int
    var engineStart: Bool
    var windows: Bool
    var volumeTrunk: Int
    mutating func actions(_ state: Action) {
        switch state {
        case .openWindows:
            if !self.windows {
            self.windows = true
            } else {
                print("Окна уже открыты!")
            }
        case .closeWindows:
            if self.windows {
                self.windows = false
            } else {
                print("Окна уже закрыты!")
            }
        case .turnOnEngine:
            if !self.engineStart {
                self.engineStart = true
            } else {
                print("Двигатель уже запущен!")
            }
        case .turnOffEngine:
            if self.engineStart {
                self.engineStart = false
            } else {
                print("Двигатель уже заглушен!")
            }
        case .addCargo(let volume):
            if self.volumeTrunk + volume < self.trunk {
                self.volumeTrunk += volume
            } else {
                print("Багажник переполнен")
            }
        case .dropCargo(let volume):
            if self.volumeTrunk - volume > 0 {
                self.volumeTrunk -= volume
            } else {
                print("Не хватает груза в багажнике")
            }
        }
    }
}

var mcQueen = SportCar(brand: "Chevrolet", release: 2013, trunk: 250, engineStart: true, windows: false, volumeTrunk: 100)
var mater = TrunkCar(brand: "Dodge Power Giant", release: 1957, trunk: 400, engineStart: false, windows: true, volumeTrunk: 200)
mcQueen.actions(.turnOnEngine)
mcQueen.actions(.openWindows)
print(mcQueen.brand)
print(mcQueen.release)
print(mcQueen.trunk)
print(mcQueen.engineStart)
print(mcQueen.windows)
mcQueen.actions(.dropCargo(volume: 40))
print(mcQueen.volumeTrunk)
mater.actions(.addCargo(volume: 50))
mater.actions(.openWindows)
print(mater.volumeTrunk)
print(mater.brand)
print(mater.release)
print(mater.trunk)
print(mater.engineStart)
print(mater.windows)
var sallyCarrera = TrunkCar(brand: "Porshe 911", release: 2002, trunk: 300, engineStart: false, windows: false, volumeTrunk: 20)
print(sallyCarrera.brand)
sallyCarrera.actions(.turnOnEngine)
sallyCarrera.actions(.openWindows)
print(sallyCarrera.release)
print(sallyCarrera.trunk)
print(sallyCarrera.engineStart)
print(sallyCarrera.windows)
