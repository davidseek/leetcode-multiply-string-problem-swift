import Foundation

 func multiply(_ num1: String, _ num2: String) -> String {
	guard num1 != "0" && num2 != "0" else {
		return "0"
	}

	let num1Chars = Array(num1.reversed())
	let num2Chars = Array(num2.reversed())
	var res = Array(repeating: 0, count: num1Chars.count + num2Chars.count)
	var finalChars = [String]()
	var carry = 0
	var sum = 0

	for (i, char1) in num1Chars.enumerated() {
		let n1 = Int(String(char1))
		for (j, char2) in num2Chars.enumerated() {			
			res[i + j] += n1! * Int(String(char2))!
		}
	}
	
	print("res: \(res)")
	
	for num in res {
		
		print("num: \(num)")
		
		let carryPlusNum = (carry + num)
		print("num + carry:  \(carryPlusNum) % 10:  \(carryPlusNum % 10) / 10:   \(carryPlusNum / 10)")
		
		sum = carryPlusNum % 10
		carry = carryPlusNum / 10
		finalChars.insert(String(sum), at: 0)
		
		print("finalChars: \(finalChars) \n")
	}

	while !finalChars.isEmpty && finalChars.first! == "0" {
		finalChars.removeFirst()
	}

	return finalChars.reduce("") { $0 + $1 }
}

//"498828660196", "840477629533"
print(multiply("128", "345"))
