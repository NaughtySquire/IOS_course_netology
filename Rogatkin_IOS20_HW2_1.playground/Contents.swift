import Darwin
class TV{
    private(set) var name: String
    private(set) var isOn: Bool
    private var currentChannel: String
    init(manufacturer: String, model: String){
        name = manufacturer + " " + model
        isOn = false
        currentChannel = ""
    }

    func whatsOnTVNow() -> Void{
        if isOn{
            if !currentChannel.isEmpty{
                print("Сейчас по телеку: \(currentChannel).")
            }else{
                print("Вы не выбрали канал.")
            }
        }else{
            print("Телек выключен.")
        }
        print()
    }
    func switchState()  -> Void{
        isOn = !isOn
    }
    func chooseChannel(channelName: String){
        if isOn{
            currentChannel = channelName
        }else {
            print("Сначала включите телек.")
        }
    }
    func showAllInfo() -> Void{
        whatsOnTVNow()
    }
}

var oldTV: TV = TV(manufacturer: "Юность", model: "406-Д")
oldTV.whatsOnTVNow()
oldTV.chooseChannel(channelName: "Культура")
oldTV.switchState()
oldTV.chooseChannel(channelName: "Культура")
oldTV.whatsOnTVNow()




class AudioTV: TV{
    struct Settings{
        var volume: Double
        var isColorOn: Bool
    }

    var settings: Settings = Settings(volume: 0.5, isColorOn: true)

    func switchDisplay() -> Void {
        settings.isColorOn = !settings.isColorOn
    }
    func setVolume(volume: Double) -> Void {
        let tVolume = 1 + volume - trunc(volume)
        self.settings.volume = round((tVolume - trunc(tVolume)) * 10) / 10
    }
    func showSettings() -> Void {
        if isOn{
            print("Громкость звука: \(settings.volume).")
            print("Режим отображения: \(settings.isColorOn ? "цветной" : "черно-белый").")
        }
    }
    override func showAllInfo() -> Void{
        showSettings()
        super.showAllInfo()
    }
}

var newTW: AudioTV = AudioTV(manufacturer: "Юность", model: "Ц-440")
newTW.switchState()
newTW.chooseChannel(channelName: "Первая программа ЦТ")
newTW.showAllInfo()


class VideoTV: AudioTV{
    enum ConnectionType: String{
        case tvChannel = "телеантенна"
        case videoPort = "видеомагнитофон"
    }
    var connectionType = ConnectionType.tvChannel

    func switchConnectionType() -> Void {
        switch connectionType{
        case .tvChannel:
            connectionType = .videoPort
        case .videoPort:
            connectionType = .tvChannel
        }
    }

    func showConnectionType() -> Void {
        if isOn{
            print("Тип подключения: \(connectionType.rawValue).")
        }
    }
    override func showAllInfo() {
        showConnectionType()
        if connectionType == .tvChannel{
            super.showAllInfo()
        }else{
            showSettings()
            print()
        }
    }
}

var newEraTV: VideoTV = VideoTV(manufacturer: "LG", model: "CF-20F30K")
newEraTV.switchState()
newEraTV.setVolume(volume: -99.4)
newEraTV.showAllInfo()
newEraTV.switchConnectionType()
newEraTV.showAllInfo()

