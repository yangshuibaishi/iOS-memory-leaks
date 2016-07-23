最近接手一个比较大的项目，需要检测内存泄漏，起初毫无头绪，无从下手，想用Insturments，它既慢，又不好定位内存泄漏的位置，如果想快速的完成这个新的项目的检测，可以采用以下思路：

如果该类没有调用dealloc则证明其没有释放内存 可能存在retain cycle

1.ViewController 强引用
在demo（leak），SecondViewController的属性@property (strong, nonatomic) UIViewController *viewController; 为strong时，两个viewController都不会被释放，改为weak则可以被释放。

2.block
在block里边直接使用self 就会造成r循环引用，导致当前类无法释放，在BlockViewController中把weakSelf改为self则当前类就没办法释放了。还要注意的是，如果当前类有其它属性，在block块里也不要直接使用_name类似这种的调用，因为_name 在这里会被编译成self.name。以及成员变量 _petName会被编译成self->_petName;

3.NSArray 可以换成NSHashTable

4.Notification

5.KVC
