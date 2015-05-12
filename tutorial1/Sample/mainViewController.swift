//
//  mainViewController.swift
//  Sample
//
//  Created by Rafael  Hieda on 11/05/15.
//  Copyright (c) 2015 Rafael Hieda. All rights reserved.
//

import UIKit
import SceneKit

class mainViewController: UIViewController {

    var myScene: SCNScene!
    
    
    @IBAction func segmentedControlManager(sender: AnyObject) {
        if sender.selectedSegmentIndex == 0 {
            println("0")
            self.omniLight()
            //self.lightTypes(SCNLightTypeOmni)
            
        }
        else if sender.selectedSegmentIndex == 1 {
            println("abestado")
            self.ambientLightNode()
            //self.lightTypes(SCNLightTypeAmbient)
        }
        else if sender.selectedSegmentIndex == 2 {
            println("3")
            self.lightTypeSpot()
//            self.lightTypes(SCNLightTypeSpot)
        }
        else if sender.selectedSegmentIndex == 3 {
            println("4")
            self.lightTypeDirectional()
//            self.lightTypes(SCNLightTypeDirectional)
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = SCNView(frame: CGRectMake(CGFloat(0), CGFloat(100), self.view.frame.width, self.view.frame.height - 100))
        myScene = SCNScene()
        myView.scene = myScene
        
        self.view.addSubview(myView)
        
        //setting the box
        let myBox = SCNBox(width: 15, height: 10, length: 12, chamferRadius: 0)
        let boxNode = SCNNode(geometry: myBox)
        boxNode.position = SCNVector3(x: 0, y: 0, z: 0)
        boxNode.rotation = SCNVector4(x: 1, y: 1, z: 0.5, w: 0.6)
        myScene.rootNode.addChildNode(boxNode)
        
        
        myView.autoenablesDefaultLighting = true
        myView.showsStatistics = true
        
        //setting camera
        
        let camera = SCNCamera()
        //obs: Fov = field of view
        camera.xFov = 40
        camera.yFov = 40
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(x: -25, y: 20, z: 30)
        cameraNode.orientation = SCNQuaternion(x: -0.26, y: -0.32, z: 0, w: 0.91)
        myScene.rootNode.addChildNode(cameraNode)
        
        //talvez quartenion seja hardcore demais, podemos usar isso aqui
        myView.allowsCameraControl = true
        
        
        // Do any additional setup after loading the view.
    }
    
    func lightTypes(type:AnyObject) {
        let myLight = SCNLight()
        myLight.type = type as! String
        myLight.color = UIColor.yellowColor()
        
        let myLightNode = SCNNode()
        myLightNode.light = myLight
        myLightNode.position = SCNVector3(x: -30, y: 30, z: 60)
        myScene.rootNode.addChildNode(myLightNode)
    }
    
    func omniLight() {
        //criando omniLight fonte pontual de luz
                let myLight = SCNLight()
                myLight.type = SCNLightTypeOmni
                myLight.color = UIColor.yellowColor()
        
                let myLightNode = SCNNode()
                myLightNode.light = myLight
                myLightNode.position = SCNVector3(x: -30, y: 30, z: 60)
                myScene.rootNode.addChildNode(myLightNode)
        

    }
    
    func ambientLightNode() {
        //SCNLightTypeAmbient =  tipo de luz qye ilumina todas as direções
                let ambientLight = SCNLight()
                ambientLight.type = SCNLightTypeAmbient
                ambientLight.color = UIColor.yellowColor()
        
                let ambientLightNode = SCNNode()
                ambientLightNode.light = ambientLight
                ambientLightNode.position = SCNVector3(x: -30, y: 30, z: 60)
                myScene.rootNode.addChildNode(ambientLightNode)
        

        
    }
    
    func lightTypeDirectional() {
        //SCNLightTypeDirectional = type of light illuminates from one direction
                let myDirectLight = SCNLight()
                myDirectLight.type = SCNLightTypeDirectional
                myDirectLight.color = UIColor.yellowColor()
                let myDirectLightNode = SCNNode()
                myDirectLightNode.light = myDirectLight
                myDirectLightNode.orientation = SCNQuaternion(x: 0, y: 0, z: 1, w: 0)
                myScene.rootNode.addChildNode(myDirectLightNode)
        
    }
    
    func lightTypeSpot() {
        //SCNLightTypeSpot illuminates a cone-shaped area
        let mySpotLight = SCNLight()
        mySpotLight.type = SCNLightTypeSpot
        mySpotLight.color = UIColor.yellowColor()
        let mySpotLightNode = SCNNode()
        mySpotLightNode.light = mySpotLight
        mySpotLightNode.position = SCNVector3(x: 0, y: 0, z: 20)
        mySpotLightNode.orientation = SCNQuaternion(x: 0, y: 0, z: 1, w: 0.5)
        myScene.rootNode.addChildNode(mySpotLightNode)
        
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
