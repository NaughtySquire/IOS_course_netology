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
    var VIN: Int { get }
}


protocol DealershipProtocol{
    var name: String{ get }
    var showroomCapacity: Int{ get }
    var stockCars: [Car]{ get set }
    var showroomCars: [Car]{ get set }
    var cars: [Car] { get }
    func offerAccesories(_ accesories: [String])
    func presaleService(_ car: Car)
    func addToShowroom(_ car: Car) throws
    func sellCar(_ car: Car)
    func orderCar()
}

struct Car: CarProtocol{
    private static var lastId: Int = 0
    var VIN: Int
    var model: String
    var color: String
    var buildDate: Date
    var price: Double
    var accesories: [String]
    var isServiced: Bool
    init(
        model: String,
        color: String,
        buildDate: Date,
        price: Double,
        accesories: [String],
        isServiced: Bool
    ) {
        self.model = model
        self.color = color
        self.buildDate = buildDate
        self.price = price
        self.accesories = accesories
        self.isServiced = isServiced
        Car.lastId += 1
        VIN = Car.lastId
    }
}
extension Car{
    func equals(_ equated: Car) -> Bool{
        self.VIN == equated.VIN
    }
    func showInfo(){
        print("----------------------------")
        print("VIN: \(VIN) Марка: \(model) Цвет: \(color) \nДата производства: \(buildDate)\nСтоимость: \(price)\n" + "Акксесуары: " + accesories.joined(separator: ", "))

    }
}


class Dealership: DealershipProtocol{
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var slogan: String
    var cars: [Car] {
        get{
            stockCars + showroomCars
        }
    }

    init(_ name: String, _ showroomCapacity: Int, _ slogan: String){
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.slogan = slogan
    }

    func offerAccesories(_ accesories: [String]) {
        print("Желаете ли приобрести: " + accesories.joined(separator: ", ") + "?")
    }

    func presaleService(_ car: Car) {
        if let carIndex = stockCars.firstIndex(where: {$0.equals(car)}){
            stockCars[carIndex].isServiced = true
            print("Для автомобиля \(car.model) проведена предпродажная подготовка.")
        }
    }
    // TASK - 2
    func addToShowroom(_ car: Car) throws {
        guard let _ = stockCars.firstIndex(where: {$0.equals(car)}) else{
            throw CarDealingError.addToShowroomError
        }
        presaleService(car)
        showroomCars.append(car)
        stockCars.removeAll(where: {$0.equals(car)})
        print("Автомобиль \(car.model) перемещен в салон.")
    }

    func sellCar(_ car: Car) {
        if !car.isServiced{
            presaleService(car)
        }
        if car.accesories.isEmpty{
            let accesories: [String] = ["тонировка", "сигнализация", "спортивные диски"]
            offerAccesories(accesories)
        }
        showroomCars.removeAll(where: {$0.equals(car)})
        stockCars.removeAll(where: {$0.equals(car)})
        print("Машина \(name) продана покупателю")
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

// СЛОГАНЫ
for dealership in dealerships {
    dealership.showSlogan()
}

protocol SpecialOffer{
     func addEmergencyPack()
     func makeSpecialOffer() throws
}


extension Dealership: SpecialOffer{

    func makeSpecialOffer() throws{
        let calendar = Calendar.current
        for carIndex in stockCars.indices{
            guard calendar.component(.year, from: Date()) > calendar.component(.year, from: stockCars[carIndex].buildDate) else{
                throw CarDealingError.specialOfferError
            }
            stockCars[carIndex].price *= 0.85
            stockCars[carIndex].accesories += ["аптечка", "огнетушитель"]
        }
        for carIndex in showroomCars.indices{
            guard calendar.component(.year, from: Date()) > calendar.component(.year, from: showroomCars[carIndex].buildDate) else{
                throw CarDealingError.specialOfferError
            }
            showroomCars[carIndex].price *= 0.85
            showroomCars[carIndex].accesories += ["аптечка", "огнетушитель"]
        }

    }

    func addEmergencyPack() {
        for carIndex in stockCars.indices{
            stockCars[carIndex].accesories += ["аптечка", "огнетушитель"]
        }
        for carIndex in showroomCars.indices{
            showroomCars[carIndex].accesories += ["аптечка", "огнетушитель"]
        }
    }

}

for dealership in dealerships{
    do{
        try dealership.makeSpecialOffer()
    }catch(CarDealingError.specialOfferError){
        print(CarDealingError.specialOfferError.descriprtion)
    }
}

for dealership in dealerships {
    for i in 0..<(dealership.cars.count){
        dealership.cars[i].showInfo()
    }
}
