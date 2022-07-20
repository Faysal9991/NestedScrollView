import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      ),
      home: const NestedScrollViewFirstHome(),
    );
  }
}



class NestedScrollViewFirstHome extends StatelessWidget {
  const NestedScrollViewFirstHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NestedScrollView Sample'),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              forceElevated: innerBoxIsScrolled,
              floating: true,

              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
               
                background: Image.network(
                  'https://cdn.pixabay.com/photo/2016/09/10/17/18/book-1659717_960_720.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.orange[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 60,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}