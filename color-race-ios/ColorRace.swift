import SwiftUI

struct ColorRace: View {
    @State private var currentColor = CarColor.allCases.randomElement() ?? .white
    @State private var passingCarColor = CarColor.allCases.randomElement() ?? .white
    @State private var carOffset: CGFloat = -UIScreen.main.bounds.width // Start offscreen to the left
    @State private var score = 0
    @Environment(\.verticalSizeClass) var verticalSizeClass

    // Audio player
    private var audioPlayer = AVAudioPlayerWrapper()
    
    var body: some View {
        ZStack {
            // Background Image
            Image(.city)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                if verticalSizeClass == .compact { // Landscape mode
                    Spacer()
                }
                // Current Color Display
                Text("\(currentColor.toRussian().capitalized)")
                    .font(.system(size: 70)) // Set font size to make it much larger
                    .fontWeight(.bold) // Bold for better emphasis
                    .foregroundColor(currentColor.colorFromText()) // Set the text color
                    .overlay(
                        Text("\(currentColor.toRussian().capitalized)")
                            .font(.system(size: 75))
                            .fontWeight(.bold)
                            .foregroundColor(.white) // White outline
                            .offset(x: 1, y: 1) // Offset for a subtle outline effect
                            .blendMode(.destinationOut) // Helps create the outlined effect
                    )
                    .shadow(color: .white, radius: 4, x: 1, y: 1) // Additional white shadow for visibility
                    .onTapGesture {
                        playSound(for: currentColor.rawValue) // Play the sound for currentColor
                    }
                    .onAppear(){
                        playSound(for: currentColor.rawValue)
                    }
                
                              
                // Score Display
                Text("счет: \(score)")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                    .foregroundStyle(.black)
                    .shadow(color: .white, radius: 4, x: 1, y: 1)
                Spacer()

                
                if verticalSizeClass == .regular { // Portrait mode
                    
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                // Car Animation
                ZStack {
                    Car(colorName: passingCarColor)
                        .frame(width: 150, height: 100) // Adjust car size
                        .offset(x: carOffset, y: 0)
                        .onTapGesture {
                            playSound(for: passingCarColor.rawValue) // Play the sound for the car color
                            if passingCarColor == currentColor {
                                score += 1
                                currentColor = CarColor.allCases.randomElement() ?? .white
                                playRandomSuccessSound() // Play a random success sound
                            }
                        }
                }
                .onAppear {
                    startAnimation()
                }
                
                Spacer()
                
                
            }
            
        }
    }
    
    // Start the car animation
    func startAnimation() {
        withAnimation(Animation.linear(duration: 4).repeatForever(autoreverses: false)) {
            carOffset = UIScreen.main.bounds.width + 150 // Move offscreen to the right
        }
        
        // Change the car color each time it starts from the left
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            carOffset = -UIScreen.main.bounds.width // Reset to offscreen left
            passingCarColor = CarColor.allCases.randomElement() ?? .white
            startAnimation() // Restart animation
        }
    }
    
    // Play the sound for the given color name
    func playSound(for name: String) {
        audioPlayer.playSound(named: name)
    }
    
    // Play a random success sound
    func playRandomSuccessSound() {
        let successSounds = ["pravilno", "molodec", "umnica"]
        if let randomSound = successSounds.randomElement() {
            audioPlayer.playSound(named: randomSound)
        }
    }
}


#Preview {
    ColorRace()
}
