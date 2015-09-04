//
//  UIExtensions.m
//  ExtensionDemo
//
//  Created by XCube Inc. on 03/09/15.
//  Copyright (c) 2015 XCube Inc. All rights reserved.
//

#import "UIExtensions.h"

UIExtensions *extensionGlobal;

@implementation UIExtensions


@synthesize parentController;
@synthesize activity;
+(UIExtensions *)sharedInstance
{
    if(!extensionGlobal) extensionGlobal=[[UIExtensions alloc]init];
    return extensionGlobal;
}


+(void)createLableWithController:(UIViewController *)ctrl Tag:(NSInteger)tagValue Frame:(CGRect)frameValue
{
 
    UILabel *lbl = [[UILabel alloc] initWithFrame:frameValue];       //CGRectMake(30, 300, 140, 40)];
    lbl.tag = tagValue;
    lbl.text = @"test";
    
    [ctrl.view addSubview:lbl];
    
    
}

@end

  

@implementation UIButton  (Extensions)

-(void)makeCircular
{
    self.layer.cornerRadius = self.frame.size.width/2;
    [self.layer setMasksToBounds:YES];
    
}


-(void)setButtonImage:(NSString *)imageName
{
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
}

-(void)setAttributedButtonTitle:(NSAttributedString *)title
{
    [self setAttributedTitle: title forState:UIControlStateNormal];
}


-(void)setButtonTitle:(NSString *)title
{
    
    
    
    
    
    
    
    [self setTitle:title forState:UIControlStateNormal];
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    
    
    
    
    
    
    
}

-(void)setButtonTitleColor:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateNormal];
}

-(void)setButtonBackgroudImage:(NSString *)imageName
{
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

-(void)setButtonBackgroundColor:(UIColor *)color
{
    [self setBackgroundColor:color];
    
}

@end

@implementation UITextField  (Extensions)
-(void)setNumberKeybord
{
    [self setNumberKeybord:nil withLeftTitle:@"Cancel" andRightTitle:@"Done"];
    
}
-(void)setNumberKeybord:(UIViewController *)controller withLeftTitle:(NSString *)left andRightTitle:(NSString *)right
{
    [UIExtensions sharedInstance].parentController= controller;
    [self setNumberKeybordWithLeftTitle:left andRightTitle:right];
    
}

-(void)setNumberKeybordWithLeftTitle:(NSString *)left andRightTitle:(NSString *)right
{
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    //toolBar.barStyle = UIBarStyleBlackOpaque;
    if([[UIDevice currentDevice].systemVersion floatValue]>= 7)
    {
        numberToolbar.barTintColor = [UIColor colorWithRed:224.0/255.0f green:225.0f/255.0f blue:226.0f/255.0f alpha:1.0];
    }
    else
        numberToolbar.tintColor = [UIColor colorWithRed:224.0/255.0f green:225.0f/255.0f blue:226.0f/255.0f alpha:1.0];
    
    
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:left style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:right style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    self.inputAccessoryView = numberToolbar;
    
}
-(void)doneWithNumberPad{
    
    //dismissKeyboardWithValue
    //dismissKeyboardDiscardingValue
    if([[UIExtensions sharedInstance].parentController canPerformAction:@selector(dismissKeyboardWithValue:) withSender:self])
    {
        [[UIExtensions sharedInstance].parentController performSelector:@selector(dismissKeyboardWithValue:) withObject:self];
    }
    else
    {
        
        [self resignFirstResponder];
    }
}

-(BOOL)isValidEmail
{
    BOOL stricterFilter = YES;
    if(self.text.length == 0) return NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self.text];
}
-(void)cancelNumberPad{
    
    
    if([[UIExtensions sharedInstance].parentController canPerformAction:@selector(dismissKeyboardDiscardingValue:) withSender:self])
    {
        [[UIExtensions sharedInstance].parentController performSelector:@selector(dismissKeyboardDiscardingValue:) withObject:self];
        
    }
    else
    {
        [self resignFirstResponder];
        self.text = @"";
    }
}
-(void)setGrayBorder
{
    
    self.layer.borderColor = [[UIColor colorWithRed:204.0/255.0f green:204.0/255.0f blue:204.0/255.0f alpha:1.0f]CGColor];
    self.layer.borderWidth= 1.0f;
    
}
- (void)setDarkGrayColor
{
    [self setValue:[UIColor colorWithRed:123.0/255.0f green:123.0/255.0f blue:123.0/255.0f alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    
}


- (void)setPlaceHolderColor:(UIColor *)color
{
    [self setValue:color
        forKeyPath:@"_placeholderLabel.textColor"];
}

@end

@implementation UILabel (Extensions)


-(void)setFontHelevetica:(float)size
{
    [self setFont:[UIFont fontWithName:@"Helvetica" size:size]];
}

-(void)setFontHeleveticaBold:(float)size
{
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:size]];
}

-(void)setFontHeleveticaNueue:(float)size
{
    [self setFont:[UIFont fontWithName:@"HelveticaNeue" size:size]];
}
-(void)setFontHeleveticaNueueBold:(float)size
{
    [self setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:size]];
}
-(void)setFontHeleveticaNueueMedium:(float)size
{
    [self setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:size]];
}

@end
