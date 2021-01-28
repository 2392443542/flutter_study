import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewModel/CounterViewModel.dart';
import 'viewModel/user_view_model.dart';
import 'model/user_info.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create:(ctx) => CounterViewModel(),),
          ChangeNotifierProvider(create:(ctx) => UserViewModel(UserInfo("???","https",1)),)
    ],
        child: MyApp(),
    )
  );
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body:Center(
        child:Column(
          children: [CounterDemo1(),CounterDemo2(),CounterDemo3()],
        ) ,
      ),
      floatingActionButton: Selector<CounterViewModel,CounterViewModel>(selector: (context,  vm){
      return  vm;
     },
        shouldRebuild:(pre,next)=>false,
        builder: (ctx,vm,child){
        return FloatingActionButton(child:child,onPressed: (){
        vm.counter++;
        },);
      },
        child: Icon(Icons.add),
      ),
        //
    );
  }
}

class CounterDemo1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    int counter = Provider.of <CounterViewModel>(context).counter;
    return Container(
      color: Colors.white,
      child: Text("$counter",style: TextStyle(
          fontSize: 14
      ),),
    );
  }
}

class CounterDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      // child: Consumer<counter>(
        child:Consumer<CounterViewModel>(builder: (ctx, vm, child){
          return  Text("${vm.counter}",style: TextStyle(
            fontSize: 14,
          ),);
        },)
      // )
    );
  }
}


class CounterDemo3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // int counter = Provider.of <CounterViewModel>(context).counter;
    return Container(
        color: Colors.red,
        child:Consumer<UserViewModel>(builder:(ctx,vm,child){
      return Text("${vm.info.nickName}",style: TextStyle(
          fontSize: 30
      ),);
    }, ),
    );
  }
}