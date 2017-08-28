//
//  Torrent.h
//  Torrent parser
//
//  Created by Florian Soleil on 2017-08-27.
//  Copyright © 2017 Florian Soleil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TorrentFile.h"

@interface Torrent : NSObject

@property (nonatomic, retain) NSDate *creationDate;
@property (nonatomic, retain) NSString *author;
@property (nonatomic, retain) NSURL *trackerURL;
@property (nonatomic, retain) NSArray<TorrentFile *> *files;

- (instancetype)initWithContent:(NSString *)content;
- (NSString *)creationDateFormated;
@end

