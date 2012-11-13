//
//  simpleController.h
//  Quadratic
//
//  Created by Billy Brown on 31/12/11.
//  Copyright (c) 2011 cyneWATCH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface simpleController : NSObject {
  BOOL one;
  float a;
  float b;
  float c;
  float rho;
  float x1;
  float x2;
  float sum;
  float product;
  NSString *error;
}

@property (unsafe_unretained) IBOutlet NSTextField *aValue;
@property (unsafe_unretained) IBOutlet NSTextField *bValue;
@property (unsafe_unretained) IBOutlet NSTextField *cValue;
@property (unsafe_unretained) IBOutlet NSTextField *rhoValue;
@property (unsafe_unretained) IBOutlet NSTextField *root1;
@property (unsafe_unretained) IBOutlet NSTextField *root2;
@property (unsafe_unretained) IBOutlet NSTextField *sumValue;
@property (unsafe_unretained) IBOutlet NSTextField *productValue;
@property (unsafe_unretained) IBOutlet NSTextField *errorMessage;
@property (unsafe_unretained) IBOutlet NSMatrix *radioBtns;

- (IBAction)calculate:(id)sender;
- (IBAction)clear:(id)sender;

@end
