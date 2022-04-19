// MARK: - Number one
enum TheaterTicketOfficeError: Error {
    //спектакля нет в прокате
    case invalidSelection
    //нет билетов в наличии
    case outOfStock
    // недостаточно денег на карте
    case insufficientFunds(coinsNeeded: Int)
}

///Информация о спектакле
struct Information {
    var price: Int
    var numberOfSeats: Int
    let perfomance: Perfomance
}

///Спектакль
struct Perfomance{
    let name: String
}

///Касса театра
class TheaterTicketOfficeOne {
    ///текущие постановки
    var perfomances = [
            "Romeo and Juliet": Information(price: 5000,
                                            numberOfSeats: 120,
                                            perfomance: Perfomance(name: "Romeo and Juliet")),
            "Anna Karenina": Information(price: 4500,
                                         numberOfSeats: 200,
                                         perfomance: Perfomance(name: "Anna Karenina")),
            "Eugene Onegin": Information(price: 7000,
                                         numberOfSeats: 160,
                                         perfomance: Perfomance(name: "Eugene Onegin")),
            "Don Quixote": Information(price: 12000,
                                         numberOfSeats: 343,
                                         perfomance: Perfomance(name: "Don Quixote")),
        ]
    /// количество денег, переданное покупателем
    var coinsDeposited: Int = 0
    /// возраст покупателя
    var age: Int
    ///Социальные льготы = 0
    var socialBenefits: Bool
    
    init(coinsDeposited: Int, age: Int, socialBenefits: Bool) {
        self.coinsDeposited = coinsDeposited
        self.age = age
        self.socialBenefits = socialBenefits
    }
    
    func vend(perfomanceNamed name: String) -> (Perfomance?, TheaterTicketOfficeError?) {
        //если спектакля нет в прокате
        guard let ticket = perfomances[name] else {
            return (nil, TheaterTicketOfficeError.invalidSelection)
        }
        // если закончились билеты
        guard ticket.numberOfSeats >= 0 else {
            return (nil, TheaterTicketOfficeError.outOfStock)
        }
        
        if ticket.price <= coinsDeposited {
            coinsDeposited -= ticket.price
            var newItem = ticket
            newItem.numberOfSeats -= 1
            perfomances[name] = newItem
            return (newItem.perfomance, nil)
        } else {
            if self.age < 18 || socialBenefits {
                return (ticket.perfomance, nil)
            } else {
                // Если недостаточно денег и нет льгот
                return (nil, TheaterTicketOfficeError.insufficientFunds(coinsNeeded:
                                                                        ticket.price - coinsDeposited))
            }
        }
    }
}

var personOne = TheaterTicketOfficeOne(coinsDeposited: 4000, age: 24, socialBenefits: false)
let ticketOne = personOne.vend(perfomanceNamed: "Anna Karenina")
if let ticket = ticketOne.0 {
    print("Мы купили: \(ticket.name)")
} else if let error = ticketOne.1 {
    print("Произошла ошибка: \(error)")
}

var personTwo = TheaterTicketOfficeOne(coinsDeposited: 30, age: 12, socialBenefits: false)
let ticketTwo = personTwo.vend(perfomanceNamed: "Romeo and Juliet")
if let ticket = ticketTwo.0 {
    print("Мы купили: \(ticket.name)")
} else if let error = ticketTwo.1 {
    print("Произошла ошибка: \(error)")
}

// MARK: - Number Two

///Касса театра
class TheaterTicketOfficeTwo {
    ///текущие постановки
    var perfomances = [
            "Romeo and Juliet": Information(price: 5000,
                                            numberOfSeats: 120,
                                            perfomance: Perfomance(name: "Romeo and Juliet")),
            "Anna Karenina": Information(price: 4500,
                                         numberOfSeats: 200,
                                         perfomance: Perfomance(name: "Anna Karenina")),
            "Eugene Onegin": Information(price: 7000,
                                         numberOfSeats: 160,
                                         perfomance: Perfomance(name: "Eugene Onegin")),
            "Don Quixote": Information(price: 12000,
                                         numberOfSeats: 343,
                                         perfomance: Perfomance(name: "Don Quixote")),
        ]
    /// количество денег, переданное покупателем
    var coinsDeposited: Int = 0
    /// возраст покупателя
    var age: Int
    ///Социальные льготы = 0
    var socialBenefits: Bool
    
    init(coinsDeposited: Int, age: Int, socialBenefits: Bool) {
        self.coinsDeposited = coinsDeposited
        self.age = age
        self.socialBenefits = socialBenefits
    }
    
    func vend(perfomanceNamed name: String) throws -> Perfomance{
        //если спектакля нет в прокате
        guard let ticket = perfomances[name] else {
            throw TheaterTicketOfficeError.invalidSelection
        }
        // если закончились билеты
        guard ticket.numberOfSeats >= 0 else {
            throw TheaterTicketOfficeError.outOfStock
        }
        
        if ticket.price <= coinsDeposited {
            coinsDeposited -= ticket.price
            var newItem = ticket
            newItem.numberOfSeats -= 1
            perfomances[name] = newItem
            return newItem.perfomance
        } else {
            if self.age < 18 || socialBenefits {
                return ticket.perfomance
            } else {
                // Если недостаточно денег и нет льгот
                throw TheaterTicketOfficeError.insufficientFunds(coinsNeeded:
                                                                    ticket.price - coinsDeposited)
            }
        }
    }
}

var personThree = TheaterTicketOfficeTwo(coinsDeposited: 10000, age: 35, socialBenefits: false)
do {
    let ticketThree = try personThree.vend(perfomanceNamed: "Three comrades")
    print("Мы купили: \(ticketThree.name)")
} catch let error {
    print("Произошла ошибка: \(error)")
}

var personFour = TheaterTicketOfficeTwo(coinsDeposited: 12500, age: 40, socialBenefits: false)
do {
    let ticketFour = try personFour.vend(perfomanceNamed: "Don Quixote")
    print("Мы купили: \(ticketFour.name)")
} catch let error {
    print("Произошла ошибка: \(error)")
}
