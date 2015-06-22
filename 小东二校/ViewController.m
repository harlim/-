//
//  ViewController.m
//  小东二校
//
//  Created by wharlim on 15/6/9.
//  Copyright (c) 2015年 wharlim. All rights reserved.
//

#import "ViewController.h"
#import "LampViewController.h"

@interface ViewController (){
    UILongPressGestureRecognizer *longPress;
}

@property (nonatomic,strong) UISwitch *system_power;
@property (nonatomic,strong) UIButton *system_power_on;
@property (nonatomic,strong) UIButton *system_power_off;

@property (nonatomic,strong) UISwitch *proj_power;
@property (nonatomic,strong) UIButton *proj_screen;




//@property (nonatomic,strong) UIStepper *denon_stepperChange;
@property (nonatomic,strong) UILabel *denon_labelValue;
//@property (nonatomic,strong) UIProgressView *denon_progressValue;
@property (nonatomic,strong) UISlider *denon_slider_vol;

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
    
//    UILongPressGestureRecognizer *
    longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(system_power_shutdown:)];
    longPress.minimumPressDuration = 3; //定义按的时间
    
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
    return 6;
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
            title = @"窗";
            break;
        case 5:
            title = @"门";
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
        case 5:
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
                height = 120;
            }
            if (indexPath.row == 2) {
                height = 200;
            }
            break;
        case 3:                 //lamp
            height = 60;
            break;
        case 4:
            height = 80;
            break;
        case 5:
            height = 120;
            break;
            
    }
    return height;
    
}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)sectaaaaion{
//    
//    
//    
//}
- (void)_show
{
    NSLog(@"touch up inside");
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *systemPow = @"SystemPower";
    static NSString *projPow = @"Proj";
    static NSString *screen = @"Screen";
     static NSString *sabine = @"Sabine";
    static NSString *denon = @"Denon";
    static NSString *DVD = @"DVD";
    static NSString *lamp = @"Lamp";
    static NSString *window = @"Window";
    static NSString *door = @"Door";
    
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
        case 5:
            cellID = door;
            break;
            
            
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    
    switch (indexPath.section) {
        case 0:
        {


            [(UIButton *)[cell viewWithTag:101] addGestureRecognizer:longPress];
            [(UIButton *)[cell viewWithTag:101] addTarget:self action:@selector(_show) forControlEvents:UIControlEventTouchUpInside];
            
            [(UIButton *)[cell viewWithTag:100] addTarget:self action:@selector(system_power_poweron:) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
        case 1:
        {
            if (indexPath.row == 0) {
                [(UISwitch *)[cell viewWithTag:111] addTarget:self action:@selector(proj_power_change:) forControlEvents:UIControlEventValueChanged];
            }
            if (indexPath.row == 1) {
                
                for (UIView *btn in cell.contentView.subviews) {
                  //  NSLog(@"--------");
                    if ([btn isKindOfClass:[UIButton class]]) {
                           [(UIButton *)btn addTarget:self action:@selector(proj_screen_UpAndDown:) forControlEvents:UIControlEventTouchUpInside];
                    }
                    
                    
                }
                
            }

            
        }
            break;
        case 2:
        {
            if (indexPath.row == 0) {       //sabine
                [(UISegmentedControl *)[cell viewWithTag:131] addTarget:self action:@selector(sabine_volChange:) forControlEvents:UIControlEventValueChanged];
            }
            
            if (indexPath.row == 1) {       //denon
              self.denon_slider_vol = (UISlider *)[cell viewWithTag:141];
                self.denon_labelValue = (UILabel *)[cell viewWithTag:142];
                [self.denon_slider_vol addTarget:self action:@selector(denonChangeVol:) forControlEvents:UIControlEventValueChanged];
                
            //denon mode
            [(UISegmentedControl *)[cell viewWithTag:144] addTarget:self action:@selector   (denon_mode_change:) forControlEvents:UIControlEventValueChanged];
            }

            if (indexPath.row == 2) {   //DVD

                for (UIView *btn in cell.contentView.subviews) {
                   // NSLog(@"--------");
                    if ([btn isKindOfClass:[UIButton class]]) {
                        [(UIButton *)btn addTarget:self action:@selector(DVD_button:) forControlEvents:UIControlEventTouchUpInside];
                    }
                    
                    
                }
                
                
                
            }
    
            
        }
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
            for (UIView *btn in cell.contentView.subviews) {
                // NSLog(@"--------");
                if ([btn isKindOfClass:[UIButton class]]) {
                    [(UIButton *)btn addTarget:self action:@selector(window_button:) forControlEvents:UIControlEventTouchUpInside];
                }
            }
            break;
            
        case 5:
            for (UIView *btn in cell.contentView.subviews) {
                // NSLog(@"--------");
                if ([btn isKindOfClass:[UIButton class]]) {
                    [(UIButton *)btn addTarget:self action:@selector(door_button:) forControlEvents:UIControlEventTouchUpInside];
                }
            }
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




- (IBAction)lamp_face_Change:(UISlider *)sender {
//    int stepValue = sender.value;
//    [self.denon_progressValue setProgress:(float)stepValue/100];
//    self.denon_labelValue.text = [NSString stringWithFormat:@"%d",stepValue];
    
}

- (IBAction)system_power_change:(UISwitch *)sender {

    
    
}


#pragma mark - 系统电源


-(void)system_power_poweron:(UIButton *)sender{
    NSLog(@"%ld",(long)sender.tag);
    [[AppDelegate app] sendCom:@"10100"];
}


-(void)system_power_shutdown:(UIButton *)sender{
   // NSLog(@"%ld",(long)sender.tag);
   // NSLog(@"%ld",(long)sender.tag);
    [[AppDelegate app] sendCom:@"10101"];
}

#pragma mark - 投影
-(void)proj_power_change:(UISwitch *)sender{
    NSLog(@"%ld",(long)sender.tag);
    if (sender.on == YES) {
       [[AppDelegate app] sendCom:@"10112"];
    }else{
        [[AppDelegate app] sendCom:@"10113"];
    }
    
    
}

-(void)proj_screen_UpAndDown:(UIButton *)sender{
    NSLog(@"%ld",(long)sender.tag);
    [[AppDelegate app] sendCom:[NSString stringWithFormat:@"10%ld",sender.tag]];
    
}

#pragma mark - 音频处理器

-(void)sabine_volChange:(UISegmentedControl *)sender{
    NSLog(@"%ld",sender.selectedSegmentIndex);
    [[AppDelegate app] sendCom:[NSString stringWithFormat:@"1013%ld",sender.selectedSegmentIndex + 2]];
}

#pragma mark - 灯光

//-(void)lamp_valueChange:(UISlider *)sender{
//    int theValue = sender.value;
//    [[AppDelegate app] sendCom:[NSString stringWithFormat:@"B%02ld%02d",sender.tag-1000,theValue]];
//}


#pragma mark - denon

- (IBAction)denonChangeVol:(UISlider *)sender {
    int stepValue = sender.value;
    self.denon_labelValue.text = [NSString stringWithFormat:@"%d",stepValue];
    NSLog(@"A00%02d",stepValue);
    [[AppDelegate app] sendCom:[NSString stringWithFormat:@"A00%02d",stepValue]];
    
}

-(void)denon_mode_change:(UISegmentedControl *)sender{
    NSLog(@"%ld",sender.selectedSegmentIndex);
    [[AppDelegate app] sendCom:[NSString stringWithFormat:@"1014%ld",sender.selectedSegmentIndex + 2]];
    
}


#pragma mark - DVD

-(void)DVD_button:(UIButton *)sender{
    NSLog(@"%ld",(long)sender.tag);
    
}

#pragma mark - window
    
-(void)window_button:(UIButton *)sender{
    NSLog(@"%ld",(long)sender.tag);
    [[AppDelegate app] sendCom:[NSString stringWithFormat:@"10%ld",(long)sender.tag]];
}
    
#pragma mark - door
    
-(void)door_button:(UIButton *)sender{
    NSLog(@"%ld",(long)sender.tag);
     [[AppDelegate app] sendCom:[NSString stringWithFormat:@"10%ld",(long)sender.tag]];
        
}
    
    
    
    

@end

