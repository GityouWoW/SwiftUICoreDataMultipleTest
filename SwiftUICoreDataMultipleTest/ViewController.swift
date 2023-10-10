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

        // ContentView SwiftUIビューのインスタンスを作成
//        let contentView = ContentView().environment(\.managedObjectContext, CoreDataManager.shared.managedObjectContext)
//
//        // UIHostingControllerインスタンスを作成
//        let hostingController = UIHostingController(rootView: contentView)
//        hostingController.modalPresentationStyle = .fullScreen
//
//        present(hostingController, animated: true)
        
        
//        // 子ビューコントローラとしてUIHostingControllerインスタンスを追加
//        self.addChild(hostingController)
//
//        // UIHostingControllerのビューを、現在のビューコントローラのビューに追加
//        self.view.addSubview(hostingController.view)
//
//        // Auto Layout制約を設定
//        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            hostingController.view.topAnchor.constraint(equalTo: self.view.topAnchor),
//            hostingController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            hostingController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            hostingController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
//        ])
//
//        // 子ビューコントローラとしての追加を完了
//        hostingController.didMove(toParent: self)
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
