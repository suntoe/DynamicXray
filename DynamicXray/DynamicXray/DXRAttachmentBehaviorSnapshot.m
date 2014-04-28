//
//  DXRAttachmentBehaviorSnapshot.m
//  DynamicXray
//
//  Created by Chris Miles on 4/08/13.
//  Copyright (c) 2013-2014 Chris Miles. All rights reserved.
//

#import "DXRAttachmentBehaviorSnapshot.h"

@implementation DXRAttachmentBehaviorSnapshot

- (id)initWithAnchorPoint:(CGPoint)anchorPoint attachmentPoint:(CGPoint)attachmentPoint length:(CGFloat)length isSpring:(BOOL)isSpring
{
    self = [super init];
    if (self) {
        _anchorPoint = anchorPoint;
        _attachmentPoint = attachmentPoint;
        _isSpring = isSpring;
        _length = length;
    }
    return self;
}

@end
