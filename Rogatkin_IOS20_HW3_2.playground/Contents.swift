import Foundation

enum CarDealingError: Error{
    case specialOfferError, addToShowroomError
    var descriprtion: String {
        switch self{
        case .specialOfferError:
            return "Автомобиль не соответсвует требованиям акции."
        case .addToShowroomError:
            return "Машина не найдена на парковке. Возможно она уже перемещена в автосалон."
        }
    }
}

protocol CarProtocol{
    var model: String{ get }
    var color: String{ get }
    var buildDate: Date{ get }
    var price: Double{ get set }
    var accesories: [String]{ get set }
    var isServiced: Bool { get set }
}
extension CarProtocol{
    mutating func makePresaleService() -> Void{
        isServiced = true
        print("Для автомобиля \(model) проведена предпродажная подготовка.")
    }
    mutating func addAccesories(_ offeredAccesories: [String]){
        accesories += offeredAccesories
    }
    func equals(_ equated: Car) -> Bool{
        self.model == equated.model && self.color == equated.color && self.buildDate == equated.buildDate && self.price == equated.price && self.accesories == equated.accesories
    }
    func showInfo(){
        print("----------------------------")
        print("Марка: \(model) Цвет: \(color) Дата производства: \(buildDate)\nСтоимость: \(price)\n" + "Акксесуары: " + accesories.joined(separator: ", "))

    }
}

protocol DealershipProtocol{
    var name: String{ get }
    var showroomCapacity: Int{ get }
    var stockCars: [Car]{ get set }
    var showroomCars: [Car]{ get set }
    var cars: [Car] { get set }
    func offerAccesories(_ accesories: [String])
    func presaleService(_ car: inout Car)
    func addToShowroom(_ car: Car) throws
    func sellCar(_ car: inout Car)
    func orderCar()
}

struct Car: CarProtocol{
    var model: String
    var color: String
    var buildDate: Date
    var price: Double
    var accesories: [String]
    var isServiced: Bool
}


class Dealership: DealershipProtocol{
    var cars: [Car] = []
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var slogan: String

    init(_ name: String, _ showroomCapacity: Int, _ slogan: String){
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.slogan = slogan
    }

    func offerAccesories(_ accesories: [String]) {
        print("Желаете ли приобрести: " + accesories.joined(separator: ", ") + "?")

    }

    func presaleService(_ car: inout Car) {
        car.makePresaleService()
    }
    // TASK - 2
    func addToShowroom(_ car: Car) throws {
        guard let stockCarIndex = stockCars.firstIndex(where: {$0.equals(car)}) else{
            throw CarDealingError.addToShowroomError
        }

        showroomCars.append(stockCars[stockCarIndex])
        stockCars.remove(at: stockCarIndex)
    }

    func sellCar(_ car: inout Car) {
        if let carIndex = showroomCars.firstIndex(where: {$0.equals(car)}) {
            showroomCars.remove(at: carIndex)
        }else{
            stockCars.remove(at: stockCars.firstIndex(where: {$0.equals(car)})!)
        }
        if !car.isServiced{
            presaleService(&car)
        }
        if car.accesories.isEmpty{
            let accesories: [String] = ["тонировка", "сигнализация", "спортивные диски"]
            offerAccesories(accesories)
            car.addAccesories(accesories)
        }
        print("Машина \(name) продана покупателю")
        cars = stockCars + showroomCars
    }

    func orderCar() {
        let colors: [String] = ["Red", "Green", "Blue", "Black", "White"]
        let dates: [Date] = [
            Date(timeIntervalSinceNow: -60 * 60 * 24 * 1),
            Date(timeIntervalSinceNow: -60 * 60 * 24 * 2),
            Date(timeIntervalSinceNow: -60 * 60 * 24 * 3),
            Date(timeIntervalSinceNow: -60 * 60 * 24 * 366),
            Date(timeIntervalSinceNow: -60 * 60 * 24 * 367),
            Date(timeIntervalSinceNow: -60 * 60 * 24 * 368)
        ]
        stockCars.append(
            Car(
                model: name,
                color: colors.randomElement()!,
                buildDate: dates.randomElement()!,
                price: 777,
                accesories: [],
                isServiced: [true, false].randomElement()!
            )
        )
        print("Машина \(name) прибыла с завода на парковку.")
        cars = stockCars
    }
    func showSlogan(){
        print(name + ": " + slogan)
    }
}

var bmwDealership = Dealership("BMW", 20, "С удовольствием за рулём.")
var hondaDealership = Dealership("Honda", 25, "Сначала человек, потом машина.")
var audiDealership = Dealership("Audi", 20, "Tехническое превосходство.")
var lexusDealership = Dealership("Lexus", 15, "Неудержимое стремление к совершенству.")
var volvoDealership = Dealership("Volvo", 777, "Вольво для жизни!")

var dealerships = [bmwDealership, hondaDealership, audiDealership, lexusDealership, volvoDealership]
for dealership in dealerships{
    for _ in 0..<5{
        dealership.orderCar()
    }
    for _ in 0..<3{
        do{
            try dealership.addToShowroom(dealership.stockCars.randomElement()!)
        }catch CarDealingError.addToShowroomError{
            print(CarDealingError.addToShowroomError.descriprtion)
        }

    }
}


protocol SpecialOffer{
    mutating func addEmergencyPack()
    mutating func makeSpecialOffer() throws
}


extension Car: SpecialOffer{

    mutating func addEmergencyPack() {
        addAccesories(["аптечка", "огнетушитель"])
    }
    // TASK - 1
    mutating func makeSpecialOffer() throws{
        let calendar = Calendar.current
        guard calendar.component(.year, from: Date()) >
                calendar.component(.year, from: buildDate) else{
            throw CarDealingError.specialOfferError
        }
        self.price *= 0.85
        addEmergencyPack()
    }
}
// TASK - 1, 2
extension DealershipProtocol{
    mutating func checkCarsForSpecialOffer(){
        for i in 0..<cars.count{
            do {
                try cars[i].makeSpecialOffer()
                try addToShowroom(cars[i])
            } catch CarDealingError.specialOfferError {
                print(CarDealingError.specialOfferError.descriprtion)
            } catch CarDealingError.addToShowroomError{
                print(CarDealingError.addToShowroomError.descriprtion)
            } catch{}
        }
    }
}

for i in 0..<dealerships.count{
    dealerships[i].checkCarsForSpecialOffer()

}
for dealership in dealerships {
    for i in 0..<(dealership.cars.count - 3){
        dealership.cars[i].showInfo()
    }
}
