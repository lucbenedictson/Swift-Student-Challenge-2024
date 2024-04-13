//
//  TaskView.swift
//  To Do List
//
//  Created by Luc Benedictson on 2024-02-25.
//

import SwiftUI

/*
 Enclose each task in a rounded rectangle. Inside the rectangle there is a button to the toggle completion status of the
 to do text.
 */

struct TaskView: View{
    let task: ToDoList.Task
    let list: BasicToDoList

    var body: some View {
        GeometryReader { geo in
            ZStack{
                RoundedRectangle(cornerRadius: 40)
                    .strokeBorder(Color.black, lineWidth: 3)
                    .foregroundColor(.white)

                HStack{
                    Button {
                        list.toggleCompletionStatus(task)
                    } label: {
                        if(!task.complete){
                            Circle()
                                .strokeBorder(Color.black,lineWidth: 2)
                                .frame(width:geo.size.width*0.075, height:geo.size.width*0.075)
                        } else {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width:geo.size.width*0.075, height:geo.size.width*0.075)
                                .foregroundColor(Color.black)
                        }
                    }

                    Text(task.todo)
                        .frame(width: geo.size.width * 0.80,height: geo.size.height*0.90 , alignment: .leading )
                }
            }
        }
    }
}
