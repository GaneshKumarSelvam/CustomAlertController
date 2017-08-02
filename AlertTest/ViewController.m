//
//  ViewController.m
//  AlertTest
//
//  Created by Tarun Sharma on 31/07/17.
//  Copyright © 2017 Chetaru Web LInk Private Limited. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray * dataArray;
}
@property (nonatomic,strong) UITableView *tableView;
@property(strong,nonatomic) NSMutableArray *titleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     dataArray=[[NSMutableArray alloc]initWithObjects:@"Long Term",@"Short Term", nil];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    //self.tableView  = [[UITableView alloc]init];
    
    
    //self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    NSLog(@"Data is %@",[dataArray objectAtIndex:indexPath.row]);
    cell.textLabel.text=[dataArray objectAtIndex:indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        //[self.selectedKeyStagesArray addObject:[[self.keyStagesArray objectAtIndex:indexPath.row]objectForKey:@"subject_id"]];
        
       // NSLog(@"Select Array %@",self.selectedKeyStagesArray);
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        //[self.selectedKeyStagesArray removeObject:[[self.keyStagesArray objectAtIndex:indexPath.row]objectForKey:@"subject_id"]];
        
        //NSLog(@"Select Array After Delete %@",self.selectedKeyStagesArray);
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)buttonClick:(id)sender {
    
    UIViewController *controller = [[UIViewController alloc]init];
   
    CGRect rect;
    
        rect = CGRectMake(0, 0, 272, 100);
        [controller setPreferredContentSize:rect.size];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setAllowsMultipleSelection:YES];
    
    
    [controller.view addSubview:self.tableView];
    [controller.view bringSubviewToFront:self.tableView];
    [controller.view setUserInteractionEnabled:YES];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    [alertController setValue:controller forKey:@"contentViewController"];
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
    }];
     [alertController addAction:doneAction];
    [alertController addAction:cancelAction];
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self presentViewController:alertController animated:YES completion:^{
           // [self.tableView reloadData];
        }];
    });
    
  
        
   
    
    
   
}
@end
