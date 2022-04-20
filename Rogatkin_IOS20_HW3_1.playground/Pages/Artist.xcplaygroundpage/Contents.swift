import Darwin
// TASK - 1
class Artist{
    var name, country, genre: String
    init(_ name: String) {
        self.name = name
        country = ""
        genre = ""
    }
    func writeTrack(_ track: String){
        print("Я \(name) написал трек \(track).")
    }
    func playTrack(_ track: String){
        print("Я \(name) исполнил трек \(track).")
    }
}

final class Drummer: Artist{

    override init(_ name: String) {
        super.init(name)
    }
    override func writeTrack(_ track: String) {
        print("Я \(name) написал барабанную партию для трека \(track).")
    }
    override func playTrack(_ track: String){
        print("Я \(name) исполнил барабанную партию для трека \(track).")
    }

    // TASK - 2
    func spinDrumsticks(){
        print("Я кручу в барабанные палочки")
    }
    func breakDrum(){
        print("АААА! Я барабанщик работаю три дня!!! ААА! Без зарплаты! ААА! Я порвал барабан!")
        breakDrumCounter += 1
    }
    var favoriteDrumsName: String = ""
    var breakDrumCounter: Int = 0

}

final class Vocalist: Artist{
    init(_ name: String, _ hasLanguorousVoice: Bool) {
        self.hasLanguorousVoice = hasLanguorousVoice
        super.init(name)
    }
    override convenience init(_ name: String) {
        self.init(name, true)
    }
    override func writeTrack(_ track: String) {
        print("Я \(name) написал слова песни для трека \(track).")
        fangirlsCounter += 100
    }
    override func playTrack(_ track: String){
        print("Я \(name) исполнил слова песни для трека \(track).")
        fangirlsCounter += 10
    }
    // TASK - 2
    func admireYourself(){
        print("Да, я прекрасен!")
    }
    func jumpIntoCrowd(){
        print("Вокалист: *Прыгает в толпу*")
        print("Люди в метро: *Moai Emoji*")
    }
    var fangirlsCounter: Int = 100
    var hasLanguorousVoice: Bool
}


final class Bassist: Artist{


    override func writeTrack(_ track: String) {
        print("Я \(name) написал партию бас-гитары для трека \(track).")
    }
    override func playTrack(_ track: String){
        print("Я \(name) исполнил партию бас-гитары для трека \(track).")
    }
    // TASK - 2
    func smashGuitarOnStage(){
        print("Концерт закончен!")
    }
    let hasGirlfriend: Bool = false
    let guitarStringsCounter: Int = 2

}
// TASK - 3
var greenDayBand: [Artist] = [Vocalist("Billie Joe Armstrong"),
                         Bassist("Mike Dirnt"),
                         Drummer("Tre Cool")
                        ]

