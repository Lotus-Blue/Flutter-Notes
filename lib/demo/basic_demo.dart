import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//文字样式一样
class BasicDemo extends StatelessWidget{
  //写成一个函数，以后免得经常重复写
  final TextStyle _textStyle=TextStyle(
    fontSize: 16.0,
  );
  final String _author='李白';
  final String _title='将进酒';
  @override
  Widget build(BuildContext context) {
    return Text(
      "《$_title》 $_author 君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。",
      maxLines: 2,
      style: _textStyle,
      overflow: TextOverflow.ellipsis,//溢出的话就用省略号
    );
  }
}

//行内文字有不同样式
class TextDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "唐高智",
        style: TextStyle(
          fontSize: 16.0,
          color:Colors.deepOrange,
          fontStyle: FontStyle.italic,
        ),
        children: [
          TextSpan(
            text:"牛逼",
            style: TextStyle(
            fontSize: 12.0,
            color:Colors.black26,
            fontStyle: FontStyle.italic,
        ),           
          )
        ]
      ),
      );
  }
}

class ContainerDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.grey[10],
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.pool,size:32.0,color:Colors.amberAccent),
            decoration: BoxDecoration(
              color: Colors.black,

              //设置container的边框(里面背景颜色也与边框设置的一样)
              border: Border(
                bottom:BorderSide(
                  color: Colors.green,
                  width: 3.0,
                  style: BorderStyle.solid,//粗线
                ) ,
                ),
           //   borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          Container(
            color: Colors.green,
            child: Icon(Icons.pool,size:32.0,color:Colors.black),

            //下面也可以调背景颜色
            //container装饰
         //   decoration: BoxDecoration(
          //    color: Color.fromRGBO(255, 25, 123, 0.5),
          //  ),
          ),
          Icon(Icons.pool,size:32.0,color:Colors.black)
        ],
      )
    );
  }
}