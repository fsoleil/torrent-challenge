//
//  TorrentFile.m
//  Torrent parser
//
//  Created by Florian Soleil on 2017-08-27.
//  Copyright © 2017 Florian Soleil. All rights reserved.
//

#import "TorrentFile.h"

@implementation TorrentFile

-(NSString *)lengthFormated{
    
    NSString * length = self.length > 0 ? [NSString stringWithFormat:@"%.4f", self.length.doubleValue / 1000000] : @"unknow";
    return [NSString stringWithFormat:@"%@ MB", length];
}

-(NSString *)checksumFormated{
    NSString * checksum = self.checksum.length > 0 ? self.checksum : @"unknow";
    return checksum;
}

-(NSString *)description{
    
    return [NSString stringWithFormat:@"%@\nLenght : %@\nCheckSum : %@",self.name,self.lengthFormated,self.checksumFormated];
    
}

@end
