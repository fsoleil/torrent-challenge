//
//  TorrentFile.h
//  Torrent parser
//
//  Created by Florian Soleil on 2017-08-27.
//  Copyright © 2017 Florian Soleil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TorrentFile : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *length;
@property (nonatomic, strong) NSString *checksum;
@end
