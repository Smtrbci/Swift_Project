import UIKit

//Koleksiyon, Collections

//Arry
var ilkDizimiz = ["Samet","Şevval","Hülya","Ahmet","Osman"]

//index

ilkDizimiz[1].uppercased()


ilkDizimiz[2] = "Osman"
ilkDizimiz[2]

var ikinciDizimiz = [10,20,30,40]


ikinciDizimiz[1] * 5 / 10

var karisikDizimiz = [100,200,"Samet",true,false] as [Any]

//as -> casting , any -> any abject

var yeniDegisken = karisikDizimiz[2] as! String

karisikDizimiz.append("Zeynep")


//Set

var numaralar = [1,2,3,4,5,6,7]
var numaraSeti : Set = [1,1,1,1,2,2,2,3,3,3,6,6,]

