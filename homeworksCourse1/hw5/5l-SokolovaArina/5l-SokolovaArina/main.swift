enum WindowsStatus {
    case open
    case close
}

enum EngineStatus {
    case turnOnEngine
    case turnOffEngine
}

enum CargoActions {
    case addCargo(volume: Int)
    case dropCargo(volume: Int)
}

///Протокол для описания машины
protocol CarDescriptionProtocol: CustomStringConvertible{
    func carDescription()
}

extension CarDescriptionProtocol{
    func carDescription() {
        print(description)
    }
}

protocol CarProtocol {
    var brand: String { get }
    var release: Int { get }
    var trunk: Int { get }
    var engineStart: Bool { get set }
    var windows: Bool { get set }
    var volumeTrunk: Int { get set }
    
    func sound()
}

extension CarProtocol {
    mutating func windowActions(_ state: WindowsStatus) {
        switch state {
        case .open:
            if !self.windows {
                self.windows = true
            } else {
                print("Окна уже открыты!")
            }
        case .close:
            if self.windows {
                self.windows = false
            } else {
                print("Окна уже закрыты!")
            }
        }
    }
    
    mutating func engineActions(_ state: EngineStatus) {
        switch state {
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
        }
    }
    
    mutating func fillCargo(_ state: CargoActions) {
        switch state {
        case .addCargo(let volume):
            if self.volumeTrunk + volume < self.trunk {
                self.volumeTrunk += volume
            } else {
                print("Багажник переполнен")
            }
        case .dropCargo(let volume):
            if self.volumeTrunk - volume >= 0 {
                self.volumeTrunk -= volume
            } else {
                print("Не хватает груза в багажнике")
            }
        }
    }
}

///Спортивный автомобиль
final class sportСar: CarProtocol, CarDescriptionProtocol {
    var brand: String
    var release: Int
    var trunk: Int
    var engineStart: Bool
    var windows: Bool
    var volumeTrunk: Int
    ///Открыта ли крыша
    var roofStatus: String
    
    init(roofStatus: String, brand: String, release: Int,
             trunk: Int, engineStart: Bool, windows: Bool, volumeTrunk: Int) {
        self.roofStatus = roofStatus
        self.brand = brand
        self.release = release
        self.trunk = trunk
        self.engineStart = engineStart
        self.windows = windows
        self.volumeTrunk = volumeTrunk
    }
    
    var description: String {
        return """
                Машина модели \(self.brand) была выпущена в \(self.release) году.
                Объем багажника - \(self.trunk), заполнено - \(self.volumeTrunk).
                """
    }
    
    ///Звук машины
    func sound() {
        print("РРРРРРРРРРРРРРРР")
    }
    
    enum RoofStatus: String {
           case roofIsOpen
           case roofIsClose
       }
       
    ///Изменить состояние крыши
    func changeRoofStatus(_ state: RoofStatus) {
        switch state {
        case .roofIsOpen:
            self.roofStatus = RoofStatus.roofIsOpen.rawValue
        case .roofIsClose:
            self.roofStatus = RoofStatus.roofIsClose.rawValue
        }
    }
}

///Цистерна
final class trunkCar: CarProtocol, CarDescriptionProtocol {
    var brand: String
    var release: Int
    var trunk: Int
    var engineStart: Bool
    var windows: Bool
    var volumeTrunk: Int
    ///Прикреплен ли кузов
    var bodyConnection: Bool
    
    init(bodyConnection: Bool, brand: String, release: Int,
         trunk: Int, engineStart: Bool, windows: Bool, volumeTrunk: Int) {
        self.bodyConnection = bodyConnection
        self.brand = brand
        self.release = release
        self.trunk = trunk
        self.engineStart = engineStart
        self.windows = windows
        self.volumeTrunk = volumeTrunk
    }
    
    var description: String {
        return """
                Машина модели \(self.brand) была выпущена в \(self.release) году.
                Объем багажника - \(self.trunk), заполнено - \(self.volumeTrunk).
                """
    }

    ///Звук машины
    func sound() {
        print("Дыр-Дыр-Дыр-Дыр")
    }
    
    enum BodyConnection {
        case attached
        case notAttached
    }
    
    ///Прикрепить или открепить кузов
    func changeBodyConnection(_ state: BodyConnection) {
        switch state {
        case .attached:
            if !self.bodyConnection {
                self.bodyConnection = true
            } else {
                print("Кузов уже присоединен!")
            }
        case .notAttached:
            if self.bodyConnection {
                self.bodyConnection = false
            } else {
                print("Кузов уже отсоединен!")
            }
        }
    }
}

var oneSportCar = sportСar(roofStatus: "Крыша закрыта", brand: "Chevrolet",
                           release: 2015, trunk: 200, engineStart: false, windows: false, volumeTrunk: 20)
oneSportCar.changeRoofStatus(.roofIsOpen)
oneSportCar.fillCargo(.addCargo(volume: 50))
oneSportCar.engineActions(.turnOnEngine)
print(oneSportCar.brand)
print(oneSportCar.release)
print(oneSportCar.roofStatus)
print(oneSportCar.windows)
print(oneSportCar.engineStart)
print(oneSportCar.volumeTrunk)
print(oneSportCar.description)
print("--------")

var oneTrunkCar = trunkCar(bodyConnection: true, brand: "KAMAZ", release: 1998, trunk: 800, engineStart: false, windows: true, volumeTrunk: 600)
oneTrunkCar.fillCargo(.dropCargo(volume: 600))
oneTrunkCar.changeBodyConnection(.notAttached)
oneTrunkCar.engineActions(.turnOnEngine)
oneTrunkCar.windowActions(.open)
print(oneTrunkCar.brand)
print(oneTrunkCar.release)
print(oneTrunkCar.bodyConnection)
print(oneTrunkCar.windows)
print(oneTrunkCar.engineStart)
print(oneTrunkCar.volumeTrunk)
print(oneTrunkCar.description)
