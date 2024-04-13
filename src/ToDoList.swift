//
//  ToDoList.swift
//  To Do List
//
//  Created by Luc Benedictson on 2024-02-16.
//

/*
 Model
 */

import Foundation

struct ToDoList {
    private(set) var currDisplay: Array<Task>
    private var currId = 1;

    init() {
        currDisplay = Array()
    }
    
    //Used to update the currDisplay and currId to the values the were at the end of the last app launch
    mutating func setDisplay(_ newDisplay: Array<Task>){
        if let greatestId = newDisplay.max(by: { $0.id < $1.id}){
            currId = greatestId.id + 1
            currDisplay = newDisplay
        }
    }
        
    mutating func add(todo:String){
        //No empty strings or duplicate tasks
        if(todo.count > 0 && !currDisplay.contains(where: {$0.todo == todo})){
            currDisplay.append(Task(todo: todo, id: currId))
            currId += 1
        }
    }
    
    mutating func toggleStatus(_ task: Task){
        if let chosenIndex = currDisplay.firstIndex(where: {$0.id == task.id}){
            currDisplay[chosenIndex].complete.toggle()
        }
    }
    
    mutating func changeTodo(oldTodo: String, newTodo: String){
        if(newTodo.count > 0){ //no empty strings
            if let chosenIndex = currDisplay.firstIndex(where: {$0.todo == oldTodo}){ //find task that contained oldTodo
                currDisplay[chosenIndex].todo = newTodo
            }
        }
    }

    mutating func clearAll(){
        currDisplay.removeAll()
        currId = 1
    }
    
    mutating func delete(_ task: Task){
        if let chosenIndex = currDisplay.firstIndex(where: {$0.id == task.id}){
            currDisplay.remove(at: chosenIndex)
        }
    }

    struct Task: Identifiable, Codable {
        var todo: String
        var complete: Bool = false;
        var id: Int
    }
}
