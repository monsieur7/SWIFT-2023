//
//  Todo.swift
//  TODO
//
//  Created by Nolane Delille on 28/11/2023.
//

import Foundation
enum TodoType: String, Codable {
    case DEVOIRS;
    
}
class Todo : Codable{
    
    var title: String;
    var description: String;
    var type: TodoType;
    var date:Date;
    var dueDate:Date;
    var done:Bool;
    var id:String;
    var sectionNumber:Int;
    init(){
        self.title = "";
        self.description = "";
        self.type = TodoType.DEVOIRS;
        self.date = Date();
        self.dueDate = Date(timeIntervalSinceNow: 3600*24);
        self.done = false;
        self.id = UUID().uuidString;
        self.sectionNumber = 0;
    }
    init(title:String, description:String, type:TodoType, dueDate:Date, date:Date){
        self.title = title;
        self.description = description;
        self.type = type;
        self.id = UUID().uuidString;
        self.date = date;
        self.dueDate = dueDate;
        self.done = false;
        self.sectionNumber = 0;
    }
    
    
    
    
}
