//
//  ViewController.m
//  Torrent parser
//
//  Created by Florian Soleil on 2017-08-27.
//  Copyright © 2017 Florian Soleil. All rights reserved.
//

#import "ViewController.h"
#import "Torrent.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (NSString*)filePathFromOpenDialog {
    NSOpenPanel* openDialog = [NSOpenPanel openPanel];
    openDialog.canChooseFiles = YES;
    openDialog.canChooseDirectories = NO;
    openDialog.allowsMultipleSelection = NO;
    openDialog.allowedFileTypes = @[@"torrent"];
    
    if ([openDialog runModal] == NSModalResponseOK) {
        
        // reset previous content
        [self clearContent];
        
        return (NSString*)[openDialog.URLs firstObject];
    }
    
    return nil;
}

- (void)clearContent{
    self.fileTextfield.stringValue  = @"";
    self.authorTextfield.stringValue  = @"";
    self.creationDateTextfield.stringValue  = @"";
    self.urlTextfield.stringValue  = @"";
    self.filesTextView.string  = @"";
}

- (IBAction)browseFile:(id)sender {
    
    NSString * torrentFilePath = [self filePathFromOpenDialog];
    NSError * error;
    NSString * fileContent = [NSString stringWithContentsOfFile:torrentFilePath encoding:NSASCIIStringEncoding error:&error];
    
    @try {
        
        Torrent *torrent = [[Torrent alloc] initWithContent:fileContent];
        
        // display content
        self.fileTextfield.stringValue  = torrentFilePath;
        if(torrent.author) self.authorTextfield.stringValue  = torrent.author;
        if(torrent.creationDate) self.creationDateTextfield.stringValue  = torrent.creationDateFormated;
        if(torrent.trackerURL) self.urlTextfield.stringValue  = torrent.trackerURL.absoluteString;
        
        for (TorrentFile * item in torrent.files) {
            NSAttributedString* file = [[NSAttributedString alloc] initWithString:item.description];
            [self.filesTextView.textStorage appendAttributedString:file];
            
            NSAttributedString* separator = [[NSAttributedString alloc] initWithString:@"\n--------------------------------\n"];
            [self.filesTextView.textStorage appendAttributedString:separator];
        }
        
    } @catch (NSException *exception) {
        
        [self clearContent];
        
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setInformativeText:@"Invalid torrent file"];
        [alert setMessageText:@"Error"];
        [alert addButtonWithTitle:@"Close"];
        [alert setAlertStyle:NSAlertStyleWarning];
        [alert runModal];
    }
 
}


@end
