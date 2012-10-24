#import <CoreGraphics/CoreGraphics.h>
#import "CKViewController.h"
#import "CKCalendarView.h"

#import "SMUtilities.h"
#import "AFDCalendarView.h"

#define AFDCalendarMarginiPad 10.0
#define AFDCalendarMarginiphone 4.0

@interface CKViewController () <CKCalendarDelegate>
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) CKCalendarView *calendar;

@property (nonatomic, strong) AFDCalendarView *calendarView;
@end

@implementation CKViewController

#pragma mark - =============== Getter methods ====================
-(NSDateFormatter *)dateFormatter{
    if(!_dateFormatter){
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"dd/MM/yyyy"];
    }
    
    return _dateFormatter;
}

-(CKCalendarView *)calendar{
    if(!_calendar){
        _calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
        _calendar.delegate = self;
        _calendar.selectedDate = [NSDate date];
        _calendar.minimumDate = [self.dateFormatter dateFromString:@"09/07/2000"];
        _calendar.maximumDate = [self.dateFormatter dateFromString:@"29/07/2112"];
    }
    
    return _calendar;
}

-(AFDCalendarView *)calendarView{
    
    if(!_calendarView){
        _calendarView = [SMUtilities nibOfClass:[AFDCalendarView class] owner:nil];
    }
    
    return _calendarView;
}

#pragma mark - =============== View Controller methods ============
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if ([SMUtilities isIphone]) {
        nibNameOrNil = [nibNameOrNil stringByAppendingFormat:@"iPhone"];
    } else {
        nibNameOrNil = [nibNameOrNil stringByAppendingFormat:@"iPad"];
    }
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
    }
    
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.calendarContainerView addSubview:self.calendar];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    CGRect frame = self.calendarContainerView.bounds;
    CGFloat margin = AFDCalendarMarginiPad;
    if(![SMUtilities isIphone]){
        margin = AFDCalendarMarginiphone;
    }
    frame.origin.x = margin;
    frame.origin.y = margin;
    frame.size.width -= margin * 2;
    frame.size.height -= margin *2;
    self.calendar.frame = frame;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    } else {
        return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
    }
}

- (void)viewDidUnload {
    [self setCalendarContainerView:nil];
    [self setReminderAndDeliveryBreakContainerView:nil];
    [self setReminderTableView:nil];
    [self setDeliveryBreakTableView:nil];
    [super viewDidUnload];
}

#pragma mark - ===============CKCalendarDelegate  methods ==============
- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    
    DLog(@"selected Date %@", [self.dateFormatter stringFromDate:date]);
}


#pragma mark - =============== IBAction methods ===================
//----for iphone-----
- (IBAction)calendarKeyBarButtonClicked:(UIBarButtonItem *)sender {
}

- (IBAction)deliveryBreakBarButtonClicked:(UIBarButtonItem *)sender {
}

- (IBAction)reminderBarButtonClicked:(UIBarButtonItem *)sender {
}
//-------------------

@end