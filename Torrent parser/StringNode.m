//
//  StringNode.m
//  Torrent parser
//
//  Created by Florian Soleil on 2017-08-27.
//  Copyright © 2017 Florian Soleil. All rights reserved.
//

#import "StringNode.h"

@implementation StringNode

- (instancetype)initWithContent:(NSString *)content fromIndex:(NSUInteger)index{
    
    self = [super init];
    if (self) {
        
        NSUInteger startIndex = [content rangeOfString:@":" options:0 range:NSMakeRange(index, content.length - index)].location;
        NSInteger length = [[content substringWithRange:NSMakeRange(index, startIndex - index)] integerValue];
        
        NSUInteger stringIndex = startIndex + 1;
        NSString *string = [content substringWithRange:NSMakeRange(stringIndex, length)];
        
        self.string = string;
        self.startIndex = stringIndex;
        self.endIndex = string.length + stringIndex;
    }
    return self;
}

-(NSString *)getValue{
    return self.string;
}

@end
