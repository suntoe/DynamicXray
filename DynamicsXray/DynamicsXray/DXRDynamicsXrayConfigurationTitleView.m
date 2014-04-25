//
//  DXRDynamicsXrayConfigurationTitleView.m
//  DynamicsXray
//
//  Created by Chris Miles on 5/03/2014.
//  Copyright (c) 2014 Chris Miles. All rights reserved.
//

#import "DXRDynamicsXrayConfigurationTitleView.h"
#import "DXRAssetBytesLogo.png.h"
#import "DXRAssetBytesLogo@2x.png.h"
#import "DynamicsXray.h"


@implementation DXRDynamicsXrayConfigurationTitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *logoView = [self logoView];
        logoView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:logoView];

        UIView *labelsView = [self labelsView];
        labelsView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:labelsView];

        // Constraints
        NSDictionary *layoutViews = NSDictionaryOfVariableBindings(logoView, labelsView);

        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[logoView]-(5)-[labelsView]|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:layoutViews]];

        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=0)-[logoView]-(>=0)-|" options:0 metrics:nil views:layoutViews]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=0)-[labelsView]-(>=0)-|" options:0 metrics:nil views:layoutViews]];
    }
    return self;
}

- (UIImageView *)logoView
{
    UIScreen *screen = (self.window.screen ?: [UIScreen mainScreen]);
    CGFloat scale = screen.scale;

    unsigned char *imageBytes = (scale >= 2.0 ? DXRAssetBytesLogo2xPNG : DXRAssetBytesLogoPNG);
    unsigned long imageBytesCount = (scale >= 2.0 ? DXRAssetBytesLogo2xPNG_size : DXRAssetBytesLogoPNG_size);
    NSData *logoData = [NSData dataWithBytesNoCopy:imageBytes length:imageBytesCount];
    UIImage *logoImage = [UIImage imageWithData:logoData scale:scale];

    UIImageView *logoView = [[UIImageView alloc] initWithImage:logoImage];
    return logoView;
}

- (UIView *)labelsView
{
    UIView *labelsView = [[UIView alloc] initWithFrame:CGRectZero];

    UILabel *titleLabel = [self titleLabel];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [labelsView addSubview:titleLabel];

    UILabel *byLabel = [self byLabel];
    byLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [labelsView addSubview:byLabel];

    // Constraints
    NSDictionary *layoutViews = NSDictionaryOfVariableBindings(titleLabel, byLabel);

    [labelsView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[titleLabel]-(>=0)-|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:layoutViews]];
    [labelsView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[byLabel]-(>=0)-|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:layoutViews]];

    [labelsView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[titleLabel][byLabel]|" options:0 metrics:nil views:layoutViews]];

    return labelsView;
}

- (UILabel *)titleLabel
{
    NSString *title = [NSString stringWithFormat:@"DynamicsXray %@", DynamicsXrayVersion];

    UIFont *titleFont = [UIFont fontWithName:@"Avenir Next Condensed Demi Bold" size:13.0f];
    UIFont *versionFont = [UIFont fontWithName:@"Avenir Next Condensed" size:13.0f];

    NSDictionary *textAttributes = @{NSFontAttributeName : titleFont};

    NSMutableAttributedString *attributedTitled = [[NSMutableAttributedString alloc] initWithString:title attributes:textAttributes];

    NSDictionary *versionAttributes = @{NSFontAttributeName : versionFont};
    NSUInteger versionLength = [DynamicsXrayVersion length];
    NSRange versionRange = NSMakeRange([title length] - versionLength, versionLength);
    [attributedTitled setAttributes:versionAttributes range:versionRange];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.textColor = [UIColor colorWithWhite:1.0f alpha:0.6f];
    label.attributedText = attributedTitled;

    return label;
}

- (UILabel *)byLabel
{
    NSString *byLine = @"by Chris Miles";

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = byLine;
    label.font = [UIFont fontWithName:@"Avenir Next Condensed" size:10.0f];
    label.textColor = [UIColor colorWithWhite:1.0f alpha:0.4f];

    return label;
}

@end
