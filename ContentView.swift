//
//  ContentView.swift
//  To Do List
//
//  Created by Luc Benedictson on 2024-02-25.
//

/*
 Main View
 */

import SwiftUI

@available(iOS 16.0, *) //to allow axis: .vertical parameter in TextField

struct ContentView: View {
    @ObservedObject var list:BasicToDoList = BasicToDoList()
    @State private var toAdd: String = ""
    @State private var toChange: String = ""
    @State private var changeTo: String = ""
    @FocusState private var isFocused: Bool

    var body: some View {
        TitleView(list: list , todoList: list.toDo , edit: list.edit)
        
        ScrollView {
            ForEach(list.currentTasks) { task in
                if(!task.complete == list.toDo){
                    TaskView(task: task, list: list)
                        .padding(.horizontal)
                        .frame(height: 100)
                        .onTapGesture {
                            if(list.edit){
                                changeTo = task.todo
                                toChange = task.todo
                            }
                        }
                        .mySwipeAction {
                            list.remove(task)
                        }
                }
            }
        }
    
        
        Spacer()
        
        VStack{
            TextField(list.edit ? "to change..." : "to do..." , text: list.edit ? $changeTo : $toAdd , axis: .vertical)
                .padding()
                .background(Color.mint.opacity(0.75).cornerRadius(10))
                .foregroundColor(.black)
                .focused($isFocused)
            Button {
                list.edit ? list.editTodo(oldTodo: toChange, newTodo: changeTo ) : list.addTask(toAdd)
                toAdd = ""
                toChange = ""
                changeTo = ""
                isFocused = false
            } label: {
                Text(list.edit ? "Edit" : "Add + ")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple.opacity(0.75).cornerRadius(10))
                    .foregroundColor(.black)
            }
        }.padding(.horizontal)
    }
}

