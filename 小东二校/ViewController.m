//
//  ViewController.m
//  小东二校
//
//  Created by wharlim on 15/6/9.
//  Copyright (c) 2015年 wharlim. All rights reserved.
//

#import "ViewController.h"
#import "LampViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIStepper *denon_stepperChange;
@property (nonatomic,strong) UILabel *denon_labelValue;
@property (nonatomic,strong) UIProgressView *denon_progressValue;

@property (nonatomic,strong) UILabel *lamp_label_faceValue;
@property (nonatomic,strong) UILabel *lamp_label_earValue;
@property (nonatomic,strong) UISlider *lamp_uislider_faceChange;
@property (nonatomic,strong) UISlider *lamp_uislider_earChange;




@end

@implementation ViewController
@synthesize myTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startSpinner) name:@"startAnimation" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopSpinner) name:@"stopAnimation" object:nil];
    NSLog(@"home viewDidLoad");
 
}

-(void)commonInit{
//    _denon_stepperChange = [[UIStepper alloc] init];
//    _denon_labelValue = [[UILabel alloc] init];
//    _denon_progressValue = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];

    
    
    
}






-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.myTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startSpinner{
    NSLog(@"DVD page startAnimation");
  //  [self.spinner startAnimating];
    
}

-(void)stopSpinner{
    NSLog(@"DVD page stopAnimation");
   // [self.spinner stopAnimating];
    
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



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    float height = 44;
    switch (indexPath.section) {
        case 0:
            height = 44;
            break;
        case 1:
            if (indexPath.row == 0) {
                height = 44;
            }
            if (indexPath.row == 1) {
                height = 80;
            }
            break;
        case 2:
            if (indexPath.row == 0) {
                height = 80;
            }
            if (indexPath.row == 1) {
                height = 200;
            }
            if (indexPath.row == 2) {
                height = 200;
            }
            break;
        case 3:                 //lamp
            height = 80;
            break;
        case 4:
            height = 80;
            break;
 
            
    }
    return height;
    
}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)sectaaaaion{
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
             break;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    
    switch (indexPath.section) {
        case 0:
           // cellID = systemPow;
            break;
        case 1:
//            if (indexPath.row == 0) {
//                cellID = projPow;
//            }
//            if (indexPath.row == 1) {
//                cellID = screen;
//            }
            break;
        case 2:
//            if (indexPath.row == 0) {
//                cellID = sabine;
//            }
            if (indexPath.row == 1) {       //denon
               self.denon_stepperChange = (UIStepper *)[cell viewWithTag:141];
                self.denon_labelValue = (UILabel *)[cell viewWithTag:142];
                self.denon_progressValue = (UIProgressView *)[cell viewWithTag:143];
                [self.denon_stepperChange addTarget:self action:@selector(denonChangeVol:) forControlEvents:UIControlEventValueChanged];
               // UIStepper *stepper =
                
                
            }
//            if (indexPath.row == 2) {
//                cellID = DVD;
//            }
            break;
            
        case 3:     //lamp
//            self.lamp_label_faceValue = (UILabel *)[cell viewWithTag:151];
//            self.lamp_uislider_faceChange= (UISlider *)[cell viewWithTag:152];
//            [self.lamp_uislider_faceChange addTarget:self action:@selector(lamp_face_Change:) forControlEvents:UIControlEventValueChanged];
//            
//            self.lamp_label_earValue = (UILabel *)[cell viewWithTag:153];
//            self.lamp_uislider_earChange= (UISlider *)[cell viewWithTag:154];
//             [self.lamp_uislider_earChange addTarget:self action:@selector(lamp_ear_Change:) forControlEvents:UIControlEventValueChanged];
            
            
            break;
        case 4:
         //   cellID = window;
            break;
    }
    
    
    
    
    return cell;
    
    
    
    
    
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 3) {
        return indexPath;
    }else{
        return nil;
    }
   
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
      if (indexPath.section == 3 && indexPath.row == 0) {
          [self performSegueWithIdentifier:@"lamp" sender:nil];
          
//           LampViewController *lampVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"myLamp"];
//   
//          [self.navigationController pushViewController:lampVC  animated:YES];
//          
          
          
      }
}



//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//}


#pragma mark - action


- (IBAction)denonChangeVol:(UIStepper *)sender {
    int stepValue = sender.value;
    [self.denon_progressValue setProgress:(float)stepValue/100];
    self.denon_labelValue.text = [NSString stringWithFormat:@"%d",stepValue];
    
}

- (IBAction)lamp_face_Change:(UISlider *)sender {
//    int stepValue = sender.value;
//    [self.denon_progressValue setProgress:(float)stepValue/100];
//    self.denon_labelValue.text = [NSString stringWithFormat:@"%d",stepValue];
    
}












@end

