//
//  IntegerNode.m
//  Torrent parser
//
//  Created by Florian Soleil on 2017-08-27.
//  Copyright © 2017 Florian Soleil. All rights reserved.
//

#import "IntegerNode.h"

@implementation IntegerNode

- (instancetype)initWithContent:(NSString *)content fromIndex:(NSUInteger)index{
    
    self = [super init];
    if (self) {
        
        index ++;
        NSInteger endIndex  = [content rangeOfString:@"e" options:0 range:NSMakeRange(index, content.length - index)].location;
        NSInteger integer = [[content substringWithRange:NSMakeRange(index, endIndex - index)] integerValue];
        
        self.integer = [NSNumber numberWithInteger:integer];
        self.startIndex = index;
        self.endIndex = endIndex+1;
    }
    
    return self;
}

-(NSNumber *)getValue{
    return self.integer;
}

@end
