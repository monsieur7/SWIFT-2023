//
//  Todo.swift
//  TODO
//
//  Created by Nolane Delille on 28/11/2023.
//

import Foundation
enum TodoType {
    case DEVOIRS;
    
}
class Todo {
    
    var title: String;
    var description: String;
    var type: TodoType;
    init(){
        title = "";
        description = "";
        type = TodoType.DEVOIRS;
    }


    
}
