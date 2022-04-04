let vkData = "19067"
let fbData = "13400"
let instData = "_10045"
let youTubeData = "10$0d00"
let webSiteData = "I0I12"

let optionalVkData: Int? = Int(vkData)
let optionalFbData: Int? = Int(fbData)
let optionalInstData: Int? = Int(instData)
let optionalYouTubeData: Int? = Int(youTubeData)
let optionalWebSiteData: Int? = Int(webSiteData)

// TASK - 1
// nil-coalesing
var checkSum: Int = 0
checkSum += optionalVkData ?? 0
checkSum += optionalFbData ?? 0
checkSum += optionalInstData ?? 0
checkSum += optionalYouTubeData ?? 0
checkSum += optionalWebSiteData ?? 0
print(checkSum)

// optional binding
checkSum = 0
if let vk = optionalVkData { checkSum += vk }
if let fb = optionalFbData {checkSum += fb}
if let inst = optionalInstData {checkSum += inst}
if let youTube = optionalYouTubeData {checkSum += youTube}
if let webSite = optionalWebSiteData {checkSum += webSite}
print(checkSum)

// forced unwrapping
checkSum = 0
if optionalVkData != nil { checkSum += optionalVkData!}
if optionalFbData != nil { checkSum += optionalFbData!}
if optionalInstData != nil { checkSum += optionalInstData!}
if optionalYouTubeData != nil { checkSum += optionalYouTubeData!}
if optionalWebSiteData != nil { checkSum += optionalWebSiteData!}
print(checkSum)

// TASK - 2
var isConfirm: Bool = true
if let payment = optionalVkData{
    if isConfirm{
        print("Ты подтвердил оплату на сумму \(payment)")
    }else{
        print("Платеж отменен")
    }
}else{
    print("Упс… Нам жаль, что-то пошло не так, попробуйте позже")
}

// TASK - 3
checkSum = 0
var data: [String] = [vkData, fbData, instData, youTubeData, webSiteData]
for el in data{
    if let siteStatistics = Int(el){
        checkSum += siteStatistics
    }
}
print(checkSum)
