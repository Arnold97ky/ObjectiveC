//
//  ViewController.m
//  Fish
//
//  Created by Arnold Sylvestre on 8/9/22.
//

#import "ViewController.h"
#import "NetworkManager.h"
#import "FishModel.h"
#import "FishTableViewCell.h"
#import "DetailVc.h"
#import "Fish-Swift.h"

@interface ViewController ()

@property (nonatomic, weak) UITableView* table;

@property (nonatomic, strong) FishViewModel* DigimonVM;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    
    
    
    
    [self.DigimonVM bindWithUpdateHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.table reloadData];
        });
    }];
    [self.DigimonVM fetchDigimon];
    
    
}


-(void)setUp {
    
    //self.NasaInfos = [[NSMutableArray alloc] init];
    
    self.DigimonVM = [[FishViewModel alloc] initWithNetworkManager:[NetworkManager sharedInstance]];
    
    UITableView* table = [[UITableView alloc] initWithFrame:CGRectZero];
    [table setTranslatesAutoresizingMaskIntoConstraints:NO];
//    table.translatesAutoresizingMaskIntoConstraints = NO;
    [table setDataSource:self];
    [table setDelegate:self];
    //[table setPrefetchDataSource:self];
    [table registerClass:[FishTableViewCell self] forCellReuseIdentifier:@"CellId"];
    
    self.table = table;
    [self.view addSubview:table];
    
    // Constraints
    [[table.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:8] setActive:YES];
    [[table.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:8] setActive:YES];
    [[table.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-8] setActive:YES];
    [[table.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-8] setActive:YES];
    
    [table setBackgroundColor:[UIColor systemTealColor]];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.DigimonVM.count;
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    FishTableViewCell* cell = (FishTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    if (cell == nil) {
        return [[UITableViewCell alloc] init];
    }
    

    
    
    [cell.titleLabel setText:[self.DigimonVM titleFor:indexPath.row]];
    [cell.levelLabel setText:[self.DigimonVM LevelFor:indexPath.row]];
   
    
   [self.DigimonVM imageFor:indexPath.row completion:^(UIImage * _Nullable poster) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.posterView setImage:poster];
        });
    }];
    
    return cell;
}


- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailVc* vc = [[DetailVc alloc]
                    init];
    
   // [DetailVc.titleLabel setText:[self.DigimonVM titleFor:indexPath.row]];
    
    NSLog(@"Ok");
    UITableViewController *myTableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *tableViewNavigationController = [[UINavigationController alloc] initWithRootViewController:myTableViewController];
 

    
    
    
    
    }








@end
