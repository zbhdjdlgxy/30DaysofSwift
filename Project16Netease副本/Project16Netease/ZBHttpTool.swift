//
//  ZBHttpTool.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/26.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import Foundation
import Alamofire

struct ZBFormData {
    /**
     *  参数名
     */
    var name : String?
    /**
     *  文件名
     */
    var filename : String?
    /**
     *  文件类型
     */
    var mimeType : String?
    /**
     *  文件数据
     */
    var data : NSData?
}


final class ZBHttpTool: NSObject {
    
    class func getWithUrl(url : String,params : Dictionary<String,AnyObject>,success : (id : AnyObject) -> Void,failure : (id : AnyObject) -> Void){
        
        Alamofire.request(.GET, url, parameters: params)
            .validate()
            .response { request, response, data, error in
                if (error == nil){
                    
                    let dic : Dictionary<String,AnyObject> = try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! Dictionary
                    success(id: dic)
                }else{
                    failure(id: error!)
                }
        }
    }
    
    
    class func postWithUrl(url : String,params : Dictionary<String,AnyObject>,success : (id : AnyObject) -> Void,failure : (id : AnyObject) -> Void){
        
        Alamofire.request(.POST, url, parameters: params)
            .validate()
            .response { request, response, data, error in
                print(request)
                print(response)
                print(data)
                print(error)
        }
    }
    
    class func postWithUrl(url : String,params : Dictionary<String,AnyObject>,formDataArray : Array<ZBFormData>,success : (id : AnyObject) -> Void,failure : (id : AnyObject) -> Void){
        
        Alamofire.upload(
            .POST,
            url,
            multipartFormData: { multipartFormData in
                for formData in formDataArray{
                    multipartFormData.appendBodyPart(data: formData.data!, name: formData.name!, fileName: formData.filename!, mimeType: formData.mimeType!)
                }
            },
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .Success(let upload, _, _):
                    upload.responseJSON { response in
                        debugPrint(response)
                    }
                    upload.responseData(completionHandler: { response in
                        
                        print(response.data)
                    })
                case .Failure(let encodingError):
                    print(encodingError)
                }
            }
        )
    }
}
