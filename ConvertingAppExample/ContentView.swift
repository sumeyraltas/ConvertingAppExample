import SwiftUI

enum ConversionType: String, CaseIterable {
    case celsiusToFahrenheit = "Celsius to Fahrenheit"
    case fahrenheitToCelsius = "Fahrenheit to Celsius"
    case cmTomm = "Centimeters to Millimeters"
    case mmTocm = "Millimeters to Centimeters"
    case mmTokm = "Millimeters to Kilometers"
    case kmTomm = "Kilometers to Millimeters"
    case inchesToCentimeters = "Inches to Centimeters"
    case centimetersToInches = "Centimeters to Inches"
    
}

struct ContentView: View {
    @State private var input = ""
    @State private var output = ""
    @State private var selectedConversionType = ConversionType.celsiusToFahrenheit

    var body: some View {
        
        Form {
            Section(header: Text("Conversion APP").font(.system(size: 25, weight: .bold, design: .rounded))) {
                List{
                    Picker("Select the Conversion Type", selection: $selectedConversionType) {
                        ForEach(ConversionType.allCases, id: \.self) { type in
                            Text(type.rawValue)
                        }
                    }}
                TextField("Enter your value", text: $input)
                    .keyboardType(.decimalPad)
                Button("Convert") {
                    convertValues()
                }
                
                Text("Result: \(output)")
            }
        }
    }

    func convertValues() {
        guard let input = Double(input) else {
            output = "Invalid input"
            return
        }

        switch selectedConversionType {
        case .celsiusToFahrenheit:
            output = "\(input * 9/5 + 32) °F"
        case .fahrenheitToCelsius:
            output = "\((input - 32) * 5/9) °C"
        case .cmTomm:
            output = "\((input) * 10) mm"
        case .mmTocm:
            output = "\((input) / 10) cm"
        case .kmTomm:
            output = "\((input) * 1000) mm"
        case .mmTokm:
            output = "\((input) / 1000) km"
        case .inchesToCentimeters:
            output = "\((input) * 2.54) cm"
        case .centimetersToInches:
            output = "\((input) / 2.54) inch"
        }
    }
}

#Preview {
    ContentView()
}
       

