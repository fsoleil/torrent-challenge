//
//  Item.m
//  Torrent parser
//
//  Created by Florian Soleil on 2017-08-27.
//  Copyright © 2017 Florian Soleil. All rights reserved.
//

#import "Node.h"
#import "StringNode.h"
#import "IntegerNode.h"
#import "ArrayNode.h"
#import "DictionaryNode.h"

@implementation Node

- (instancetype)initWithContent:(NSString *)content fromIndex:(NSUInteger)index type:(NodeType)nodeType{
   
    self = nil;
    if (nodeType == String){
        self = [[StringNode alloc] initWithContent:content fromIndex:index];
    }
    else if (nodeType == Integer){
        self = [[IntegerNode alloc] initWithContent:content fromIndex:index];
    }
    else if (nodeType == Array){
        self = [[ArrayNode alloc] initWithContent:content fromIndex:index];
    }
    else if (nodeType == Dictionary){
        self = [[DictionaryNode alloc] initWithContent:content fromIndex:index];
    }
    return self;
}


- (instancetype)initWithContent:(NSString *)content fromIndex:(NSUInteger)index{
    
    [NSException raise:NSInternalInconsistencyException
                format:@"You have not implemented %@ in %@", NSStringFromSelector(_cmd), NSStringFromClass([self class])];
    return nil;
}

- (id)getValue{
    
    [NSException raise:NSInternalInconsistencyException
                format:@"You have not implemented %@ in %@", NSStringFromSelector(_cmd), NSStringFromClass([self class])];
    return nil;
}




@end
