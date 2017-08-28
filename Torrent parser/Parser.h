//
//  Parser.h
//  Torrent parser
//
//  Created by Florian Soleil on 2017-08-27.
//  Copyright © 2017 Florian Soleil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface Parser : NSObject

- (Node *)parseContent:(NSString *)content fromIndex:(NSUInteger)index;

@end
