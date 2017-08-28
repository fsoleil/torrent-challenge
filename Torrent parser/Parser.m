//
//  Parser.m
//  Torrent parser
//
//  Created by Florian Soleil on 2017-08-27.
//  Copyright © 2017 Florian Soleil. All rights reserved.
//

#import "Parser.h"

@implementation Parser

- (Node *)parseContent:(NSString *)content fromIndex:(NSUInteger)index {
    
    NodeType nodeType = [self getNodeTypeWithContent:content fromIndex:index];
    return [[Node alloc] initWithContent:content fromIndex:index type:nodeType];
}


-(NodeType)getNodeTypeWithContent:(NSString *)content fromIndex:(NSUInteger)index {
    
    NSString *contentType = [content substringWithRange:NSMakeRange(index, 1)];
    
    if ([contentType isEqualToString:@"l"]) {
        return Array;
    } else if ([contentType isEqualToString:@"d"]) {
        return Dictionary;
    } else if ([contentType isEqualToString:@"i"]) {
        return Integer;
    } else if( [[NSScanner scannerWithString:contentType] scanFloat:NULL] ){
        return String;
    }
    
    [NSException raise:NSInvalidArgumentException format:@"Invalid node type"];
    return 0;
    
}

@end
