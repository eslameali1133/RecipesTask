//
//  AppCommon.swift
//  RecipesTask
//
//  Created by apple on 10/25/19.
//  Copyright © 2019 apple. All rights reserved.
//
//

import Foundation
import UIKit
//import JBWebViewController
//import SwiftyJSON


class AppCommon: UIViewController {
    
    static let sharedInstance = AppCommon()

    func dismissLoader(_ view:UIView){
        view.viewWithTag(1000)?.removeFromSuperview()
    }
    
    
    func roundingUIView( _ aView: UIView!,  cornerRadiusParam: CGFloat!) {
        aView.layer.cornerRadius = cornerRadiusParam
        aView.clipsToBounds = true
    }
    
    

    
    func alert(title: String, message: String, controller: UIViewController, actionTitle: String, actionStyle: UIAlertAction.Style) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: actionStyle, handler: nil))
        alert.view.tintColor = UIColor.red
        controller.present(alert, animated: true, completion: nil)

    }
    
    
    func alertWith(title: String, message: String, controller: UIViewController, actionTitle: String, actionStyle: UIAlertAction.Style, withCancelAction: Bool, completion: @escaping () -> Void) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: actionStyle, handler: { (action) in
            completion()
        }))
        alert.view.tintColor = UIColor.red
        if withCancelAction {
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        }
        
        controller.present(alert, animated: true, completion: nil)
    }

   
    
    
    func Alert(_ Message:String?,Title:String?,BtnOk:String?,Context:AnyObject ,Actions:@escaping ()->Void?){
        let WrongAlert=UIAlertController(title: Title, message: Message, preferredStyle: UIAlertController.Style.alert)
        WrongAlert.addAction(UIAlertAction(title: BtnOk, style: UIAlertAction.Style.default, handler: { Action in
            Actions()
        }))
        Context.present(WrongAlert, animated: true, completion: nil)
    }
    
    func ShowLoader(_ view:UIView,color:UIColor){
        let Loader  = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        Loader.backgroundColor = color
        Loader.tag = 1000
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        loadingIndicator.center = Loader.center
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        loadingIndicator.color = UIColor.black
        loadingIndicator.startAnimating();
        Loader.addSubview(loadingIndicator)
        view.addSubview(Loader)
    }
    
    
    
 
    
}

