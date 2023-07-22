//
//  ViewController.swift
//  NumbersExercise
//
//  Created by Barkın Süngü on 19.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var levelSelectPopUpButton: UIButton!
    
    let numbersByDigit = [
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
        "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
        "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
        "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",
        "41", "42", "43", "44", "45", "46", "47", "48", "49", "50",
        "51", "52", "53", "54", "55", "56", "57", "58", "59", "60",
        "61", "62", "63", "64", "65", "66", "67", "68", "69", "70",
        "71", "72", "73", "74", "75", "76", "77", "78", "79", "80",
        "81", "82", "83", "84", "85", "86", "87", "88", "89", "90",
        "91", "92", "93", "94", "95", "96", "97", "98", "99", "100",
        "101", "102", "103", "104", "105", "106", "107", "108", "109", "110",
        "111", "112", "113", "114", "115", "116", "117", "118", "119", "120",
        "121", "122", "123", "124", "125", "126", "127", "128", "129", "130",
        "131", "132", "133", "134", "135", "136", "137", "138", "139", "140",
        "141", "142", "143", "144", "145", "146", "147", "148", "149", "150",
        "151", "152", "153", "154", "155", "156", "157", "158", "159", "160",
        "161", "162", "163", "164", "165", "166", "167", "168", "169", "170",
        "171", "172", "173", "174", "175", "176", "177", "178", "179", "180",
        "181", "182", "183", "184", "185", "186", "187", "188", "189", "190",
        "191", "192", "193", "194", "195", "196", "197", "198", "199", "200",
        "201", "202", "203", "204", "205", "206", "207", "208", "209", "210",
        "211", "212", "213", "214", "215", "216", "217", "218", "219", "220",
        "221", "222", "223", "224", "225", "226", "227", "228", "229", "230",
        "231", "232", "233", "234", "235", "236", "237", "238", "239", "240",
        "241", "242", "243", "244", "245", "246", "247", "248", "249", "250",
        "251", "252", "253", "254", "255", "256", "257", "258", "259", "260",
        "261", "262", "263", "264", "265", "266", "267", "268", "269", "270",
        "271", "272", "273", "274", "275", "276", "277", "278", "279", "280",
        "281", "282", "283", "284", "285", "286", "287", "288", "289", "290",
        "291", "292", "293", "294", "295", "296", "297", "298", "299", "300",
        "301", "302", "303", "304", "305", "306", "307", "308", "309", "310",
        "311", "312", "313", "314", "315", "316", "317", "318", "319", "320",
        "321", "322", "323", "324", "325", "326", "327", "328", "329", "330",
        "331", "332", "333", "334", "335", "336", "337", "338", "339", "340",
        "341", "342", "343", "344", "345", "346", "347", "348", "349", "350",
        "351", "352", "353", "354", "355", "356", "357", "358", "359", "360",
        "361", "362", "363", "364", "365", "366", "367", "368", "369", "370",
        "371", "372", "373", "374", "375", "376", "377", "378", "379", "380",
        "381", "382", "383", "384", "385", "386", "387", "388", "389", "390",
        "391", "392", "393", "394", "395", "396", "397", "398", "399", "400",
        "401", "402", "403", "404", "405", "406", "407", "408", "409", "410",
        "411", "412", "413", "414", "415", "416", "417", "418", "419", "420",
        "421", "422", "423", "424", "425", "426", "427", "428", "429", "430",
        "431", "432", "433", "434", "435", "436", "437", "438", "439", "440",
        "441", "442", "443", "444", "445", "446", "447", "448", "449", "450",
        "451", "452", "453", "454", "455", "456", "457", "458", "459", "460",
        "461", "462", "463", "464", "465", "466", "467", "468", "469", "470",
        "471", "472", "473", "474", "475", "476", "477", "478", "479", "480",
        "481", "482", "483", "484", "485", "486", "487", "488", "489", "490",
        "491", "492", "493", "494", "495", "496", "497", "498", "499", "500",
        "501", "502", "503", "504", "505", "506", "507", "508", "509", "510",
        "511", "512", "513", "514", "515", "516", "517", "518", "519", "520",
        "521", "522", "523", "524", "525", "526", "527", "528", "529", "530",
        "531", "532", "533", "534", "535", "536", "537", "538", "539", "540",
        "541", "542", "543", "544", "545", "546", "547", "548", "549", "550",
        "551", "552", "553", "554", "555", "556", "557", "558", "559", "560",
        "561", "562", "563", "564", "565", "566", "567", "568", "569", "570",
        "571", "572", "573", "574", "575", "576", "577", "578", "579", "580",
        "581", "582", "583", "584", "585", "586", "587", "588", "589", "590",
        "591", "592", "593", "594", "595", "596", "597", "598", "599", "600",
        "601", "602", "603", "604", "605", "606", "607", "608", "609", "610",
        "611", "612", "613", "614", "615", "616", "617", "618", "619", "620",
        "621", "622", "623", "624", "625", "626", "627", "628", "629", "630",
        "631", "632", "633", "634", "635", "636", "637", "638", "639", "640",
        "641", "642", "643", "644", "645", "646", "647", "648", "649", "650",
        "651", "652", "653", "654", "655", "656", "657", "658", "659", "660",
        "661", "662", "663", "664", "665", "666", "667", "668", "669", "670",
        "671", "672", "673", "674", "675", "676", "677", "678", "679", "680",
        "681", "682", "683", "684", "685", "686", "687", "688", "689", "690",
        "691", "692", "693", "694", "695", "696", "697", "698", "699", "700",
        "701", "702", "703", "704", "705", "706", "707", "708", "709", "710",
        "711", "712", "713", "714", "715", "716", "717", "718", "719", "720",
        "721", "722", "723", "724", "725", "726", "727", "728", "729", "730",
        "731", "732", "733", "734", "735", "736", "737", "738", "739", "740",
        "741", "742", "743", "744", "745", "746", "747", "748", "749", "750",
        "751", "752", "753", "754", "755", "756", "757", "758", "759", "760",
        "761", "762", "763", "764", "765", "766", "767", "768", "769", "770",
        "771", "772", "773", "774", "775", "776", "777", "778", "779", "780",
        "781", "782", "783", "784", "785", "786", "787", "788", "789", "790",
        "791", "792", "793", "794", "795", "796", "797", "798", "799", "800",
        "801", "802", "803", "804", "805", "806", "807", "808", "809", "810",
        "811", "812", "813", "814", "815", "816", "817", "818", "819", "820",
        "821", "822", "823", "824", "825", "826", "827", "828", "829", "830",
        "831", "832", "833", "834", "835", "836", "837", "838", "839", "840",
        "841", "842", "843", "844", "845", "846", "847", "848", "849", "850",
        "851", "852", "853", "854", "855", "856", "857", "858", "859", "860",
        "861", "862", "863", "864", "865", "866", "867", "868", "869", "870",
        "871", "872", "873", "874", "875", "876", "877", "878", "879", "880",
        "881", "882", "883", "884", "885", "886", "887", "888", "889", "890",
        "891", "892", "893", "894", "895", "896", "897", "898", "899", "900",
        "901", "902", "903", "904", "905", "906", "907", "908", "909", "910",
        "911", "912", "913", "914", "915", "916", "917", "918", "919", "920",
        "921", "922", "923", "924", "925", "926", "927", "928", "929", "930",
        "931", "932", "933", "934", "935", "936", "937", "938", "939", "940",
        "941", "942", "943", "944", "945", "946", "947", "948", "949", "950",
        "951", "952", "953", "954", "955", "956", "957", "958", "959", "960",
        "961", "962", "963", "964", "965", "966", "967", "968", "969", "970",
        "971", "972", "973", "974", "975", "976", "977", "978", "979", "980",
        "981", "982", "983", "984", "985", "986", "987", "988", "989", "990",
        "991", "992", "993", "994", "995", "996", "997", "998", "999", "1000"]
    let numbersInWriting = [
        "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
        "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty",
        "twenty one", "twenty two", "twenty three", "twenty four", "twenty five", "twenty six", "twenty seven", "twenty eight", "twenty nine", "thirty",
        "thirty one", "thirty two", "thirty three", "thirty four", "thirty five", "thirty six", "thirty seven", "thirty eight", "thirty nine", "forty",
        "forty one", "forty two", "forty three", "forty four", "forty five", "forty six", "forty seven", "forty eight", "forty nine", "fifty",
        "fifty one", "fifty two", "fifty three", "fifty four", "fifty five", "fifty six", "fifty seven", "fifty eight", "fifty nine", "sixty",
        "sixty one", "sixty two", "sixty three", "sixty four", "sixty five", "sixty six", "sixty seven", "sixty eight", "sixty nine", "seventy",
        "seventy one", "seventy two", "seventy three", "seventy four", "seventy five", "seventy six", "seventy seven", "seventy eight", "seventy nine", "eighty",
        "eighty one", "eighty two", "eighty three", "eighty four", "eighty five", "eighty six", "eighty seven", "eighty eight", "eighty nine", "ninety",
        "ninety one", "ninety two", "ninety three", "ninety four", "ninety five", "ninety six", "ninety seven", "ninety eight", "ninety nine", "one hundred",
        "one hundred one", "one hundred two", "one hundred three", "one hundred four", "one hundred five", "one hundred six", "one hundred seven", "one hundred eight", "one hundred nine", "one hundred ten",
        "one hundred eleven", "one hundred twelve", "one hundred thirteen", "one hundred fourteen", "one hundred fifteen", "one hundred sixteen", "one hundred seventeen", "one hundred eighteen", "one hundred nineteen", "one hundred twenty",
        "one hundred twenty one", "one hundred twenty two", "one hundred twenty three", "one hundred twenty four", "one hundred twenty five", "one hundred twenty six", "one hundred twenty seven", "one hundred twenty eight", "one hundred twenty nine", "one hundred thirty",
        "one hundred thirty one", "one hundred thirty two", "one hundred thirty three", "one hundred thirty four", "one hundred thirty five", "one hundred thirty six", "one hundred thirty seven", "one hundred thirty eight", "one hundred thirty nine", "one hundred forty",
        "one hundred forty one", "one hundred forty two", "one hundred forty three", "one hundred forty four", "one hundred forty five", "one hundred forty six", "one hundred forty seven", "one hundred forty eight", "one hundred forty nine", "one hundred fifty",
        "one hundred fifty one", "one hundred fifty two", "one hundred fifty three", "one hundred fifty four", "one hundred fifty five", "one hundred fifty six", "one hundred fifty seven", "one hundred fifty eight", "one hundred fifty nine", "one hundred sixty",
        "one hundred sixty one", "one hundred sixty two", "one hundred sixty three", "one hundred sixty four", "one hundred sixty five", "one hundred sixty six", "one hundred sixty seven", "one hundred sixty eight", "one hundred sixty nine", "one hundred seventy",
        "one hundred seventy one", "one hundred seventy two", "one hundred seventy three", "one hundred seventy four", "one hundred seventy five", "one hundred seventy six", "one hundred seventy seven", "one hundred seventy eight", "one hundred seventy nine", "one hundred eighty",
        "one hundred eighty one", "one hundred eighty two", "one hundred eighty three", "one hundred eighty four", "one hundred eighty five", "one hundred eighty six", "one hundred eighty seven", "one hundred eighty eight", "one hundred eighty nine", "one hundred ninety",
        "one hundred ninety one", "one hundred ninety two", "one hundred ninety three", "one hundred ninety four", "one hundred ninety five", "one hundred ninety six", "one hundred ninety seven", "one hundred ninety eight", "one hundred ninety nine", "two hundred",
        "two hundred one", "two hundred two", "two hundred three", "two hundred four", "two hundred five", "two hundred six", "two hundred seven", "two hundred eight", "two hundred nine", "two hundred ten",
        "two hundred eleven", "two hundred twelve", "two hundred thirteen", "two hundred fourteen", "two hundred fifteen", "two hundred sixteen", "two hundred seventeen", "two hundred eighteen", "two hundred nineteen", "two hundred twenty",
        "two hundred twenty one", "two hundred twenty two", "two hundred twenty three", "two hundred twenty four", "two hundred twenty five", "two hundred twenty six", "two hundred twenty seven", "two hundred twenty eight", "two hundred twenty nine", "two hundred thirty",
        "two hundred thirty one", "two hundred thirty two", "two hundred thirty three", "two hundred thirty four", "two hundred thirty five", "two hundred thirty six", "two hundred thirty seven", "two hundred thirty eight", "two hundred thirty nine", "two hundred forty",
        "two hundred forty one", "two hundred forty two", "two hundred forty three", "two hundred forty four", "two hundred forty five", "two hundred forty six", "two hundred forty seven", "two hundred forty eight", "two hundred forty nine", "two hundred fifty",
        "two hundred fifty one", "two hundred fifty two", "two hundred fifty three", "two hundred fifty four", "two hundred fifty five", "two hundred fifty six", "two hundred fifty seven", "two hundred fifty eight", "two hundred fifty nine", "two hundred sixty",
        "two hundred sixty one", "two hundred sixty two", "two hundred sixty three", "two hundred sixty four", "two hundred sixty five", "two hundred sixty six", "two hundred sixty seven", "two hundred sixty eight", "two hundred sixty nine", "two hundred seventy",
        "two hundred seventy one", "two hundred seventy two", "two hundred seventy three", "two hundred seventy four", "two hundred seventy five", "two hundred seventy six", "two hundred seventy seven", "two hundred seventy eight", "two hundred seventy nine", "two hundred eighty",
        "two hundred eighty one", "two hundred eighty two", "two hundred eighty three", "two hundred eighty four", "two hundred eighty five", "two hundred eighty six", "two hundred eighty seven", "two hundred eighty eight", "two hundred eighty nine", "two hundred ninety",
        "two hundred ninety one", "two hundred ninety two", "two hundred ninety three", "two hundred ninety four", "two hundred ninety five", "two hundred ninety six", "two hundred ninety seven", "two hundred ninety eight", "two hundred ninety nine", "three hundred",
        "three hundred one", "three hundred two", "three hundred three", "three hundred four", "three hundred five", "three hundred six", "three hundred seven", "three hundred eight", "three hundred nine", "three hundred ten",
        "three hundred eleven", "three hundred twelve", "three hundred thirteen", "three hundred fourteen", "three hundred fifteen", "three hundred sixteen", "three hundred seventeen", "three hundred eighteen", "three hundred nineteen", "three hundred twenty",
        "three hundred twenty one", "three hundred twenty two", "three hundred twenty three", "three hundred twenty four", "three hundred twenty five", "three hundred twenty six", "three hundred twenty seven", "three hundred twenty eight", "three hundred twenty nine", "three hundred thirty",
        "three hundred thirty one", "three hundred thirty two", "three hundred thirty three", "three hundred thirty four", "three hundred thirty five", "three hundred thirty six", "three hundred thirty seven", "three hundred thirty eight", "three hundred thirty nine", "three hundred forty",
        "three hundred forty one", "three hundred forty two", "three hundred forty three", "three hundred forty four", "three hundred forty five", "three hundred forty six", "three hundred forty seven", "three hundred forty eight", "three hundred forty nine", "three hundred fifty",
        "three hundred fifty one", "three hundred fifty two", "three hundred fifty three", "three hundred fifty four", "three hundred fifty five", "three hundred fifty six", "three hundred fifty seven", "three hundred fifty eight", "three hundred fifty nine", "three hundred sixty",
        "three hundred sixty one", "three hundred sixty two", "three hundred sixty three", "three hundred sixty four", "three hundred sixty five", "three hundred sixty six", "three hundred sixty seven", "three hundred sixty eight", "three hundred sixty nine", "three hundred seventy",
        "three hundred seventy one", "three hundred seventy two", "three hundred seventy three", "three hundred seventy four", "three hundred seventy five", "three hundred seventy six", "three hundred seventy seven", "three hundred seventy eight", "three hundred seventy nine", "three hundred eighty",
        "three hundred eighty one", "three hundred eighty two", "three hundred eighty three", "three hundred eighty four", "three hundred eighty five", "three hundred eighty six", "three hundred eighty seven", "three hundred eighty eight", "three hundred eighty nine", "three hundred ninety",
        "three hundred ninety one", "three hundred ninety two", "three hundred ninety three", "three hundred ninety four", "three hundred ninety five", "three hundred ninety six", "three hundred ninety seven", "three hundred ninety eight", "three hundred ninety nine", "four hundred",
        "four hundred one", "four hundred two", "four hundred three", "four hundred four", "four hundred five", "four hundred six", "four hundred seven", "four hundred eight", "four hundred nine", "four hundred ten",
        "four hundred eleven", "four hundred twelve", "four hundred thirteen", "four hundred fourteen", "four hundred fifteen", "four hundred sixteen", "four hundred seventeen", "four hundred eighteen", "four hundred nineteen", "four hundred twenty",
        "four hundred twenty one", "four hundred twenty two", "four hundred twenty three", "four hundred twenty four", "four hundred twenty five", "four hundred twenty six", "four hundred twenty seven", "four hundred twenty eight", "four hundred twenty nine", "four hundred thirty",
        "four hundred thirty one", "four hundred thirty two", "four hundred thirty three", "four hundred thirty four", "four hundred thirty five", "four hundred thirty six", "four hundred thirty seven", "four hundred thirty eight", "four hundred thirty nine", "four hundred forty",
        "four hundred forty one", "four hundred forty two", "four hundred forty three", "four hundred forty four", "four hundred forty five", "four hundred forty six", "four hundred forty seven", "four hundred forty eight", "four hundred forty nine", "four hundred fifty",
        "four hundred fifty one", "four hundred fifty two", "four hundred fifty three", "four hundred fifty four", "four hundred fifty five", "four hundred fifty six", "four hundred fifty seven", "four hundred fifty eight", "four hundred fifty nine", "four hundred sixty",
        "four hundred sixty one", "four hundred sixty two", "four hundred sixty three", "four hundred sixty four", "four hundred sixty five", "four hundred sixty six", "four hundred sixty seven", "four hundred sixty eight", "four hundred sixty nine", "four hundred seventy",
        "four hundred seventy one", "four hundred seventy two", "four hundred seventy three", "four hundred seventy four", "four hundred seventy five", "four hundred seventy six", "four hundred seventy seven", "four hundred seventy eight", "four hundred seventy nine", "four hundred eighty",
        "four hundred eighty one", "four hundred eighty two", "four hundred eighty three", "four hundred eighty four", "four hundred eighty five", "four hundred eighty six", "four hundred eighty seven", "four hundred eighty eight", "four hundred eighty nine", "four hundred ninety",
        "four hundred ninety one", "four hundred ninety two", "four hundred ninety three", "four hundred ninety four", "four hundred ninety five", "four hundred ninety six", "four hundred ninety seven", "four hundred ninety eight", "four hundred ninety nine", "five hundred",
        "five hundred one", "five hundred two", "five hundred three", "five hundred four", "five hundred five", "five hundred six", "five hundred seven", "five hundred eight", "five hundred nine", "five hundred ten",
        "five hundred eleven", "five hundred twelve", "five hundred thirteen", "five hundred fourteen", "five hundred fifteen", "five hundred sixteen", "five hundred seventeen", "five hundred eighteen", "five hundred nineteen", "five hundred twenty",
        "five hundred twenty one", "five hundred twenty two", "five hundred twenty three", "five hundred twenty four", "five hundred twenty five", "five hundred twenty six", "five hundred twenty seven", "five hundred twenty eight", "five hundred twenty nine", "five hundred thirty",
        "five hundred thirty one", "five hundred thirty two", "five hundred thirty three", "five hundred thirty four", "five hundred thirty five", "five hundred thirty six", "five hundred thirty seven", "five hundred thirty eight", "five hundred thirty nine", "five hundred forty",
        "five hundred forty one", "five hundred forty two", "five hundred forty three", "five hundred forty four", "five hundred forty five", "five hundred forty six", "five hundred forty seven", "five hundred forty eight", "five hundred forty nine", "five hundred fifty",
        "five hundred fifty one", "five hundred fifty two", "five hundred fifty three", "five hundred fifty four", "five hundred fifty five", "five hundred fifty six", "five hundred fifty seven", "five hundred fifty eight", "five hundred fifty nine", "five hundred sixty",
        "five hundred sixty one", "five hundred sixty two", "five hundred sixty three", "five hundred sixty four", "five hundred sixty five", "five hundred sixty six", "five hundred sixty seven", "five hundred sixty eight", "five hundred sixty nine", "five hundred seventy",
        "five hundred seventy one", "five hundred seventy two", "five hundred seventy three", "five hundred seventy four", "five hundred seventy five", "five hundred seventy six", "five hundred seventy seven", "five hundred seventy eight", "five hundred seventy nine", "five hundred eighty",
        "five hundred eighty one", "five hundred eighty two", "five hundred eighty three", "five hundred eighty four", "five hundred eighty five", "five hundred eighty six", "five hundred eighty seven", "five hundred eighty eight", "five hundred eighty nine", "five hundred ninety",
        "five hundred ninety one", "five hundred ninety two", "five hundred ninety three", "five hundred ninety four", "five hundred ninety five", "five hundred ninety six", "five hundred ninety seven", "five hundred ninety eight", "five hundred ninety nine", "six hundred",
        "six hundred one", "six hundred two", "six hundred three", "six hundred four", "six hundred five", "six hundred six", "six hundred seven", "six hundred eight", "six hundred nine", "six hundred ten",
        "six hundred eleven", "six hundred twelve", "six hundred thirteen", "six hundred fourteen", "six hundred fifteen", "six hundred sixteen", "six hundred seventeen", "six hundred eighteen", "six hundred nineteen", "six hundred twenty",
        "six hundred twenty one", "six hundred twenty two", "six hundred twenty three", "six hundred twenty four", "six hundred twenty five", "six hundred twenty six", "six hundred twenty seven", "six hundred twenty eight", "six hundred twenty nine", "six hundred thirty",
        "six hundred thirty one", "six hundred thirty two", "six hundred thirty three", "six hundred thirty four", "six hundred thirty five", "six hundred thirty six", "six hundred thirty seven", "six hundred thirty eight", "six hundred thirty nine", "six hundred forty",
        "six hundred forty one", "six hundred forty two", "six hundred forty three", "six hundred forty four", "six hundred forty five", "six hundred forty six", "six hundred forty seven", "six hundred forty eight", "six hundred forty nine", "six hundred fifty",
        "six hundred fifty one", "six hundred fifty two", "six hundred fifty three", "six hundred fifty four", "six hundred fifty five", "six hundred fifty six", "six hundred fifty seven", "six hundred fifty eight", "six hundred fifty nine", "six hundred sixty",
        "six hundred sixty one", "six hundred sixty two", "six hundred sixty three", "six hundred sixty four", "six hundred sixty five", "six hundred sixty six", "six hundred sixty seven", "six hundred sixty eight", "six hundred sixty nine", "six hundred seventy",
        "six hundred seventy one", "six hundred seventy two", "six hundred seventy three", "six hundred seventy four", "six hundred seventy five", "six hundred seventy six", "six hundred seventy seven", "six hundred seventy eight", "six hundred seventy nine", "six hundred eighty",
        "six hundred eighty one", "six hundred eighty two", "six hundred eighty three", "six hundred eighty four", "six hundred eighty five", "six hundred eighty six", "six hundred eighty seven", "six hundred eighty eight", "six hundred eighty nine", "six hundred ninety",
        "six hundred ninety one", "six hundred ninety two", "six hundred ninety three", "six hundred ninety four", "six hundred ninety five", "six hundred ninety six", "six hundred ninety seven", "six hundred ninety eight", "six hundred ninety nine", "seven hundred",
        "seven hundred one", "seven hundred two", "seven hundred three", "seven hundred four", "seven hundred five", "seven hundred six", "seven hundred seven", "seven hundred eight", "seven hundred nine", "seven hundred ten",
        "seven hundred eleven", "seven hundred twelve", "seven hundred thirteen", "seven hundred fourteen", "seven hundred fifteen", "seven hundred sixteen", "seven hundred seventeen", "seven hundred eighteen", "seven hundred nineteen", "seven hundred twenty",
        "seven hundred twenty one", "seven hundred twenty two", "seven hundred twenty three", "seven hundred twenty four", "seven hundred twenty five", "seven hundred twenty six", "seven hundred twenty seven", "seven hundred twenty eight", "seven hundred twenty nine", "seven hundred thirty",
        "seven hundred thirty one", "seven hundred thirty two", "seven hundred thirty three", "seven hundred thirty four", "seven hundred thirty five", "seven hundred thirty six", "seven hundred thirty seven", "seven hundred thirty eight", "seven hundred thirty nine", "seven hundred forty",
        "seven hundred forty one", "seven hundred forty two", "seven hundred forty three", "seven hundred forty four", "seven hundred forty five", "seven hundred forty six", "seven hundred forty seven", "seven hundred forty eight", "seven hundred forty nine", "seven hundred fifty",
        "seven hundred fifty one", "seven hundred fifty two", "seven hundred fifty three", "seven hundred fifty four", "seven hundred fifty five", "seven hundred fifty six", "seven hundred fifty seven", "seven hundred fifty eight", "seven hundred fifty nine", "seven hundred sixty",
        "seven hundred sixty one", "seven hundred sixty two", "seven hundred sixty three", "seven hundred sixty four", "seven hundred sixty five", "seven hundred sixty six", "seven hundred sixty seven", "seven hundred sixty eight", "seven hundred sixty nine", "seven hundred seventy",
        "seven hundred seventy one", "seven hundred seventy two", "seven hundred seventy three", "seven hundred seventy four", "seven hundred seventy five", "seven hundred seventy six", "seven hundred seventy seven", "seven hundred seventy eight", "seven hundred seventy nine", "seven hundred eighty",
        "seven hundred eighty one", "seven hundred eighty two", "seven hundred eighty three", "seven hundred eighty four", "seven hundred eighty five", "seven hundred eighty six", "seven hundred eighty seven", "seven hundred eighty eight", "seven hundred eighty nine", "seven hundred ninety",
        "seven hundred ninety one", "seven hundred ninety two", "seven hundred ninety three", "seven hundred ninety four", "seven hundred ninety five", "seven hundred ninety six", "seven hundred ninety seven", "seven hundred ninety eight", "seven hundred ninety nine", "eight hundred",
        "eight hundred one", "eight hundred two", "eight hundred three", "eight hundred four", "eight hundred five", "eight hundred six", "eight hundred seven", "eight hundred eight", "eight hundred nine", "eight hundred ten",
        "eight hundred eleven", "eight hundred twelve", "eight hundred thirteen", "eight hundred fourteen", "eight hundred fifteen", "eight hundred sixteen", "eight hundred seventeen", "eight hundred eighteen", "eight hundred nineteen", "eight hundred twenty",
        "eight hundred twenty one", "eight hundred twenty two", "eight hundred twenty three", "eight hundred twenty four", "eight hundred twenty five", "eight hundred twenty six", "eight hundred twenty seven", "eight hundred twenty eight", "eight hundred twenty nine", "eight hundred thirty",
        "eight hundred thirty one", "eight hundred thirty two", "eight hundred thirty three", "eight hundred thirty four", "eight hundred thirty five", "eight hundred thirty six", "eight hundred thirty seven", "eight hundred thirty eight", "eight hundred thirty nine", "eight hundred forty",
        "eight hundred forty one", "eight hundred forty two", "eight hundred forty three", "eight hundred forty four", "eight hundred forty five", "eight hundred forty six", "eight hundred forty seven", "eight hundred forty eight", "eight hundred forty nine", "eight hundred fifty",
        "eight hundred fifty one", "eight hundred fifty two", "eight hundred fifty three", "eight hundred fifty four", "eight hundred fifty five", "eight hundred fifty six", "eight hundred fifty seven", "eight hundred fifty eight", "eight hundred fifty nine", "eight hundred sixty",
        "eight hundred sixty one", "eight hundred sixty two", "eight hundred sixty three", "eight hundred sixty four", "eight hundred sixty five", "eight hundred sixty six", "eight hundred sixty seven", "eight hundred sixty eight", "eight hundred sixty nine", "eight hundred seventy",
        "eight hundred seventy one", "eight hundred seventy two", "eight hundred seventy three", "eight hundred seventy four", "eight hundred seventy five", "eight hundred seventy six", "eight hundred seventy seven", "eight hundred seventy eight", "eight hundred seventy nine", "eight hundred eighty",
        "eight hundred eighty one", "eight hundred eighty two", "eight hundred eighty three", "eight hundred eighty four", "eight hundred eighty five", "eight hundred eighty six", "eight hundred eighty seven", "eight hundred eighty eight", "eight hundred eighty nine", "eight hundred ninety",
        "eight hundred ninety one", "eight hundred ninety two", "eight hundred ninety three", "eight hundred ninety four", "eight hundred ninety five", "eight hundred ninety six", "eight hundred ninety seven", "eight hundred ninety eight", "eight hundred ninety nine", "nine hundred",
        "nine hundred one", "nine hundred two", "nine hundred three", "nine hundred four", "nine hundred five", "nine hundred six", "nine hundred seven", "nine hundred eight", "nine hundred nine", "nine hundred ten",
        "nine hundred eleven", "nine hundred twelve", "nine hundred thirteen", "nine hundred fourteen", "nine hundred fifteen", "nine hundred sixteen", "nine hundred seventeen", "nine hundred eighteen", "nine hundred nineteen", "nine hundred twenty",
        "nine hundred twenty one", "nine hundred twenty two", "nine hundred twenty three", "nine hundred twenty four", "nine hundred twenty five", "nine hundred twenty six", "nine hundred twenty seven", "nine hundred twenty eight", "nine hundred twenty nine", "nine hundred thirty",
        "nine hundred thirty one", "nine hundred thirty two", "nine hundred thirty three", "nine hundred thirty four", "nine hundred thirty five", "nine hundred thirty six", "nine hundred thirty seven", "nine hundred thirty eight", "nine hundred thirty nine", "nine hundred forty",
        "nine hundred forty one", "nine hundred forty two", "nine hundred forty three", "nine hundred forty four", "nine hundred forty five", "nine hundred forty six", "nine hundred forty seven", "nine hundred forty eight", "nine hundred forty nine", "nine hundred fifty",
        "nine hundred fifty one", "nine hundred fifty two", "nine hundred fifty three", "nine hundred fifty four", "nine hundred fifty five", "nine hundred fifty six", "nine hundred fifty seven", "nine hundred fifty eight", "nine hundred fifty nine", "nine hundred sixty",
        "nine hundred sixty one", "nine hundred sixty two", "nine hundred sixty three", "nine hundred sixty four", "nine hundred sixty five", "nine hundred sixty six", "nine hundred sixty seven", "nine hundred sixty eight", "nine hundred sixty nine", "nine hundred seventy",
        "nine hundred seventy one", "nine hundred seventy two", "nine hundred seventy three", "nine hundred seventy four", "nine hundred seventy five", "nine hundred seventy six", "nine hundred seventy seven", "nine hundred seventy eight", "nine hundred seventy nine", "nine hundred eighty",
        "nine hundred eighty one", "nine hundred eighty two", "nine hundred eighty three", "nine hundred eighty four", "nine hundred eighty five", "nine hundred eighty six", "nine hundred eighty seven", "nine hundred eighty eight", "nine hundred eighty nine", "nine hundred ninety",
        "nine hundred ninety one", "nine hundred ninety two", "nine hundred ninety three", "nine hundred ninety four", "nine hundred ninety five", "nine hundred ninety six", "nine hundred ninety seven", "nine hundred ninety eight", "nine hundred ninety nine", "one thousand"]
    var correctAnsver = ""
    var score = 0
    var switchNumber = 0
    var questionLevel = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLevelSelectPopUpButton()
        askQuestion()
    }
    
    func askQuestion(){
    //    var switchNumber = Int.random(in: 0..<3)
        var questionNumber = Int.random(in: 0..<questionLevel)
        var questionArray = [String]()
        var answerArray = [String]()
        
        if switchNumber == 1{
            questionArray = numbersByDigit
            answerArray = numbersInWriting
        }else{
            questionArray = numbersInWriting
            answerArray = numbersByDigit
        }
        
        scoreLabel.text = "Score: " + String(score)
        print("Score: " + String(score))
        answerTextField.text = ""
        questionLabel.text = questionArray[questionNumber]
        correctAnsver = answerArray[questionNumber]
        score = score+1
        
    }

    @IBAction func acceptButtonTapped(_ sender: Any) {
        if answerTextField.text == correctAnsver{
            trueAnswer()
        }else{
            wrongAnswer()
        }
    }
    
    @IBAction func DigitToTextSwitch(_ sender: UISwitch) {
        score = score - 1 //askQuestion score u artırır soru çözülmeden artmasını engelemek için
        if sender.isOn{
            switchNumber = 0
            askQuestion()
        }else{
            switchNumber = 1
            askQuestion()
        }
    }
    
    func setLevelSelectPopUpButton(){
        let optionClosure = {(action: UIAction) in print(action.title)
            self.score = self.score - 1 //askQuestion score u artırır soru çözülmeden artmasını engelemek için
            if action.title == "0 to 10"{
                self.questionLevel = 10
            }else if action.title == "0 to 100"{
                self.questionLevel = 100
            }else if action.title == "0 to 1000"{
                self.questionLevel = 1000
            }
            self.askQuestion()
        }
        
        levelSelectPopUpButton.menu = UIMenu(children:[
            UIAction(title: "0 to 10", state: .on, handler: optionClosure),
            UIAction(title: "0 to 100", state: .on, handler: optionClosure),
            UIAction(title: "0 to 1000", state: .on, handler: optionClosure),
            //UIAction(title: "0 to 10000", state: .on, handler: optionClosure)
        ])
        
        levelSelectPopUpButton.showsMenuAsPrimaryAction = true
        levelSelectPopUpButton.changesSelectionAsPrimaryAction = true
    }
    
    func trueAnswer(){
        self.view.backgroundColor = UIColor.green
        
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            self.view.backgroundColor = UIColor.systemBackground
        }
        askQuestion()
    }
    
    func wrongAnswer(){
        self.view.backgroundColor = UIColor.red
        
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            self.view.backgroundColor = UIColor.systemBackground
        }
    }
    

}

