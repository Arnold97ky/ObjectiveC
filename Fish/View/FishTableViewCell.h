//
//  FishTableViewCell.h
//  Fish
//
//  Created by Arnold Sylvestre on 8/9/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FishTableViewCell : UITableViewCell

@property (nonatomic, weak) UIImageView* posterView;
@property (nonatomic, weak) UILabel* titleLabel;
@property (nonatomic, weak) UILabel* levelLabel;




@end

NS_ASSUME_NONNULL_END
