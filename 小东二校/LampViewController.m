//
//  LampViewController.m
//  小东二校
//
//  Created by wharlim on 15/6/22.
//  Copyright (c) 2015年 wharlim. All rights reserved.
//

#import "LampViewController.h"

@interface LampViewController ()

@end

@implementation LampViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (UIView *slider in self.view.subviews) {
        if ([slider isKindOfClass:[UISlider class]]) {
            [(UISlider *)slider addTarget:self action:@selector(lamp_valueChange:) forControlEvents:UIControlEventValueChanged];
        }
    }
    
    [[AppDelegate app] sendCom:@"11100"];       //发送dmx.go
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTheView:) name:@"RevData" object:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillAppear:YES];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnSuperView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)lamp_valueChange:(UISlider *)sender{
    int theValue = sender.value;
    [[AppDelegate app] sendCom:[NSString stringWithFormat:@"B%02d%02d",sender.tag-1000,theValue]];
}

- (IBAction)cueCtrl:(UIButton *)sender {
    [[AppDelegate app] sendCom:[NSString stringWithFormat:@"1%d",sender.tag]];
}

- (IBAction)panCtrl:(UIButton *)sender {
     [[AppDelegate app] sendCom:[NSString stringWithFormat:@"1%d",sender.tag]];
}




-(void)changeTheView:(id)sender{
    
    NSString *rev = [[sender userInfo] objectForKey:@"rev"];    //0,73,0,0000000000000000000000000000000000000000   这样的格式，第一位是投影机，二三位是天龙音量，剩下是灯光
    
    //NSString *proj_status = [rev substringWithRange:NSMakeRange(0, 1)];     //投影机状态
    
    
    
    for (UIView *slider in self.view.subviews) {
        if ([slider isKindOfClass:[UISlider class]]) {
            NSInteger slider_int = slider.tag;
            NSString *lamp_value = [rev substringWithRange:NSMakeRange((7 + 2*(slider_int - 1000) - 2), 2)];
            NSInteger lamp_int = [lamp_value integerValue];
            
            UISlider *theSlider = [self.view viewWithTag:slider_int];
            theSlider.value = lamp_int;
            
            
        }
    }
    
    
}
    



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





@end
