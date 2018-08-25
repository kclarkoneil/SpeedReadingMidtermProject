//
//  ImportViewController.swift
//  SpeedReading
//
//  Created by Bennett on 2018-08-23.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit
import PDFKit
import Material

class ImportViewController: UIViewController {
    
    var reading: ReadingMaterial?
    var delegate: ImportViewControllerDelegate?

    @IBOutlet weak var titleTextField: ErrorTextField!
    
    @IBOutlet weak var readingTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.isErrorRevealed = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func processPDF(url: URL) -> String? {
        if let pdf = PDFDocument(url: url) {
            let pageCount = pdf.pageCount
            var documentContent = ""
            
            for i in 1 ..< pageCount {
                guard let page = pdf.page(at: i) else { continue }
                guard let pageContent = page.string else { continue }
                documentContent.append(pageContent)
            }
            return documentContent
        }
      //issues with the URL, tell the user
        let alert = UIAlertController(title: "Url is invalid", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        return nil
    }
    
    func promptForURL() {

    
    }
    
    // Mark: IBActions
    @IBAction func importPDF(_ sender: Any) {
        //call function to open a popup dialog
        let alert = UIAlertController(title: "Url for pdf", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "pdf url"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            if var urlString = alert.textFields?.first?.text {
                //set textArea text to the content of pdf conorlastowka.com/book/CitationNeededBook-Sample.pdf
                if !urlString.hasPrefix("http://"){
                    urlString = "http://" + urlString
                }
              guard let url = URL(string: urlString) else{
                return
              }
              
              self.readingTextView.text = self.processPDF(url: url)
                
            }
        }))
        
        self.present(alert, animated: true)
        
        
    }
    
    @IBAction func saveReadingMaterials(_ sender: Any) {
        if let title = titleTextField.text {
            reading = ReadingMaterial(title: title,
                                          body: readingTextView.text)
            if let delegate = delegate, let reading = reading{
              delegate.saveReadingMaterial(controller: self, reading: reading)
            }
          self.navigationController?.popViewController(animated: true)
        }
        else{
            titleTextField.detail = "Error: input title"
            titleTextField.isErrorRevealed = true
        }
    }
    

}
