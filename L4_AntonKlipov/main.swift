//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.

import Foundation

enum Action {
    case swichOnClimate
    case swichOffClimate
    case swichOnMp3
    case swichOffMp3
    case manual
    case auto
}

enum Transmission: String  {
    case manual
    case auto
}

enum SportCarAction {
    case turnОnNitricOxide
    case turnОffNitricOxide
    case toSportMode
    case toNormalMode
    case lowerSuspension
    case raiseSuspension
}

enum TruckAction {
    case turnОnRadio
    case turnОffRadio
    case beep
}

enum TruckType: String {
    case trailer
    case refrigerator
    case tanker
    case van
}

class Car {
    let brand: String
    let color: String
    var mp3: Bool
    var climateControl: Bool
    var transsmition: Transmission
    let enginePower: Double
    let buidYear: Int
    let trunkOriginalVolume: Double

    init(brand: String, color: String, mp3: Bool, climateControl: Bool, enginePower: Double, buidYear: Int, trunkOriginalVolume: Double, transsmition: Transmission) {
        self.brand = brand
        self.color = color
        self.mp3 = mp3
        self.climateControl = climateControl
        self.enginePower = enginePower
        self.buidYear = buidYear
        self.trunkOriginalVolume = trunkOriginalVolume
        self.transsmition = transsmition
    }
    
    func makeAction(action: Action?, sportCarAction: SportCarAction?, truckAction: TruckAction?) {
        switch action {
        case .swichOnClimate:
            climateControl = true
            print("Климат-контроль включен")
        case .swichOffClimate:
            climateControl = false
            print("Климат-контроль выключен")
        case .swichOnMp3:
            mp3 = true
            print("MP3-плеер включен")
        case .swichOffMp3:
            mp3 = false
            print("MP3-плеер выключен")
        case .manual:
            transsmition = .manual
            print("Коробка заменена на ручную коробку")
        case .auto:
            transsmition = .auto
            print("Коробка заменена на автоматическую коробку")
        case .none: break
            
        }
    }
    
    func printInfo() {
        print("Марка авто: \(self.brand)")
        print("Цвет: \(self.color)")
        print("Mp3 плеер: \(self.mp3 ? "имеется" : "не имеется")")
        print("Климат-контроль: \(self.climateControl ? "имеется" : "не имеется")")
        print("Трансмиссия: \(self.transsmition == .auto ? "автоматическая" : "ручная")")
        print("Мощность двигателя: \(self.enginePower) лс")
        print("Год выпуска: \(self.buidYear) г")
        print("Объем бака: \(self.trunkOriginalVolume) л")
    }
}

var lada = Car(brand: "Volvo", color: "зеленый", mp3: true, climateControl: true, enginePower: 300, buidYear: 2008, trunkOriginalVolume: 50, transsmition: .auto)

lada.printInfo()
print("-----------------------------------------------------------------------------")
lada.makeAction(action: .swichOffClimate, sportCarAction: nil,  truckAction: nil)
lada.makeAction(action: .swichOnMp3, sportCarAction: nil,  truckAction: nil)

print("-----------------------------------------------------------------------------")
  
var zaz = Car(brand: "Zaporozhets", color: "красный", mp3: false, climateControl: false, enginePower: 50, buidYear: 1960, trunkOriginalVolume: 20, transsmition: .auto)

zaz.printInfo()
print("-----------------------------------------------------------------------------")
    
class SportCar: Car {
    let spoiler: Bool
    var nitricOxide: Bool
    let cabronElements: Bool
    let maxSpeed: Int
    var sportMode: Bool
    var lowerSuspension: Bool
    
    init(brand: String, color: String, mp3: Bool, climateControl: Bool, enginePower: Double, buidYear: Int, trunkOriginalVolume: Double, spoiler: Bool, nitricOxide: Bool, cabronElements: Bool, maxSpeed: Int,transsmition: Transmission, sportMode: Bool, lowerSuspension: Bool) {
        
        self.spoiler = spoiler
        self.nitricOxide = nitricOxide
        self.cabronElements = cabronElements
        self.maxSpeed = maxSpeed
        self.sportMode = sportMode
        self.lowerSuspension = lowerSuspension
        
        super.init(brand: brand, color: color, mp3: mp3, climateControl: climateControl, enginePower: enginePower, buidYear: buidYear, trunkOriginalVolume: trunkOriginalVolume, transsmition: transsmition)
    }
    
