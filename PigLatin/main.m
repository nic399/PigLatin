//
//  main.m
//  PigLatin
//
//  Created by Nicholas Fung on 2017-10-05.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"
#import "general_defines.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSString *inputStr = @"this is a test of the pig latin string converter for the NSString class";
        NSString *pigStr = [inputStr stringByPigLatinization:inputStr];
        
        NSLog(@"Input String: %@", inputStr);
        NSLog(@"Pig String: %@", pigStr);
        
    }
    return 0;
}
