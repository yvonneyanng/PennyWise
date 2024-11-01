//
//  ContentView.swift
//  PennyWise
//
//  Created by Yvonne Yang on 2024/11/1.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\..modelContext) private var context
    @Query private var items: [DataItem]
    
    var body: some View {
        VStack {
            Text("Tap on this button to add data")
            Button("Add an item"){
                addItem()
            }
            List{
                ForEach (items) { item in
                    HStack{
                        Text(item.name)
                        Spacer()
                        Button{
                            updateItem(item)
                        } label: {
                            Image(systemName: "arrow.triangle.2.circlepath")
                        }
                    }
                }.onDelete{ indexes in
                    for index in indexes {
                        deleteItem(items[index])
                    }
                }
            }
        }
        .padding()
    }
    
    func addItem() {
        let item = DataItem(name: "Test Item")
        context.insert(item)
    }
    
    func deleteItem(_ item: DataItem) {
        context.delete(item)
    }
    
    func updateItem(_ item: DataItem) {
        item.name = "Updated Test Item"
        try? context.save()
    }
}

#Preview {
    ContentView()
}
