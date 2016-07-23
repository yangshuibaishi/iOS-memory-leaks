最近接手一个比较大的项目，需要检测内存泄漏，起初毫无头绪，无从下手，想用Insturments，它既慢，又不好定位内存泄漏的位置，如果想快速的完成这个新的项目的检测，可以采用以下思路：

如果该类没有调用dealloc则证明其没有释放内存 可能存在retain cycle

1.ViewController 强引用
在demo（leak），SecondViewController的属性@property (strong, nonatomic) UIViewController *viewController; 为strong时，两个viewController都不会被释放，改为weak则可以被释放。

2.block

3.NSArray 可以换成NSHashTable

4.Notification

5.KVC
