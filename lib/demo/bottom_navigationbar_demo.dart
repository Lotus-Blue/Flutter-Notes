import 'package:flutter/material.dart';

class ButtomNavigationBarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ButtomNavigationBarDemoState();
  }
}

class _ButtomNavigationBarDemoState extends State<ButtomNavigationBarDemo>{
  int _currentIndex=0;

  void _onTapHander(int index){
   setState((){
     _currentIndex=index;
    }
   );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          
          currentIndex: _currentIndex,
          onTap: _onTapHander,

          //下面这个只是第一个图标亮，如果没有上面上句，就是说你按其余3个没反应
          type: BottomNavigationBarType.fixed,//因为如果baritem超过3个就不会显示了，类型变了
          fixedColor: Colors.black,//激活状态下的图标颜色
          
          items: [
            BottomNavigationBarItem(
              icon:Icon(Icons.explore),
              title: Text("Explore"), 
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.history),
              title: Text("History"), 
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.list),
              title: Text("List"), 
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.person),
              title: Text("My"), 
            ),
          ],
        );
  }
}