    override func makeAction(action: Action?, sportCarAction: SportCarAction?, truckAction: TruckAction?) {
        super.makeAction(action:action, sportCarAction: sportCarAction, truckAction: truckAction)

        switch sportCarAction {
        case .turnОnNitricOxide:
            nitricOxide = true
            print("Закись озота подключена")
        case .turnОffNitricOxide:
            nitricOxide = false
            print("Закись озота отключена")
        case .toSportMode:
            sportMode = true
            print("Автомобиль в спротивном режиме")
        case .toNormalMode:
            sportMode = false
            print("Автомобиль в стандартном режиме")
        case .lowerSuspension:
            lowerSuspension = true
            print("Подвеска в спортивном режиме")
        case .raiseSuspension:
            lowerSuspension = false
            print("Подвеска в стандартном режиме")
        case .none: break
        }
    }
    
    override func printInfo() {
        super.printInfo()
        print("Cпойлера: \(self.spoiler ? "имеется" : "не имеется")")
        print("Элемента из карбона: \(self.cabronElements ? "имеются" : "не имеются")")
        print("Максимальная скорость: \(self.maxSpeed) км/ч")
        print("Климат-контроль: \(self.climateControl ? "имеется" : "не имеется")")
        print("Трансмиссия: \(self.transsmition == .auto ? "автоматическая" : "ручная")")
        
    }
}

var porsche = SportCar(brand: "Porsche", color: "морской волны", mp3: true, climateControl: true, enginePower: 300, buidYear: 2020, trunkOriginalVolume: 40, spoiler: true, nitricOxide: true, cabronElements: false, maxSpeed: 320, transsmition: .manual,  sportMode: false, lowerSuspension: false)

porsche.printInfo()
print("-----------------------------------------------------------------------------")
porsche.makeAction(action: .swichOnClimate, sportCarAction: nil,  truckAction: nil)
porsche.makeAction(action: .swichOnMp3, sportCarAction: nil,  truckAction: nil)
porsche.makeAction(action: nil, sportCarAction: .turnОnNitricOxide,  truckAction: nil)
porsche.makeAction(action: nil, sportCarAction: .toNormalMode,  truckAction: nil)
porsche.makeAction(action: nil, sportCarAction: .lowerSuspension,  truckAction: nil)

print("-----------------------------------------------------------------------------")

class TruckCar: Car {

    let truckType: TruckType
    let bed: Bool
    var radio: Bool
    let cargoWeight: Double
    let cargoVolume: Double
    var beep: Bool
    
    init(brand: String, color: String, mp3: Bool, climateControl: Bool, enginePower: Double, buidYear: Int, trunkOriginalVolume: Double, truckType: TruckType, bed: Bool, radio: Bool, cargoWeight: Double, cargoVolume: Double, transsmition: Transmission, beep: Bool){
    
        self.truckType = truckType
        self.bed = bed
        self.radio = radio
        self.cargoWeight = cargoWeight
        self.cargoVolume = cargoVolume
        self.beep = beep
        
        super.init(brand: brand, color: color, mp3: mp3, climateControl: climateControl, enginePower: enginePower, buidYear: buidYear, trunkOriginalVolume: trunkOriginalVolume, transsmition: transsmition)
    }
    
    override func makeAction(action: Action?, sportCarAction: SportCarAction?, truckAction: TruckAction?) {
        super.makeAction(action:action, sportCarAction: sportCarAction, truckAction: truckAction)

        switch truckAction {
        case .turnОnRadio:
            radio = true
            print("Рация включена")
        case .turnОffRadio:
            radio = false
            print("Рация отключена")
        case .beep:
            beep = true
            print("Издан звуковой сигнал")
        case .none: break
            
        }
    }
    
    override func printInfo() {
        super.printInfo()
        print("Тип грузовика: \(self.truckType)")
        print("Кровать: \(self.bed  ? "имеется" : "не имеется")")
        print("Вес груза: \(self.cargoWeight) т")
        print("Объем груза: \(self.cargoVolume) л")
    }
}

var kamaz = TruckCar(brand: "Кamaz", color: "красненький", mp3: false, climateControl: false, enginePower: 50, buidYear: 1960, trunkOriginalVolume: 20, truckType: .refrigerator, bed: true,  radio: true, cargoWeight: 3.5, cargoVolume: 800, transsmition: .manual, beep: true)

kamaz.printInfo()

print("-----------------------------------------------------------------------------")
kamaz.makeAction(action: .swichOnClimate, sportCarAction: nil,  truckAction: nil)
kamaz.makeAction(action: .swichOnMp3, sportCarAction: nil,  truckAction: nil)
kamaz.makeAction(action: nil, sportCarAction: nil,  truckAction: .turnОnRadio)
kamaz.makeAction(action: nil, sportCarAction: nil,  truckAction: .beep)
