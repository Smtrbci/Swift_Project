import UIKit

// 1. Değişkenler ve Sabitler (Variables & Constants)

// var : değiştirebilir (mutable) değişken tanımlamak için kullanılır
// let : değiştirilemez (immutable) sabitler için kullanır.

var age = 23 // değiştirebilir

age = 25

let  name = "Dave" // değiştirilemez sabit

//name = "Anahi"


var temperature: Double = 32.4

let city : String = "Istanbul"

// 2. Veri Tipleri (Data Types)

// Int → Tam sayılar
// Double, Float → Ondalık sayılar
// String → Metin verisi
// Bool → Mantıksal (true/false)

let isOnline: Bool = true // değeri sabit tutamasını sağlarsın asla değiştiremezsin
var isOnline2: Bool = false // değeri değiştirebilir veya değişebilir

var  score: Int = 32

var pi: Double = 3.14

let greeting: String = "Merhaba, Dave"

// 3. Koşul Yapıları (Conditional Statements)

// if-else ve switch yapıları, belirli koşullara göre kodu çalıştırmak için kullanılır.

let myAge = 26

if myAge == 23{
    print("Reşitsiniz.")
}else{
    print("Henüz reşit değilsiniz.")
}

//------
 
let grade = "D"

switch grade {
case "A":
    print("Harika! Başarıyla geçtiniz")
case "B":
    print("Başarıyla geçtiniz")
case "C":
    print("İyi iş!")
case "D":
    print("Geçtiniz, ama biraz daha çalışmalısın")
default:
    print("Daha Çok Çalışmalısınız.")
}


//4. Döngüler (Loops)


//for, while, ve repeat-while döngüleri tekrar eden işlemler için kullanılır.


for i in 1...5{
    print("Sayı: \(i)")
}

var counter = 3
while counter > 0{
    print("Geri Sayım: \(counter)")
    counter -= 1
}

// tekrar incele

// 5. Fonksiyonlar (Functions)

// fonksiyonlar, kodunuzu modüler ve tekrar kullanılabilir hale getirir.

func greet(name: String) -> String{
    return "Merhabai \(name)"
}

let message = greet(name: "Dave")
print(message)


// 6. Opsiyoneller (Optionals)

var  username : String?
username = "daveMax"

if let unwrappedUsername = username {
    print("Kullanıcı adı: \(unwrappedUsername)")
}else{
    print("Kullanıcı adı Bulunamadı.")
}

//7. Diziler ve Sözlükler (Arrays & Dictionaries)

//Dizi (Array): Birden fazla öğeyi sıralı şekilde saklar.
//Sözlük (Dictionary): Anahtar-değer çiftleri şeklinde veri saklar.


var fruits = ["Elma","Armut","Muz"]
fruits.append("Portakal")
print(fruits)

var capitals = ["Türkiye": "Ankara", "Fransa": "Paris"]
capitals ["İngiltere"] = "Londra"

print(capitals["Türkiye"] ?? "Bulunamadı")

//8. Sınıflar ve Yapılar (Classes & Structs)

//Object-Oriented Programming (OOP) destekler. Sınıflar ve yapılar, veri ve davranışları bir arada tutar.

class Person{
    var name: String
    var age: Int
    
    init (name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    func introduce(){
        print("Merhaba, ben \(name) ve \(age) yaşındayım")
    }
}

let person1 = Person(name: "Dave", age: 24)
person1.introduce() //"Merhaba, Ben Dave ve 24 Yaşındayım"


// 9. Kapatıcılar (Closures)

//Closure'lar, bir fonksiyona benzer yapıda, fakat isimsiz kod bloklarıdır.

let sayMerhaba = { (name: String) -> String in
    return "Merhaba, \(name)!"
}

    print(sayMerhaba("Dave"))

// 10. Hata Yönetimi (Error Handling)

// hata durumlarını güvenli şekilde yönetmek için do-catch yapısını kullanır.

enum NetworkError: Error{
    case offline
    case serverError
}

func fetchData() throws{
    throw NetworkError.offline
}

do {
    try fetchData()
} catch NetworkError.offline{
        print("internet bağlantısı yok.")
    } catch {
        print("Bilinmeyen bir hata oluştu")
    }
