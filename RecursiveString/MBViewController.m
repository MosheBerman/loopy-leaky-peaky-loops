//
//  MBViewController.m
//  RecursiveString
//
//  Created by Moshe Berman on 8/7/12.
//  Copyright (c) 2012 Moshe Berman. All rights reserved.
//

#import "MBViewController.h"

@interface MBViewController ()

@end

@implementation MBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //
    //  Uncomment one of these four lines and then Commind+I to profile with Allocations
    //
    
 
    [self loopStringNoAutorelease];
//    [self loopMutableNoAutorelease];
//    [self loopStringWithAutorelease];
//    [self loopMutableWithAutorelease];
    
}

- (void) loopStringNoAutorelease{
    
    NSString *text;
    
    for (NSInteger i = 0; i < 600000000; i++) {
        
        NSString *newText = [text stringByAppendingString:@" Hello"];
        
        if (text) {
            text = newText;
        }else{
            text = @"";
        }
    }
}

- (void) loopStringWithAutorelease{
    
    NSString *text;
    
    for (NSInteger i = 0; i < 600000000; i++) {
        
        @autoreleasepool {
            NSString *newText = [text stringByAppendingString:@" Hello"];
            
            if (text) {
                text = newText;
            }else{
                text = @"";
            }
        }
    }
}

- (void) loopMutableNoAutorelease{
    
    NSMutableString *text;
    
    for (NSInteger i = 0; i < 600000000; i++) {
        
        if (text) {
            [text appendString:@" Hello"];
        }else{
            text = [@"" mutableCopy];
        }
    }
    
}

- (void) loopMutableWithAutorelease{
    
    NSMutableString *text;
    
    for (NSInteger i = 0; i < 600000000; i++) {
        @autoreleasepool {
            
            if (text) {
                [text appendString:@" Hello"];
            }else{
                text = [@"" mutableCopy];
            }
        }
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
