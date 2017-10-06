//
//  NSString+PigLatin.m
//  PigLatin
//
//  Created by Nicholas Fung on 2017-10-05.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

-(NSString *)stringByPigLatinization:(NSString *)string{
    
    NSMutableCharacterSet *removeSet = [NSMutableCharacterSet alphanumericCharacterSet];
    [removeSet invert]; //contains all nonalphanumeric characters
    [removeSet addCharactersInString:@"1234567890"];//contains all nonalpha characters
    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiou"];
    
    NSArray<NSString *> *stringArr = [string componentsSeparatedByCharactersInSet:removeSet];
    
    NSString *firstPart = nil, *remainingPart = nil;
    BOOL reachedConsonant = false;
    NSMutableArray<NSString *> *returnArr = [[NSMutableArray alloc] init];
    
    for (NSString *thisStr in stringArr) {
        
        for (int i = 0; i < [stringArr count]; i++) {
            char nextChar = [thisStr characterAtIndex:i];
            
            //  next char is a vowel and we have not reached a consonant yet, move on
            if ([vowelSet characterIsMember:nextChar] && !reachedConsonant) {
                continue;
            }
            // next char is a consonant, then set reachedConsonant so we know to stop upon reaching the next vowel
            else if (![vowelSet characterIsMember:nextChar]) {
                reachedConsonant = true;
                continue;
            }
            // we already have some consonants, so reaching a vowel means we are done getting the first consonant block
            else if ([vowelSet characterIsMember:nextChar]) {
                firstPart = [thisStr substringToIndex:i];
                remainingPart = [thisStr substringFromIndex:i];
                break;
            }
        }
        
        if (firstPart==nil || remainingPart == nil) {
            [returnArr addObject:[thisStr stringByAppendingString:@"ay"]];
        }
        else {
            NSString *pigLatinStr = [[remainingPart stringByAppendingString:firstPart] stringByAppendingString:@"ay"];
            [returnArr addObject:pigLatinStr];
        }
        firstPart = nil;
        remainingPart = nil;
    }
    NSString *returnStr = [returnArr componentsJoinedByString:@" "];
    return returnStr;
}

@end
