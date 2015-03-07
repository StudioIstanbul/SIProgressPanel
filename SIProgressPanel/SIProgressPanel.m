//
//  SIProgressPanel.m
//  SIProgressPanel
//
//  Created by Andreas Zöllner on 08.03.15.
//  Copyright (c) 2015 Studio Istanbul Medya Hiz. Tic. Ltd. Sti. All rights reserved.
//

#import "SIProgressPanel.h"

@implementation SIProgressPanel

@synthesize panelLabel, progressBar, title, progressPanel, cancelButton, delegate, doubleValue;

-(id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)showProgressPanelInWindow:(NSWindow *)window {
    if (!window.attachedSheet && progressPanel && window) {
        [[NSApplication sharedApplication] beginSheet:progressPanel modalForWindow:window modalDelegate:self didEndSelector:nil contextInfo:nil];
    } else {
        NSLog(@"can't attach SIProgressPanel %@ to window %@.", progressPanel, window);
    }
}

@end
