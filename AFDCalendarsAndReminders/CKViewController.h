#import <UIKit/UIKit.h>

@interface CKViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *calendarContainerView;
@property (strong, nonatomic) IBOutlet UIView *reminderAndDeliveryBreakContainerView;

@property (strong, nonatomic) IBOutlet UITableView *reminderTableView;
@property (strong, nonatomic) IBOutlet UITableView *deliveryBreakTableView;

@end