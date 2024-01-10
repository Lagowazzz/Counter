import UIKit

class ViewController: UIViewController {
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
    
    @IBOutlet weak private var deleteHistoryButton: UIButton!
    @IBOutlet weak var countChangeLabel: UILabel!
    @IBOutlet weak private var deleteButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var countValueLabel: UILabel!
    @IBOutlet weak private var historyTextView: UITextView!
    @IBOutlet weak private var changeButton: UIButton!
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.layer.borderWidth = 1.0
        historyTextView.layer.borderColor = UIColor.black.cgColor
    }
    
    private func newDate() -> String {
        let format = DateFormatter()
        format.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return format.string(from: Date())
    }
    
    private func scrollToBottom() {
        let range = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(range)
    }
    
    @IBAction private func deleteHistoryText(_ sender: Any) {
        feedbackGenerator.prepare()
        feedbackGenerator.impactOccurred()
        historyTextView.text = "История изменений:"
        scrollToBottom()
    }
    
    @IBAction private func deleteCountValue(_ sender: Any) {
        feedbackGenerator.prepare()
        feedbackGenerator.impactOccurred()
        if let newValue = Int(countValueLabel.text ?? "0"),
           newValue > 0 {
            countValueLabel.text = "0"
            historyTextView.text.append("\n\(newDate()): значение сброшено")
            scrollToBottom()
        }
    }
    
    @IBAction private func minusOne(_ sender: Any) {
        feedbackGenerator.prepare()
        feedbackGenerator.impactOccurred()
        if let newValue = Int(countValueLabel.text ?? "0"),
           newValue > 0 {
            countValueLabel.text = "\(newValue - 1)"
            historyTextView.text.append("\n\(newDate()): значение изменено на - 1")
            scrollToBottom()
        } else {
            feedbackGenerator.prepare()
            feedbackGenerator.impactOccurred()
            historyTextView.text.append("\n\(newDate()): попытка изменения значения счетчика ниже 0")
            scrollToBottom()
        }
    }
    
    @IBAction private func plusOne(_ sender: Any) {
        feedbackGenerator.prepare()
        feedbackGenerator.impactOccurred()
        if let newValue = UInt(countValueLabel.text ?? "0"){
            countValueLabel.text = "\(newValue + 1)"
            historyTextView.text.append("\n\(newDate()): значение изменено на + 1")
            scrollToBottom()
        }
    }
}
