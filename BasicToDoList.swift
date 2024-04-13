//
//  BasicToDoList.swift
//  To Do List
//
//  Created by Luc Benedictson on 2024-02-16.
//

/*
 View Model
 */

import SwiftUI

class BasicToDoList: ObservableObject {
    @Published var model = ToDoList() {
        didSet{
            saveItems() //Every change to the model (editing, adding, deleting, etc.) will save the new list
        }
    }
    @Published private(set) var toDo = true
    @Published private(set) var edit = false
    
    private let tasksKey: String = "tasks_key"
    
    var currentTasks: Array<ToDoList.Task> {
        model.currDisplay
    }
    
    //Set the list of tasks to the state it was left in after the last launch
    init(){
        guard
            let data = UserDefaults.standard.data(forKey: tasksKey),
            let savedItems = try? JSONDecoder().decode(Array<ToDoList.Task>.self, from: data)
        else {return}

        model.setDisplay(savedItems)
    }
    
    
    func editMode(){
        edit.toggle()
    }
    
    func editTodo(oldTodo: String, newTodo: String){
        model.changeTodo(oldTodo: oldTodo, newTodo: newTodo)
    }
    
    func remove(_ task: ToDoList.Task){
        model.delete(task)
    }
    
    func toDoList(){
        toDo = true
    }

    func completeList(){
        toDo = false
    }

    func toggleCompletionStatus(_ task: ToDoList.Task){
        model.toggleStatus(task)
    }
    
    func addTask(_ newTask: String){
        model.add(todo: newTask)
    }
    
    func clearList(){
        model.clearAll()
    }
    
    //Encodes all the current tasks to allow the list to persist between launches
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(model.currDisplay){
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        }
    }
}


