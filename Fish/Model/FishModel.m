//
//  FishModel.m
//  Fish
//
//  Created by Arnold Sylvestre on 8/9/22.
//

#import "FishModel.h"

@implementation FishModel

-(instancetype)initWithJsonDictionary:(NSDictionary *)dictionary {
    self = [super self];
    if (self) {
        
        self.name = [dictionary valueForKey:@"name"];
        self.level = [dictionary valueForKey:@"level"];
        self.img = [dictionary valueForKey:@"img"];
        
    }
    
    return self;
}

@end


