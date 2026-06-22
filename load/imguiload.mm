#import <UIKit/UIKit.h>
#import "Obfuscate.h"
#import "imguiload.h"
#import "StreamerModeProtect.h"

@interface PassthroughView : UIView
@end

@implementation PassthroughView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return nil;
}

@end

@implementation _gVa1KpYoL9xT

static BOOL MenDeal;
_gVa1KpYoL9xT *extraInfoInstance = nil;

+ (void)load {
    [super load];
}

#pragma mark - ImGui Activation Logic

- (void)KhanhTrinh {
    UIViewController *controller = [_gVa1KpYoL9xT currentViewController];
    if (!controller) return;

    UIView *backgroundView = [controller.view viewWithTag:100];
    if (!backgroundView) {
        CGRect screenBounds = [UIScreen mainScreen].bounds;
        backgroundView = [[PassthroughView alloc] initWithFrame:screenBounds];
        backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        backgroundView.tag = 100;
        backgroundView.backgroundColor = [UIColor clearColor];
        backgroundView.multipleTouchEnabled = YES;
        backgroundView.userInteractionEnabled = NO;
        [controller.view addSubview:backgroundView];
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        backgroundView.frame = [UIScreen mainScreen].bounds;
        SetStreamerMode(StreamerMode); 
        protectedView = backgroundView;
        renderView = backgroundView;
    });

    if (!_vna) {
        _vna = [[_kRt85NyZjPoX alloc] init];
    }

    [_kRt85NyZjPoX _mWx41FrTcQaL:true];

    UIView *menuView = _vna.view;
if (menuView && ![menuView isDescendantOfView:[UIApplication sharedApplication].windows[0].rootViewController.view]) {
    [[UIApplication sharedApplication].windows[0].rootViewController.view addSubview:menuView];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __fn_hideCaptureForView(menuView, StreamerMode);
    });
}

    backgroundView.hidden = NO;
}

#pragma mark - JHUIViewControllerDecoupler (in-class)

+ (UIViewController *)jh_controllerFromString:(NSString *)string paramter:(NSDictionary *)dictionary {
    UIViewController *vc = [NSClassFromString(string) new];
    if (!vc) {
        return [self jh_notice_vc:string];
    }

    for (NSString *key in dictionary.count > 0 ? dictionary.allKeys : @[]) {
        @try {
            [vc setValue:dictionary[key] forKey:key];
        } @catch (NSException *exception) {
        }
    }

    return vc;
}

+ (UIViewController *)jh_notice_vc:(NSString *)string {
#if DEBUG
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    return vc;
#else
    return nil;
#endif
}

#pragma mark - JHPP Logic Embutido

+ (UIViewController *)currentViewController {
    return [self fetchViewControllerFromRootViewController];
}

+ (void)pushVC:(UIViewController *)vc from:(id)responder {
    [self pushVC:vc from:responder animated:YES];
}

+ (void)pushVC:(UIViewController *)vc from:(id)responder animated:(BOOL)animated {
    UIViewController *topVC = [self fetchViewController:responder];
    [topVC.navigationController pushViewController:vc animated:animated];
}

+ (void)pushVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder {
    [self pushVC:vcString paramter:dic from:responder animated:YES];
}

+ (void)pushVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder animated:(BOOL)animated {
    UIViewController *topVC = [self fetchViewController:responder];
    UIViewController *vc = [self jh_controllerFromString:vcString paramter:dic];
    if (vc) {
        [topVC.navigationController pushViewController:vc animated:animated];
    }
}

+ (void)presentVC:(UIViewController *)vc from:(id)responder {
    [self presentVC:vc from:responder animated:YES];
}

+ (void)presentVC:(UIViewController *)vc from:(id)responder animated:(BOOL)animated {
    UIViewController *topVC = [self fetchViewController:responder];
    [topVC presentViewController:vc animated:animated completion:nil];
}

+ (void)presentVC:(UIViewController *)vc from:(id)responder navigation:(BOOL)navigation {
    [self presentVC:vc from:responder navigation:navigation animated:YES];
}

+ (void)presentVC:(UIViewController *)vc from:(id)responder navigation:(BOOL)navigation animated:(BOOL)animated {
    UIViewController *topVC = [self fetchViewController:responder];
    if (navigation) {
        vc = [[[topVC.navigationController class] alloc] initWithRootViewController:vc];
    }
    [topVC presentViewController:vc animated:animated completion:nil];
}

+ (void)presentVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder {
    [self presentVC:vcString paramter:dic from:responder animated:YES];
}

+ (void)presentVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder animated:(BOOL)animated {
    UIViewController *topVC = [self fetchViewController:responder];
    UIViewController *vc = [self jh_controllerFromString:vcString paramter:dic];
    if (vc) {
        [topVC presentViewController:vc animated:animated completion:nil];
    }
}

+ (void)presentVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder navigation:(BOOL)navigation {
    [self presentVC:vcString paramter:dic from:responder navigation:navigation animated:YES];
}

+ (void)presentVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder navigation:(BOOL)navigation animated:(BOOL)animated {
    UIViewController *topVC = [self fetchViewController:responder];
    UIViewController *vc = [self jh_controllerFromString:vcString paramter:dic];
    if (vc) {
        if (navigation) {
            vc = [[[topVC.navigationController class] alloc] initWithRootViewController:vc];
        }
        [topVC presentViewController:vc animated:animated completion:nil];
    }
}

#pragma mark - View Controller Resolution Helpers

+ (UIViewController *)fetchViewController:(id)responder {
    UIViewController *vc;
    if ([responder isKindOfClass:[UIView class]]) {
        vc = [self fetchViewControllerFromView:responder];
    } else if ([responder isKindOfClass:[UIViewController class]]) {
        vc = responder;
    }
    if (!vc) {
        vc = [self fetchViewControllerFromRootViewController];
    }
    return vc;
}

+ (UIViewController *)fetchViewControllerFromView:(UIView *)view {
    UIResponder *responder = view.nextResponder;
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            break;
        }
        responder = responder.nextResponder;
    }
    return (UIViewController *)responder;
}

+ (UIViewController *)fetchViewControllerFromRootViewController {
    UIViewController *vc = [UIApplication sharedApplication].delegate.window.rootViewController;
    while (vc) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = [(UITabBarController *)vc selectedViewController];
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = [(UINavigationController *)vc visibleViewController];
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        } else {
            break;
        }
    }
    return vc;
}

@end
