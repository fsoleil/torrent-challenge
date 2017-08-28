//
//  Item.h
//  Torrent parser
//
//  Created by Florian Soleil on 2017-08-27.
//  Copyright © 2017 Florian Soleil. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NodeType) {
    String=1,
    Integer,
    Array,
    Dictionary
};

@protocol NodeProtocol
@required
- (instancetype)initWithContent:(NSString *)content fromIndex:(NSUInteger)index;
- (id)getValue;
@end


@interface Node : NSObject <NodeProtocol>

@property (nonatomic, assign) NSInteger startIndex;
@property (nonatomic, assign) NSInteger endIndex;

- (instancetype)initWithContent:(NSString *)content fromIndex:(NSUInteger)index type:(NodeType)nodeType;

@end
