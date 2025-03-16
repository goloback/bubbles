import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(Bubbles());

}

class Bubbles extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      
    );
  }
}

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage>{

//add button clear or delete all bublles, which delete all elements from allbubles and print list length

List<GraficBublle> allbublles = [];

void createbublle(TapDownDetails infoclick){
  var x = infoclick.localPosition.dx;
  var y = infoclick.localPosition.dy;
  print('$x $y');
  GraficBublle newbublle = GraficBublle(position: infoclick.localPosition, 
  color: Color.fromRGBO(
    Random().nextInt(256), 
    Random().nextInt(256), 
    Random().nextInt(256),
     1),
     size: Random().nextInt(71) + 30
     );
     setState(() {
      allbublles.add(newbublle);
     });
     
     print(allbublles.length);
}
void deleteAllBubbles(){
  setState(() {
    allbublles.clear();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GestureDetector(
      onTapDown: createbublle,
      child: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 67, 162, 197),
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Text(
              'Tap anywhere',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 25
              ),
            ),
          ),
          ...allbublles.map((b)=>Positioned(          
            left: b.position.dx - b.size / 2,
            top: b.position.dy - b.size / 2,
            child: Container(
              width: b.size,
              height: b.size,
              decoration: BoxDecoration(
                color: b.color,
                shape: BoxShape.circle
              ),
            ), 
  
          )
          ),
          Positioned(
            bottom: 5,
            left: 5,
            child: ElevatedButton(
              onPressed: deleteAllBubbles,
               child: Text('delete')
            )
          )
        ],
      ),
    )
    );
  }
    
   

}

class GraficBublle{
  final Offset position;
  final Color color;
  final double size;
  GraficBublle({required this.position, required this.color, required this.size});
}

class FirstPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FirstPage();
  }
}

class _FirstPage extends State<FirstPage>{
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: open_main_page,
      child: Text('data')
    );
  }

  void open_main_page(){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context)=>MainPage()
      )
    );
  }
}

