import Foundation

enum GameElement: String {
    case rock = "Taş"
    case paper = "Kağıt"
    case scissors = "Makas"
}

enum GameResult: String {
    case win = "Kazandınız!"
    case lose = "Kaybettiniz!"
    case tie = "Berabere!"
}

func playGame(userElement: GameElement, computerElement: GameElement) -> GameResult {
    if userElement == computerElement {
        return .tie
    } else if (userElement == .rock && computerElement == .scissors) ||
              (userElement == .paper && computerElement == .rock) ||
              (userElement == .scissors && computerElement == .paper) {
        return .win
    } else {
        return .lose
    }
}

func getUserChoice() -> GameElement? {
    print("Taş (T), Kağıt (K) veya Makas (M) seçin: ", terminator: "")
    if let userInput = readLine()?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) {
        switch userInput {
        case "t":
            return .rock
        case "k":
            return .paper
        case "m":
            return .scissors
        default:
            print("Geçersiz giriş!")
        }
    }
    return nil
}

func getComputerChoice() -> GameElement {
    let allElements: [GameElement] = [.rock, .paper, .scissors]
    let randomIndex = Int.random(in: 0..<allElements.count)
    return allElements[randomIndex]
}

func printGameResult(userElement: GameElement, computerElement: GameElement, result: GameResult) {
    print("Kullanıcının seçimi: \(userElement.rawValue)")
    print("Bilgisayarın seçimi: \(computerElement.rawValue)")
    print(result.rawValue)
}

var playAgain = true

while playAgain {
    if let userChoice = getUserChoice() {
        let computerChoice = getComputerChoice()
        let result = playGame(userElement: userChoice, computerElement: computerChoice)
        printGameResult(userElement: userChoice, computerElement: computerChoice, result: result)
        
        print("Tekrar oynamak istiyor musunuz? (Evet/Hayır): ", terminator: "")
        if let playAgainInput = readLine()?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) {
            if playAgainInput == "hayır" || playAgainInput == "h" {
                playAgain = false
            }
        }
    }
}
