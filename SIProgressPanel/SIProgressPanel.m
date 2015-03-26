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
        doubleValue = 0;
    }
    return self;
}

-(void)showProgressPanelInWindow:(NSWindow *)window {
    if (!window.attachedSheet && progressPanel && window) {
        [progressPanel setFrame:NSMakeRect(0, 0, window.frame.size.width * 0.95, progressPanel.frame.size.height) display:YES];
        [[NSApplication sharedApplication] beginSheet:progressPanel modalForWindow:window modalDelegate:self didEndSelector:nil contextInfo:nil];
    } else {
        NSLog(@"can't attach SIProgressPanel %@ to window %@.", progressPanel, window);
    }
}

-(void)setDoubleValue:(double)xdoubleValue {
    doubleValue = xdoubleValue;
    if (xdoubleValue >= 1) {
        [[NSApplication sharedApplication] stopModal];
        [self.progressPanel orderOut:self];
        [[NSApplication sharedApplication] endSheet:progressPanel];
    }
    if (xdoubleValue < 0) {
        [progressBar setIndeterminate:YES];
        [progressBar startAnimation:self];
    } else {
        progressBar.maxValue = 1;
        progressBar.doubleValue = xdoubleValue;
        [progressBar setIndeterminate:NO];
    }
}

-(void)setTitle:(NSString *)xtitle {
    panelLabel.stringValue = xtitle;
    title = xtitle;
}

-(IBAction)pressCancel:(id)sender {
    [[NSApplication sharedApplication] stopModal];
    [self.progressPanel orderOut:self];
    [[NSApplication sharedApplication] endSheet:progressPanel];
    [self.delegate progressPanelCanceledTask:self];
}

@end
