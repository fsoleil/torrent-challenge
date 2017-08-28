//
//  DictionaryNode.m
//  Torrent parser
//
//  Created by Florian Soleil on 2017-08-27.
//  Copyright © 2017 Florian Soleil. All rights reserved.
//

#import "DictionaryNode.h"
#import "Parser.h"

@implementation DictionaryNode

- (instancetype)initWithContent:(NSString *)content fromIndex:(NSUInteger)index{
    
    self = [super init];
    if (self) {
        
        index ++;
        Parser *parser = [[Parser alloc] init];
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];

        self.startIndex = index;
        while (![[content substringWithRange:NSMakeRange(index, 1)] isEqualToString:@"e"]) {
            
            // get key
            Node *node = [parser parseContent:content fromIndex:index];
            NSString *key = [node getValue];
            
            // get value
            Node *nodeValue  = [parser parseContent:content fromIndex:node.endIndex];
            dictionary[key] = [nodeValue getValue];
            
            index = nodeValue.endIndex;
            
        }
        self.dictionary = dictionary;
        self.endIndex = index+1;
    }
    return self;
}

-(NSDictionary *)getValue{
    return self.dictionary;
}

@end
