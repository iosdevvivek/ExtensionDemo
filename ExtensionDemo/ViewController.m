//
//  ViewController.m
//  ExtensionDemo
//
//  Created by XCube Inc. on 03/09/15.
//  Copyright (c) 2015 XCube Inc. All rights reserved.
//

#import "ViewController.h"
#import "UIExtensions.h"
#import "MHTextField.h"
@interface ViewController ()
{
    MHTextField *txt;
    UILabel *lbll;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 40)];
    [btn setBackgroundColor:[UIColor redColor]];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"test" forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
        txt  = [[MHTextField alloc] initWithFrame:CGRectMake(50,350, 100, 40)];
   // txt.backgroundColor = [UIColor blueColor];

    
    [txt setNumberKeybord];
    [txt isValidEmail];
    [txt setGrayBorder];
    [txt setPlaceHolderColor:[UIColor whiteColor]];
    
    [self.view addSubview:txt];
    
    
    // Uilabel
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(30, 300, 140, 40)];
    lbl.text = @"test";
    
 //   [self.view addSubview:lbl];
    
    [UIExtensions createLableWithController:self Tag:11 Frame:CGRectMake(30, 300, 140, 40)];
      lbll =  (UILabel*)[self.view viewWithTag:11]    ;
    
    [lbll setBackgroundColor:[UIColor redColor]];
    
    
}

-(IBAction)click:(id)sender
{
     [txt isValidEmail];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
