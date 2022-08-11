//
//  FishTableViewCell.m
//  Fish
//
//  Created by Arnold Sylvestre on 8/9/22.
//

#import "FishTableViewCell.h"

@implementation FishTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
    }
    return self;
    
}


-(void)setUp {
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [imageView setImage:[UIImage imageNamed:@"image"]];
    
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setText:@" Title"];
    [label setBackgroundColor:[UIColor systemTealColor]];
    
    
    UILabel* Label = [[UILabel alloc] initWithFrame:CGRectZero];
    [Label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [Label setText:@" Level"];
   // [Label setBackgroundColor:[UIColor systemTealColor]];
    
    UILabel* level = [[UILabel alloc] initWithFrame:CGRectZero];
    [level setTranslatesAutoresizingMaskIntoConstraints:NO];
    [level setNumberOfLines:0];
    [level setText:@" Level:"];
    [level setBackgroundColor:[UIColor systemRedColor]];
    
    
    
    self.posterView = imageView;
    self.titleLabel = label;
    self.levelLabel = Label;
    
    [self.contentView addSubview:imageView];
    [self.contentView addSubview:label];
    [self.contentView addSubview:Label];
    [self.contentView addSubview:level];
    
    [[imageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8] setActive:YES];
    [[imageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:8] setActive:YES];
    [[imageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-8] setActive:YES];
    
    [[imageView.heightAnchor constraintEqualToConstant:150] setActive:YES];
    [[imageView.widthAnchor constraintEqualToConstant:150] setActive:YES];
    
    [[label.leadingAnchor constraintEqualToAnchor:imageView.trailingAnchor constant:8] setActive:YES];
    [[label.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8] setActive:YES];
    [[label.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor] setActive:YES];
    
    [[Label.leadingAnchor constraintEqualToAnchor:imageView.trailingAnchor constant:5] setActive:YES];
    [[Label.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-5] setActive:YES];
    [[Label.centerYAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-25] setActive:YES];
    
    [[level.leadingAnchor constraintEqualToAnchor:imageView.trailingAnchor constant:5] setActive:YES];
    [[level.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-5] setActive:YES];
    [[level.centerYAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-45] setActive:YES];
    
}
@end
