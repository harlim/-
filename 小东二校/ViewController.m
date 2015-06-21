//
//  ViewController.m
//  小东二校
//
//  Created by wharlim on 15/6/9.
//  Copyright (c) 2015年 wharlim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title = nil;
    switch (section) {
        case 0:
            title = @"系统电源";
            break;
        case 1:
            title = @"投影";
            break;
        case 2:
            title = @"音视频";
            break;
        case 3:
            title = @"灯光";
            break;
        case 4:
            title = @"窗帘";
            break;
    }
    
    return title;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    switch (section) {
        case 0:
            return 1;
        case 1:
            return 2;
        case 2:
            return 3;
        case 3:
            return 1;
        case 4:
            return 1;
        default:
            return 0;
            
    }
    
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    float height = 44;
    switch (indexPath.section) {
        case 0:
            height = 44;
            break;
        case 1:
            if (indexPath.row == 0) {
                height = 80;
            }
            if (indexPath.row == 1) {
                height = 100;
            }
            break;
        case 2:
            if (indexPath.row == 0) {
                height = 80;
            }
            if (indexPath.row == 1) {
                height = 60;
            }
            if (indexPath.row == 2) {
                height = 200;
            }
            break;
        case 3:
            height = 100;
            break;
        case 4:
            height = 100;
            break;
          
            
            
            
    }
    return height;
    
}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    
//    
//    
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *systemPow = @"SystemPower";
    static NSString *projPow = @"Proj";
    static NSString *screen = @"Screen";
     static NSString *sabine = @"Sabine";
    static NSString *denon = @"Denon";
    static NSString *DVD = @"DVD";
    static NSString *lamp = @"Lamp";
    static NSString *window = @"Window";
  
    
    NSString *cellID = nil;
    
    switch (indexPath.section) {
        case 0:
            cellID = systemPow;
            break;
        case 1:
            if (indexPath.row == 0) {
                cellID = projPow;
            }
            if (indexPath.row == 1) {
                cellID = screen;
            }
            break;
        case 2:
            if (indexPath.row == 0) {
                cellID = sabine;
            }
            if (indexPath.row == 1) {
                cellID = denon;
            }
            if (indexPath.row == 2) {
                cellID = DVD;
            }
            break;
            
        case 3:
            cellID = lamp;
            break;
        case 4:
            cellID = window;
            
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    return cell;
    
    
    
    
    
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}



//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//}





@end

