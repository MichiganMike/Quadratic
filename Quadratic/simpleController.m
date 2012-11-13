//
//  simpleController.m
//  Quadratic
//
//  Created by Billy Brown on 31/12/11.
//  Copyright (c) 2011 cyneWATCH. All rights reserved.
//

#import "simpleController.h"

@implementation simpleController
@synthesize aValue;
@synthesize bValue;
@synthesize cValue;
@synthesize rhoValue;
@synthesize root1;
@synthesize root2;
@synthesize sumValue;
@synthesize productValue;
@synthesize errorMessage;
@synthesize radioBtns;

- (IBAction)calculate:(id)sender {
  
  one = false;
  
  if ([radioBtns selectedColumn] == 1) {
    one = true;
  }
  
  if ([aValue.stringValue isEqualToString:@""] && one == false) {
    
    if ((![[NSScanner scannerWithString:bValue.stringValue] scanFloat:NULL] &&
         [cValue.stringValue isEqualToString:@""]) ||
        (![[NSScanner scannerWithString:cValue.stringValue] scanFloat:NULL] &&
         [bValue.stringValue isEqualToString:@""])) {
      
      error = @"Please enter numbers.";
      
    } else {
      
      a = aValue.floatValue;
      b = bValue.floatValue;
      c = cValue.floatValue;
      
      if (b == 0 && c == 0) {
        
        root1.stringValue = @"";
        
      } else if (b == 0) {
        
        root1.stringValue = @"impossible";
        
      } else if (c == 0) {
        
        root1.stringValue = @"0";
        
      } else {
        
        x1 = -c / b;
        root1.floatValue = x1;
        
      }
      
      root2.stringValue = @"";
      rhoValue.stringValue = @"";
      sumValue.stringValue = @"";
      productValue.stringValue = @"";

    }
      
  } else if (([[NSScanner scannerWithString:aValue.stringValue] scanFloat:NULL] &&
             ([[NSScanner scannerWithString:bValue.stringValue] scanFloat:NULL] ||
              [bValue.stringValue isEqualToString:@""]) && 
             ([[NSScanner scannerWithString:cValue.stringValue] scanFloat:NULL] ||
              [cValue.stringValue isEqualToString:@""])) ||
             ([aValue.stringValue isEqualToString:@""] && one == true)) {
    
    if ([aValue.stringValue isEqualToString:@""]) {
      a = 1;
    } else {
      a = aValue.floatValue;
    }
    
    b = bValue.floatValue;
    c = cValue.floatValue;
    
    if ([bValue.stringValue isEqualToString:@""]) {
      if (one == false) {
        b = 0;
      } else {
        b = 1;
      }
    }
    
    if ([cValue.stringValue isEqualToString:@""]) {
      c = 0;
    }
    
    rho = (b * b) - (4 * a * c);
    rhoValue.floatValue = rho;
    
    if (rho >= 0) {
      
      x1 = (-b + sqrt(rho)) / (2 * a);
      x2 = (-b - sqrt(rho)) / (2 * a);
      root1.floatValue = x1;
      root2.floatValue = x2;
      sum = x1 + x2;
      product = x1 * x2;
      sumValue.floatValue = sum;
      productValue.floatValue = product;
      error = @"";
      
    } else {
      
      error = @"No roots.";
      root1.stringValue = @"";
      root2.stringValue = @"";
      sumValue.stringValue = @"";
      productValue.stringValue = @"";
      
    }
    
  } else { // What happens if letters were entered
      
     error = @"Please enter numbers.";
      
  }
  
  errorMessage.stringValue = error;
  
}

- (IBAction)clear:(id)sender { // Reseting EVERYTHING
  
  aValue.stringValue = @"";
  bValue.stringValue = @"";
  cValue.stringValue = @"";
  rhoValue.stringValue = @"";
  root1.stringValue = @"";
  root2.stringValue = @"";
  sumValue.stringValue = @"";
  productValue.stringValue = @"";
  errorMessage.stringValue = @"";
  [aValue selectText:self];
  
}

@end
