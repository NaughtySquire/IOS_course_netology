// TASK - 1
struct Track: Hashable{
    static func == (lhs: Track, rhs: Track) -> Bool {
        return lhs.name == rhs.name && lhs.artist == rhs.artist
    }

    var name: String = ""
    var artist: String
    var duration: Int
    init(name: String, artist: String, duration: Int) {
        self.name = name
        self.artist = artist
        self.duration = duration
    }
    func showInfo() -> Void{
        print("Название: \(name).")
        print("Исполнитель: \(artist).")
        print("Длительность: \(duration / 60):\(duration % 60 / 10)\(duration % 60 % 10).")
        print()
    }
}

class Category{
    var name: String
    var tracks: Set<Track> = Set()
    var trackCount: Int {tracks.count}
    init(name: String, tracks: Track?...) {
        self.name = name
        tracks.forEach({addTrack(track: $0)})
    }
    func addTrack(track: Track?) -> Void{
        if let data = track {tracks.insert(data)}
    }
    func removeTrack(track: Track?) -> Void{
        if let data = track {tracks.remove(data)}
    }
    func getTrack(trackName: String, artist: String) -> Optional<Track>{
        tracks.first(where: {$0.name == trackName && $0.artist == artist})
    }
    func getArtistTracks(artist: String) -> Set<Track>{
        var artistTracks: Set<Track> = Set()
        tracks.forEach({if $0.artist == artist {artistTracks.insert($0)}})
        return artistTracks
    }
    func showAllTracksInfo() -> Void{
        tracks.forEach({
            print("Категория: \(name).")
            $0.showInfo()
        })
    }
}
// TASK - 2
class Library{
    var categories: [Category] = []

    init(categories: Category...){
        self.categories += categories
    }
    func addCategory(category: Category) -> Void{
        categories.append(category)
    }

    func removeCategory(categoryName: String) -> Void{
        if let categoryIndex = categories.firstIndex(where: {$0.name == categoryName}){
            categories.remove(at: categoryIndex)
        }else{
            print("Ктегории \(categoryName) не найдено.")
        }
    }
    func getCategory(categoryName: String) -> Optional<Category>{
        categories.first(where: {$0.name == categoryName})
    }
    // TASK - 3
    func unionCategoriesByArtist(categoryFromName: String, categoryToName: String, artist: String) -> Void{
        if let categoryFrom = getCategory(categoryName: categoryFromName){
            if let categoryTo = getCategory(categoryName: categoryToName){
                categoryTo.tracks = categoryTo.tracks.union(categoryFrom.getArtistTracks(artist: artist))
            }else{
                print("В библиотеке нет категории: \(categoryToName).")
            }
        }else{
            print("В библиотеке нет категории: \(categoryFromName).")
        }
    }
}
// TASK - 1
var rockNRoll: Category = Category(name: "Rock 'n' Roll", tracks:
                                    Track(name: "Paint it Black", artist: "The Rooling stones", duration: 224),
                                    Track(name: "Everyday", artist: "Buddy Holly", duration: 270),
                                    Track(name: "Yellow Submarine", artist: "The Beatles", duration: 160)
                                   )

var britishRock: Category = Category(name: "British Rock", tracks:
                                    Track(name: "Paint it Black", artist: "The Rooling stones", duration: 224),
                                    Track(name: "Living in A Ghost Town", artist: "The Rooling stones", duration: 247),
                                    Track(name: "Gimme Shelter", artist: "The Rooling stones", duration: 270),
                                    Track(name: "For Your Love", artist: "The Yardbirds", duration: 150),
                                    Track(name: "Stairway to Heaven", artist: "Led Zeppelin", duration: 482),
                                    Track(name: "When the Levee Breaks", artist: "Led Zeppelin", duration: 328)
                                   )

// TASK - 2
var lib: Library = Library(categories: rockNRoll, britishRock)
lib.getCategory(categoryName: "Rock 'n' Roll")?.showAllTracksInfo()
print("----------------------------------------")
print()
// TASK - 3
lib.unionCategoriesByArtist(categoryFromName: "British Rock",
                            categoryToName: "Rock 'n' Roll",
                            artist: "The Rooling stones"
)
lib.getCategory(categoryName: "Rock 'n' Roll")?.showAllTracksInfo()

