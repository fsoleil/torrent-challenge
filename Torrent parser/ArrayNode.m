//
//  ArrayNode.m
//  Torrent parser
//
//  Created by Florian Soleil on 2017-08-27.
//  Copyright © 2017 Florian Soleil. All rights reserved.
//

#import "ArrayNode.h"
#import "Parser.h"

@implementation ArrayNode

- (instancetype)initWithContent:(NSString *)content fromIndex:(NSUInteger)index{
    
    self = [super init];
    if (self) {
        
        index ++;
        
        Parser *parser = [[Parser alloc] init];
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        self.startIndex = index;
        while (![[content substringWithRange:NSMakeRange(index, 1)] isEqualToString:@"e"]) {
            
            // add value
            Node *node = [parser parseContent:content fromIndex:index];
            [array addObject:[node getValue]];
            index = node.endIndex;
        }
        self.array = array;
        self.endIndex = index+1;
    }
    return self;
}

-(NSArray *)getValue{
    return self.array;
}

@end
