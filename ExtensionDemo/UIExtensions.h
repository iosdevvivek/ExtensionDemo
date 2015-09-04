//
//  UIExtensions.h
//  ExtensionDemo
//
//  Created by XCube Inc. on 03/09/15.
//  Copyright (c) 2015 XCube Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface UIExtensions : NSObject

@property (nonatomic, retain) UIViewController *parentController;
@property (nonatomic, retain) UIActivityIndicatorView *activity;
+(UIExtensions *)sharedInstance;


+(void)createLableWithController:(UIViewController *)ctrl Tag:(NSInteger)tagValue Frame:(CGRect)frameValue;




@end


@interface UIButton  (Extensions)


-(void)makeCircular;
-(void)setButtonImage:(NSString *)imageName;
-(void)setButtonBackgroudImage:(NSString *)imageName;
-(void)setButtonTitle:(NSString *)title;
-(void)setAttributedButtonTitle:(NSAttributedString *)title;
-(void)setButtonTitleColor:(UIColor *)color;
-(void)setButtonBackgroundColor:(UIColor *)color;


@end


@interface UITextField  (Extensions)

- (void)setNumberKeybord;
- (void)setNumberKeybord:(UIViewController *)controller withLeftTitle:(NSString *)left andRightTitle:(NSString *)right;
- (void)setNumberKeybord:(UIViewController *)controller;
- (BOOL)isBlank;
- (void)setPadding;
- (void)changeTextAlignment;
- (void)setGrayBorder;
- (BOOL)isValidEmail;
- (void)setDarkGrayColor;
- (void)setPlaceHolderColor:(UIColor *)color;
-(void)setFont_hint_input_text;
-(void)setFont_input_text;

@end

@interface UILabel  (Extensions)

// These name conventions are based on Erika's HTML


-(void)changeTextAlignment;

-(void)setAttributedLabelHeightFit:(NSAttributedString *)string;
-(void)setAttributedLabelToWidthFit:(NSAttributedString *)string;

-(void)setLabelHeightFit:(NSString *)string;
-(void)setLabelToWidthFit:(NSString *)string;
-(float)getLabelHeightFit:(NSString *)string;
-(float)getLabelWidthFit:(NSString *)string;

-(void)setFontHelevetica:(float)size;
-(void)setFontHeleveticaBold:(float)size;
-(void)setFontHeleveticaNueue:(float)size;
-(void)setFontHeleveticaNueueBold:(float)size;
-(void)setFontHeleveticaNueueMedium:(float)size;

@end


 