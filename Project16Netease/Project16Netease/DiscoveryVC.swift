//
//  DiscoveryVC.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/31.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class DiscoveryVC: UIViewController {

    var groundLayer:CALayer?
    var yellowPath:CAShapeLayer?
    var greenPath:CAShapeLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.grayColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        let size = view.frame.size
        initGradientLayer(size)
        addCloudAnimation(size)
        groundLayer = initGroundLayer(size)
        initGrasslandlayer(size)
        addTreeLayer(size)
        yellowPath = initYellowPathLayer(size)
        for index in 0...4 {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(70 * index) * Int64(NSEC_PER_MSEC)), dispatch_get_main_queue(), {
                self.addYellowCarPathAnimation()
            })
        }
    }

    //初始化草坪
    func initGrasslandlayer(size:CGSize) -> (CAShapeLayer, CAShapeLayer) {
        let grasslandOne = CAShapeLayer()
        //通过UIBezierPath来绘制路径
        let pathOne:UIBezierPath = UIBezierPath()
        pathOne.moveToPoint(CGPoint(x: 0, y: size.height - 69))
        pathOne.addLineToPoint(CGPoint(x: 0, y: size.height - 149))
        pathOne.addQuadCurveToPoint(CGPoint(x: size.width/2.0, y: size.height - 69), controlPoint: CGPoint(x: size.width/6.0, y: size.height - 170))
        grasslandOne.path = pathOne.CGPath
        //设置草坪的颜色
        grasslandOne.fillColor = UIColor.init(colorLiteralRed: 82.0/255.0, green: 177.0/255.0, blue: 44.0/255.0, alpha: 1.0).CGColor
        view.layer.addSublayer(grasslandOne)
        
        let grasslandTwo = CAShapeLayer()
        let pathTwo:UIBezierPath = UIBezierPath()
        pathTwo.moveToPoint(CGPoint(x: size.width/2.0 - 50, y: size.height - 69))
        pathTwo.addQuadCurveToPoint(CGPoint(x: size.width, y: size.height - 90), controlPoint: CGPoint(x: size.width/2.0 + 70, y: size.height - 140))
        pathTwo.addLineToPoint(CGPoint(x: size.width, y: size.height - 69))
        grasslandTwo.path = pathTwo.CGPath
        grasslandTwo.fillColor = UIColor.init(colorLiteralRed: 92.0/255.0, green: 195.0/255.0, blue: 52.0/255.0, alpha: 1.0).CGColor
        view.layer.addSublayer(grasslandTwo)
        
        return (grasslandOne, grasslandTwo)
    }
    
    //初始化大地
    func initGroundLayer(size:CGSize) -> CALayer {
        let ground:CALayer = CALayer()
        ground.frame = CGRect(x: 0, y: size.height - 69, width: size.width, height: 20)
        ground.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "ground")!).CGColor
        view.layer.addSublayer(ground)
        return ground
    }
    
    //添加黄色轨道的动画
    func addYellowCarPathAnimation() {
        let carLayer:CALayer = CALayer()
        carLayer.frame = CGRect(x: 0, y: 0, width: 17, height: 11)
        carLayer.setAffineTransform(CGAffineTransformTranslate(carLayer.affineTransform(), 0, -7))
        carLayer.contents = UIImage.init(named: "car")!.CGImage
        let animation:CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "position")
        animation.path = yellowPath?.path
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        animation.duration = 6
        animation.repeatCount = MAXFLOAT
        animation.autoreverses = false
        animation.calculationMode = kCAAnimationCubicPaced
        animation.rotationMode = kCAAnimationRotateAuto
        yellowPath?.addSublayer(carLayer)
        carLayer.addAnimation(animation, forKey: "carAnimation")
    }
    
    //初始化黄色轨道
    func initYellowPathLayer(size:CGSize) -> CAShapeLayer {
        let calayer:CAShapeLayer = CAShapeLayer()
        calayer.backgroundColor = UIColor.redColor().CGColor
        calayer.lineWidth = 5
        calayer.strokeColor = UIColor.init(colorLiteralRed: 210.0/255.0, green: 179.0/255.0, blue: 54.0/255.0, alpha: 1.0).CGColor
        let path:UIBezierPath = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: size.height - 159))
        path.addCurveToPoint(CGPoint(x: size.width/2 + 50, y: size.height/2 + 150), controlPoint1: CGPoint(x: size.width/6, y: size.height - 300), controlPoint2: CGPoint(x: size.width/2.5, y: size.height))
       path.addQuadCurveToPoint(CGPoint(x: size.width+10, y: size.height/4 * 2.5), controlPoint: CGPoint(x: size.width/4 * 3, y: 350))
        path.addLineToPoint(CGPoint(x: size.width + 10, y: size.height+59))
        path.addLineToPoint(CGPoint(x: 0, y: size.height+59))
        calayer.fillColor = UIColor.init(patternImage: UIImage.init(named: "yellow")!).CGColor
        calayer.path = path.CGPath
        view.layer.insertSublayer(calayer, below: groundLayer)
        
        let lineLayer:CAShapeLayer = CAShapeLayer()
        lineLayer.lineCap = kCALineCapRound
        lineLayer.strokeColor = UIColor.whiteColor().CGColor
        lineLayer.lineDashPattern = [NSNumber.init(int: 1),NSNumber.init(int: 5)]
        lineLayer.lineWidth = 2
        lineLayer.fillColor = UIColor.clearColor().CGColor
        lineLayer.path = path.CGPath
        calayer.addSublayer(lineLayer)
        
        return calayer
    }
    
    //初始化云朵动画
    func addCloudAnimation(size:CGSize) -> CALayer {
        let cloudLayer:CALayer = CALayer()
        cloudLayer.contents = UIImage.init(named: "cloud")?.CGImage
        cloudLayer.frame = CGRect(x: -63, y: 100, width: 63, height: 20)
        view.layer.addSublayer(cloudLayer)
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: -63, y: 100))
        path.addLineToPoint(CGPoint(x: size.width, y: 100))
        
        let animation = CAKeyframeAnimation.init(keyPath: "position")
        animation.path = path.CGPath
        animation.duration = 8
        animation.autoreverses = false
        animation.repeatCount = MAXFLOAT
        animation.calculationMode = kCAAnimationPaced
        cloudLayer.addAnimation(animation, forKey: "position")
        return cloudLayer
    }
    
    //添加树
    func addTreeLayer(size:CGSize) {
        for index in 0...6 {
            let treeOne = CALayer()
            treeOne.contents = UIImage.init(named: "tree")?.CGImage
            treeOne.frame = CGRect(x: [5,55,70,size.width/3+15,size.width/3+25,size.width-130,size.width-160][index], y: size.height - 95, width: 13, height: 23)
            view.layer.addSublayer(treeOne)
        }
    }
    
    //初始化背景
    func initGradientLayer(size:CGSize) -> CAGradientLayer {
        let layer:CAGradientLayer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height - 20)
        //设置渐变的颜色
        layer.colors = [UIColor.init(colorLiteralRed: 178.0/255.0, green: 226.0/255.0, blue: 248.0/255.0, alpha: 1.0).CGColor, UIColor.init(colorLiteralRed: 232.0/255.0, green: 244.0/255.0, blue: 193.0/255.0, alpha: 1.0).CGColor]
        //设置渐变的方向为从左到右
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.addSublayer(layer)
        return layer
    }
}
