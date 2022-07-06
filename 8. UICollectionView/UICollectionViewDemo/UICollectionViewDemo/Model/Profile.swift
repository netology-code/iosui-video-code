import Foundation

struct Profile {
    let name: String
    let location: String
    let imageName: String
    let profession: String
}

extension Profile {
    
    static func make() -> [Profile] {
        [
            Profile(
                name: "Аристарх Белопольский",
                location: "Москва",
                imageName: "astronomy",
                profession: "Астрономия"
            ),
            Profile(
                name: "Джеймс Харден",
                location: "Хьюстон",
                imageName: "basketball",
                profession: "Баскетбол"
            ),
            Profile(
                name: "Александр Бутлеров",
                location: "Казань",
                imageName: "chemistry",
                profession: "Химия"
            ),
            Profile(
                name: "Петр Семёнов",
                location: "Рязань",
                imageName: "geography",
                profession: "География"
            ),
            Profile(
                name: "Бернхард Риман",
                location: "Германия",
                imageName: "geometry",
                profession: "Геометрия"
            ),
            Profile(
                name: "Сергей Соловьёв",
                location: "Москва",
                imageName: "history",
                profession: "История"
            ),
            Profile(
                name: "Стюарт Хамерофф",
                location: "Тусон, США",
                imageName: "microscope",
                profession: "Нейробиолог"
            ),
            Profile(
                name: "Алиса Фрейндлих",
                location: "Санкт-Петербург",
                imageName: "theater",
                profession: "Актриса театра"
            ),
            Profile(
                name: "Роджер Федерер",
                location: "Швейцария",
                imageName: "trophy",
                profession: "Теннис"
            ),
            Profile(
                name: "Илон Маск",
                location: "Техас",
                imageName: "graduate",
                profession: "Предприниматель"
            ),
        ]
    }
}
