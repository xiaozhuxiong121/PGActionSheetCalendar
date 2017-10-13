![PGActionSheetCalendar](PGActionSheetCalendar.gif)

# PGActionSheetCalendar
> 使用FSCalendar进行封装的

# CocoaPods安装
```
pod 'PGActionSheetCalendar'
```
# 使用
```
let calendar = PGActionSheetCalendar()
present(calendar, animated: false, completion: nil)
```
# 高级用法
有两种监听选中日期的方法 

1、代理

```  
calendar.delegate = self

func calendar(_ calendar: PGActionSheetCalendar, didSelectDate components: DateComponents) {
    print("year = ", components.year!,"month = ", components.month!,  "day = ", components.day!)
}
```
2、闭包

```
calendar.didSelectDateComponents = {components in
    print("year = ", components.year!,"month = ", components.month!,  "day = ", components.day!)
}
```
设置title

```
let label = calendar.titleLabel
label.text = "PGCalendar"
```

设置按钮的样式

```
calendar.cancelButton.setTitleColor(UIColor.red, for: .normal)
calendar.sureButton.setTitleColor(UIColor.red, for: .normal)
```

设置日历的样式

[https://github.com/WenchaoD/FSCalendar](https://github.com/WenchaoD/FSCalendar/blob/master/MOREUSAGE.md)