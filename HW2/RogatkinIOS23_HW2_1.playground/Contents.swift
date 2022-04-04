import Darwin


// TASK - 1
/* Роман Рогаткин
Мне 23 года. Заканиваю университет РТУ-МИРЭА по программе бакалавриата "Информационные системы и технологии". Параллельно с учебой работаю преподавателем детских курсов программирования. Люблю играть в Доту. :)
За время учебы и работы использовал языки программирования: С++, Java, Python, JS, PHP(совсем чутка), C#, Kotlin и my guilty pleasure - 1С(чучуть. Не бейте. XD ). Также немного разбираюсь в основах верстки с помощью HTML и CSS.
Думаю, что не владею какими-то особенными дополнительными инструментами.
4 года работаю преподавателем основ алгоритмизации и программирования для школьников. Также готовлю ребят к сдаче экзаменов ЕГЭ по информатике. Когда-то еще вел lego-робототехнику.
Неоконченное высшее. Университет РТУ-МИРЭА. Бакалавриат. Направление - 09.03.02 - Информационные системы и технологии. Специальность -  Предметно-ориентированные информационные системы.
 */

// TASK - 2
let name: String = "Роман"
let surname: String = "Рогаткин"
var age: Int = 23
let gender: String = "мужской"
let desiredCityToMove: String = "Не хочется куда-либо переезжать. В моём городе семья, родные, друзья. Я их не оставлю."
let macOSExperience = "Да"
var desiredSalary: String = "Ну примерно как у среднего айтишника - 9_999_999$/сек."
var vacationDaysCount: Int = 70
let favoriteColor: String = "Синий"

// TASK - 3*
var salaryOfMiddleIOSDeveloper: Double = 150_000
var salaryOfJuniorIOSDeveloper: Int = 80_000
var salaryOfMiddleAndroidDeveloper: Int = 140_000
salaryOfMiddleIOSDeveloper *= 1.2
salaryOfJuniorIOSDeveloper += 20_000
salaryOfMiddleAndroidDeveloper *= 1
print("Зарплата middle IOS-разработчика: ", Int(round(salaryOfMiddleIOSDeveloper)), ".", separator: "")
print("Зарплата junior IOS-разработчика: ", salaryOfJuniorIOSDeveloper, ".", separator: "")
print("Зарплата middle Android-разработчика: ", salaryOfMiddleAndroidDeveloper, ". :(", separator: "")
