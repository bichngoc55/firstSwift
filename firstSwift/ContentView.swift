//
//  ContentView.swift
//  firstSwift
//
//  Created by Bích Ngọc on 5/2/25.
//

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        HStack {
//            MyCustomView()
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TaskListViewModel()
    @State private var newTaskTitle = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New Task", text: $newTaskTitle) 
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        viewModel.addTask(title: newTaskTitle) 
                        newTaskTitle = ""
                    }) {
                        Text("Add")
                    }
                }
                .padding()

                List {
                    ForEach(viewModel.tasks) { task in
                        HStack {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    viewModel.toggleTaskCompletion(task: task)
                                }
                            Text(task.title)
                                .strikethrough(task.isCompleted)
                        }
                    }
                }
            }
            .navigationTitle("To-Do List") // Title for the navigation
        }
    }
}

#Preview {
    ContentView()
}
