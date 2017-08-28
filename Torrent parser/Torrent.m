//
//  Torrent.m
//  Torrent parser
//
//  Created by Florian Soleil on 2017-08-27.
//  Copyright © 2017 Florian Soleil. All rights reserved.
//

#import "Torrent.h"
#import "DictionaryNode.h"
#include <CommonCrypto/CommonDigest.h>

@implementation Torrent

- (instancetype)initWithContent:(NSString *)content {
    self = [super init];
    if (self) {
        
        DictionaryNode *dictionaryNode = [[DictionaryNode alloc] initWithContent:content fromIndex:0];
        [self parseDictionary:dictionaryNode.dictionary];
    }
    return self;
}

- (void)parseDictionary:(NSDictionary *)dictionary {
    
    // creation date
    NSNumber *creationDate = dictionary[@"creation date"];
    if (creationDate) {
        self.creationDate = [NSDate dateWithTimeIntervalSince1970:[creationDate integerValue]];
    }
    
    // author
    self.author = dictionary[@"created by"];
    
    // trackerURL
    NSString *announce = dictionary[@"announce"];
    if (announce) {
        self.trackerURL = [NSURL URLWithString:announce];
    }
    
    // info
    NSDictionary *info = dictionary[@"info"];
    
    if (info) {
        
        NSArray *files = info[@"files"];
        
        if (files) {
            
            NSMutableArray *results = [[NSMutableArray alloc] initWithCapacity:files.count];
            
            for (NSDictionary *fileDict in files) {
                
                TorrentFile *file = [[TorrentFile alloc] init];
                file.length = fileDict[@"length"];
                file.checksum = fileDict[@"md5sum"];
                
                NSArray *path = fileDict[@"path"];
                if (fileDict[@"path"]) {
                    file.name = path.lastObject;
                }
                [results addObject:file];
            }
            
            self.files = results;
            
        }else{
            
            TorrentFile *file = [[TorrentFile alloc] init];
            file.name = info[@"name"];
            file.length = info[@"length"];
            file.checksum = info[@"md5sum"];
            self.files = @[file];
        }
 
    }
}

-(NSString *)creationDateFormated{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    return [dateFormatter stringFromDate:self.creationDate];
}

@end
