//
//  ViewController.h
//  Torrent parser
//
//  Created by Florian Soleil on 2017-08-27.
//  Copyright © 2017 Florian Soleil. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextField *fileTextfield;
@property (weak) IBOutlet NSTextField *creationDateTextfield;
@property (weak) IBOutlet NSTextField *authorTextfield;
@property (weak) IBOutlet NSTextField *urlTextfield;
@property (unsafe_unretained) IBOutlet NSTextView *filesTextView;

@end

