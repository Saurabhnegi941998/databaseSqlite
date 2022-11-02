//
//  DBAHelper.swift
//  LearningCode
//
//  Created by Saurabhnegi on 31/10/22.
//

import Foundation
import SQLite3
class DBAHelper{
    var db  : OpaquePointer?
    var path : String = "myDb.sqlite"
    init(){
        self.db = createDB()
        self.createTable()
        
    }
    func createDB() -> OpaquePointer?{
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)
        var db : OpaquePointer? = nil
        if sqlite3_open(filePath.path, &db) != SQLITE_OK{
            print("There is Error Is ")
            return nil
        }else{
            print("File path is \(filePath)")
            return db
        }
        
    }
    func createTable(){
        let query = "CREATE TABLE IF NOT EXISTS LOGIN(url TEXT,username TEXT, pswd TEXT );"
     var createTable :  OpaquePointer? = nil
        if sqlite3_prepare_v2(self.db, query, -1, &createTable , nil) ==  SQLITE_OK{
            if sqlite3_step(createTable) ==  SQLITE_DONE{
                print("table is  Create Succesfully")
            }
            else{
                print("table is Not creating")
            }
            
        }else{
            
            print("Prepration failed")
            
        }
    }
    func insert(url: String? , username  : String? , pswd : String?)
    {
        let query = "INSERT INTO login(url,username,pswd)values(?,?,?)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            
            sqlite3_bind_text(statement, 1, (url as!  NSString).utf8String, -1,nil)
            sqlite3_bind_text(statement, 2, (username as!  NSString).utf8String, -1,nil)

            sqlite3_bind_text(statement, 3, (pswd! as  NSString).utf8String, -1,nil)
            if sqlite3_step(statement) ==  SQLITE_DONE
            {
                print("Success ")
            }
            else{
                print("Data is not success")
            }

        }
        
    }
    func readData() -> [loginModal]{
      var loginData = [loginModal]()
        let query = "select * from login"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) ==  SQLITE_OK{
            while sqlite3_step(statement) == SQLITE_ROW{
                let url = String(cString : sqlite3_column_text(statement, 0))
                let username = String(cString  :sqlite3_column_text(statement, 1))
                let pswd = String(cString  : sqlite3_column_text(statement, 2))
                let model = loginModal()
                model.url = url
                model.username = username
                model.pswd = pswd
                loginData.append(model)
          
            }
        }
        return loginData

        
    }
    
    func update(url:String){
         var loginData  = [loginModal]()
        let updateStatementString = "update login set url = 'new Inserted' where url = \(url)"
        var updateStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) ==
            SQLITE_OK {
          if sqlite3_step(updateStatement) == SQLITE_DONE {
            print("\nSuccessfully updated row.")
          } else {
            print("\nCould not update row.")
          }
        } else {
          print("\nUPDATE statement is not prepared")
        }
        sqlite3_finalize(updateStatement)
      }
        
        
        
        
        
    
  
}
