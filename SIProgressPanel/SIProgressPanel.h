//
//  SIProgressPanel.h
//  SIProgressPanel
//
//  Created by Andreas Zöllner on 08.03.15.
//  Copyright (c) 2015 Studio Istanbul Medya Hiz. Tic. Ltd. Sti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UKNibOwner.h"

@class SIProgressPanel;

@protocol SIProgressPanelDelegate

-(void)progressPanelCanceledTask:(SIProgressPanel*)panel;

@end

@interface SIProgressPanel : UKNibOwner

@property (strong) IBOutlet NSPanel* progressPanel;
@property (strong) IBOutlet NSProgressIndicator* progressBar;
@property (strong) IBOutlet NSTextField* panelLabel;
@property (strong) IBOutlet NSButton* cancelButton;

@property (strong, nonatomic) NSString* title;
@property (strong) id<SIProgressPanelDelegate> delegate;
@property (assign, nonatomic) double doubleValue;

-(void)showProgressPanelInWindow:(NSWindow*)window;
-(IBAction)pressCancel:(id)sender;

@end
