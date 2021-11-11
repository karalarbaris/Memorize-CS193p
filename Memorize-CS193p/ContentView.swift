//
//  ContentView.swift
//  Memorize-CS193p
//
//  Created by Baris Karalar on 6.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🚘", "🚖", "🚁", "🛳", "⛴", "🚢", "🚤", "🛥", "🛸", "💺", "🚉", "🛩", "🚊", "✈️", "🛫", "🛬", "🚇", "🚆"]
    
    var vehicleEmojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🚘", "🚖", "🚁", "🛳", "⛴", "🚢", "🚤", "🛥", "🛸", "💺", "🚉", "🛩", "🚊", "✈️", "🛫", "🛬", "🚇", "🚆"]
    
    var objectEmojis = ["⌚️", "📱", "💻", "⌨️", "🖨", "🖲", "🕹", "💽", "💾", "💿", "📀", "📼", "📷", "📸", "📹", "🎥", "📽", "🎞", "📞", "☎️", "📟", "📠", "📺", "💰", "💳", "💎", "⚖️", "🪜", "🧰", "🪛", "🔧"]
    
    var activityEmojis = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏒", "🤿", "🏹", "🥊", "🎽", "🛼", "🪂", "⛷", "🥌", "⛸", "🏌️", "🏄‍♂️", "🚣‍♂️", "🚵‍♀️", "🚴🏼‍♀️"]
    
    @State var emojiCount =  Int.random(in: 4...25)
        
    var body: some View {
        VStack {
            ScrollView {
                Text("Memorize!")
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            .font(.largeTitle)
            Spacer()
            HStack {
                
                vehicleTheme
                Spacer()
                objectTheme
                Spacer()
                activityTheme
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding()
        
    }
    
    var vehicleTheme: some View {
        Button {
            emojis = vehicleEmojis.shuffled()
            emojiCount = Int.random(in: 4...25)
        } label: {
            VStack {
                Image(systemName: "car.fill")
                Text("Vehicles").font(.body)
            }.font(.largeTitle)
        }
    }
    
    var objectTheme: some View {
        Button {
            emojis = objectEmojis.shuffled()
            emojiCount = Int.random(in: 4...25)
        } label: {
            VStack {
                Image(systemName: "pencil.slash")
                Text("Objects").font(.body)
            }
        }
    }
    
    var activityTheme: some View {
        Button {
            emojis = activityEmojis.shuffled()
            emojiCount = Int.random(in: 4...25)
        } label: {
            VStack {
                Image(systemName: "heart.fill")
                Text("Activities").font(.body)
            }
        }

    }
    
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
                    .padding(.all)
            } else {
                shape.fill()
            }
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
