///Время ожидания
protocol WaitingTime {
    var numberOfHours: Double {get set}
}

///Дети ждут в очереди
class Children: WaitingTime{
    let name: String
    var cry: Bool
    var numberOfHours: Double
    
    func calmPerson() -> String {
        self.cry = false
        return "Ребенку дали игрушку и он перестал плакать"
    }
    
    init(cry: Bool, numberOfHours: Double, name: String) {
        self.cry = cry
        self.numberOfHours = numberOfHours
        self.name = name
    }
}

///Взрослые ждут в очереди
class Adult: WaitingTime {
    let name: String
    var angry: Bool
    var numberOfHours: Double
 
    func calmPerson() -> String {
        self.angry = false
        return "Накричали и сказали успокоится, ибо все ждут с 7 утра"
    }
    
    init(angry: Bool, numberOfHours: Double, name: String) {
        self.angry = angry
        self.numberOfHours = numberOfHours
        self.name = name
    }
    
}

///Поликлиника
struct Polyclinic<T: WaitingTime> {
    var peopleInQueue: [T] = []
    
    mutating func push(_ element: T) {
        peopleInQueue.append(element)
    }
    mutating func pop() -> T? {
        return peopleInQueue.removeFirst()
    }
    
    var totalHours : Double {
        var numberOfHours = 0.0
        for hours in peopleInQueue {
            numberOfHours += hours.numberOfHours
        }
        return numberOfHours
    }
    
    subscript(indices: UInt ...) -> Double? {
        var numberOfHours: Double = 0.0
        for index in indices {
            if index >= self.peopleInQueue.count {
                return nil
            } else {
                numberOfHours += self.peopleInQueue[Int(index)].numberOfHours
            }
        }
        return numberOfHours
    }
}


var queueOne = Polyclinic<Children>()
queueOne.push(Children(cry: true, numberOfHours: 1, name: "Max"))
queueOne.push(Children(cry: false, numberOfHours: 0.5, name: "Alina"))
queueOne.push(Children(cry: true, numberOfHours: 2.3, name: "Oleg"))
queueOne.push(Children(cry: false, numberOfHours: 0.3, name: "Polina"))
queueOne.push(Children(cry: true, numberOfHours: 3, name: "Alex"))
queueOne.push(Children(cry: false, numberOfHours: 0.9, name: "Oleg"))

print(queueOne[0, 2, 3])

var childrenArray = queueOne.peopleInQueue

///Ищем тех, кто долго ждет
let longWait = {
    return $0 >= 1.0
}

let nameOleg = {
    return $0 == "Oleg"
}

///Дать конфетку
func giveCandy(array: [Children], predicate: (Double) -> Bool ){
    let countChildren = array.count
    for index in 0...countChildren-1 {
        if predicate(array[index].numberOfHours) {
            print("Дать конфету человеку по имени \(array[index].name)")
            
        }
    }
}

///Показать сколько времени ждет человек
func showTimeWaiting(array: [Children], predicate: (String) -> Bool ) {
    let countChildren = array.count
    for index in 0...countChildren-1 {
        if predicate(array[index].name) {
            print("Человек по имени \(array[index].name), ждет уже \(array[index].numberOfHours)")
            
        }
    }
}

giveCandy(array: childrenArray, predicate: longWait)
showTimeWaiting(array: childrenArray, predicate: nameOleg)
