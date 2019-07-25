// 增加抽屉背景，即背景头像

import 'package:flutter/material.dart';
import 'demo/listview_demo.dart';
import 'demo/bottom_navigationbar_demo.dart';
import 'demo/basic_demo.dart';
// import 'demo/view_demo.dart';
import 'demo/sliver_demo.dart';
import 'demo/navigator_demo.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(//自定义App模式
   // debugShowCheckedModeBanner:false,//不显示debug图标
    //home属性设置默认首页
     home:Hello(),
    // home: NavigatorDemo(),
      // home: SliverDemo(),
    // initialRoute: '/about',

    routes: {
      // '/':(context)=>NavigatorDemo(),
      '/about':(context)=>Page(title: "Home"),
    },

      theme:ThemeData(//这个app的主题
        primarySwatch: Colors.yellow,//顶部栏的颜色

        //按下图标时产生效果
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),//点击图标时产生的背景颜色
        splashColor: Colors.white70,//点击图标时产生水波纹效果
      )
    );
  }
}

class Hello extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return DefaultTabController(
       length: 4,
       child:Scaffold(//包含material顶部，顶部，一些部件
        appBar: AppBar(//顶部栏

/*本来设置了抽屉之后点击那个图标就可以打开抽屉了，但由于这里的申明，使之不能打开抽屉
        //最左边的
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: "Navigation",
            //检测该键是否被按下，如果按下consle就会发出消息
            onPressed: ()=>debugPrint("Navaigation button is pressed!"),
            ),
*/

          //最右边的
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),//一定要写成Icons.  我也是醉了
              tooltip: "Search",
              onPressed: ()=>debugPrint("Navaigation button is pressed!"),
            ),
            ],

          title: Text("Hello World"),
          elevation: 0.0,//顶部栏下滑线阴影大小(朦胧黑),默认值为4.0，0.0代表不要

          bottom: TabBar(
            
            //下面这四行是为了显示出该标签被按与未被按下的区别（颜色，下滑线）
            unselectedLabelColor: Colors.black54,//没有选择时标签的颜色
            indicatorColor: Colors.black54,//指示线颜色
            indicatorSize: TabBarIndicatorSize.label,//将指示线(下滑线)设置为与标签一样的长度
            indicatorWeight: 1.0,//指示线粗细程度

            tabs:<Widget>[
              Tab(icon:Icon(Icons.cloud_circle)),
              Tab(icon:Icon(Icons.access_alarm)),
              Tab(icon:Icon(Icons.access_time)),
              Tab(icon:Icon(Icons.bookmark)),
            ],
          ),
        ),

        //每个图标对应也就放大显示该图标
        body:TabBarView(
          children:<Widget>[
          //  Icon(Icons.cloud_circle,size:128.0,color:Colors.black12),//真是奇怪，为什么这里就乐意省略了icon:
          
          //点击该图标换成第二个demo
            ListViewDemo(),
            // Icon(Icons.access_alarm,size:128.0,color:Colors.black12),
            ContainerDemo(),
            Icon(Icons.access_time,size:128.0,color:Colors.black12),
           SliverDemo(),
            // SliverDemo(),
          ],
        ),

//drawer会自动生成那个图标，所以没必要再写
        drawer: Drawer(

          child: ListView(//在listview中放着头部与listtitle
            padding: EdgeInsets.zero,
            children: <Widget>[

              //用户信息
              UserAccountsDrawerHeader(
                accountName: Text("海上生明月",style: TextStyle(fontSize: 23),),
                accountEmail: Text("1348040397@qq.com"),
                currentAccountPicture: CircleAvatar(
                  //用Imange.network会报错
                  backgroundImage: NetworkImage("http://5b0988e595225.cdn.sohucs.com/images/20170912/080dfe6330b2458489533111d8dc24e4.jpeg"),
                  ),

                decoration: BoxDecoration(
                  color: Colors.yellow[400],
                  image: DecorationImage(
                    image:NetworkImage("http://pic161.nipic.com/file/20180411/9448607_145554945000_2.jpg"), 
                    fit:BoxFit.cover,//填满
                  ),
                ),
              ),

              //每列内容
              ListTile(
                title: Text("Messages",textAlign: TextAlign.left,),
                trailing: Icon(Icons.message,color:Colors.black12,size: 22.0),
                onTap: ()=>Navigator.pop(context),
              ),
              ListTile(
                title: Text("Favorite",textAlign: TextAlign.left,),
                trailing: Icon(Icons.favorite,color:Colors.black12,size: 22.0),
                onTap: ()=>Navigator.pop(context),
              ),
              ListTile(
                title: Text("Setting",textAlign: TextAlign.left,),
                trailing: Icon(Icons.settings,color:Colors.black12,size: 22.0),
                onTap: ()=>Navigator.pop(context),
              ),
              ListTile(
                title: Text("Exit",textAlign: TextAlign.left,),
                trailing: Icon(Icons.exit_to_app,color:Colors.black12,size: 22.0)
              ),
            ],
          ),
        ),
      //  endDrawer:Text("This is a draw"),//屏幕右边
        bottomNavigationBar: ButtomNavigationBarDemo(),
      ),
     );
  }
}
