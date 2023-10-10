//
//  ViewController.swift
//  SwiftUICoreDataMultipleTest
//
//  Created by Yu on 2023/10/09.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newResident = NSEntityDescription.insertNewObject(forEntityName: "Resident", into: context) as! Resident

        do {
            try context.save()
        } catch {
            // エラーハンドリング
        }

        let fetchRequest: NSFetchRequest<Resident> = Resident.fetchRequest()
        do {
            let residents = try context.fetch(fetchRequest)
            print(residents.count)
            // 操作
        } catch {
            // エラーハンドリング
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // ContentView SwiftUIビューのインスタンスを作成
        let contentView = ContentView().environment(\.managedObjectContext, CoreDataManager.shared.managedObjectContext)
        
        // UIHostingControllerインスタンスを作成
        let hostingController = UIHostingController(rootView: contentView)
        hostingController.modalPresentationStyle = .fullScreen
        
        present(hostingController, animated: true)
    }
}

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var managedObjectContext
    @FetchRequest(
           sortDescriptors: [],
           animation: .default)
       private var residents: FetchedResults<Resident>
    var body: some View {
        // ここで managedObjectContext を利用する...
        Text("Hello, world!")
        ForEach(residents, id: \.self) { i in
            
        }
    }
}
