//
//  TitleView.swift
//  To Do List
//
//  Created by Luc Benedictson on 2024-02-25.
//

import SwiftUI

/*
 Displays the current date and provides buttons to switch between lists, clear the list, or to enter an editing state.
 */

struct TitleView: View {
    let list: BasicToDoList
    let todoList: Bool
    let edit: Bool

    var body: some View {
        VStack(spacing: 5) {
            
            HStack{
                Text(Date().formatted(date: .abbreviated, time: .omitted)).frame(maxWidth: .infinity, alignment: .leading).font(.largeTitle).padding(.leading)
                Spacer()
                
                Button {
                    list.clearList()
                } label: {
                    CapsuleTextView(keyword: "Clear List", clicked: true, color: .red)
                        .padding(.trailing)
                }
            }
            
            HStack {
                Button {
                    list.toDoList()
                } label: {
                    CapsuleTextView(keyword: "To Do", clicked: todoList, color: .purple)
                        .padding(.leading)
                }
                
                Spacer()
                
                Button {
                        list.completeList()
                } label: {
                    CapsuleTextView(keyword: "Complete", clicked: !todoList, color: .purple)
                }
                
                Spacer()
                
                Button{
                    list.editMode()
                } label: {
                    CapsuleTextView(keyword: "Edit", clicked: edit, color: .mint)
                        .padding(.trailing)
                }
            }
        }
    }
}

