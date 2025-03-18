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
  var Bg = const Color.fromARGB(255, 67, 162, 197);
  var size = 5.0;

  MainPage( { required this.Bg, required this.size});
  @override
  State<StatefulWidget> createState() {
    return _MainPage(Bg: Bg, size: size);
  }

}

class _MainPage extends State<MainPage>{

//add button clear or delete all bublles, which delete all elements from allbubles and print list length

List<GraficBublle> allbublles = [];

var Bg = const Color.fromARGB(255, 67, 162, 197);
var size = 5.0;


_MainPage({required this.Bg, required this.size});

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
     size: size
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
            color:Bg,
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
          ), 
          Positioned(
            bottom: 5,
            right: 5,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
               child: Text('Home')
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
  var selected_color = Color.fromARGB(255, 67, 162, 197);
  var selected_size = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [DropdownButton<Color>(
          value: selected_color,
          items: [
            DropdownMenuItem(
              child: Text(
                'blue', 
                style: TextStyle(
                  color:Color.fromARGB(255, 67, 162, 197) 
                ),
              ),
              value:  Color.fromARGB(255, 67, 162, 197),
            ),
            DropdownMenuItem(
              child: Text(
                'red', 
                style: TextStyle(
                  color: Color.fromARGB(255, 202, 7, 7)
                ),
              ), 
              value:  Color.fromARGB(255, 202, 7, 7),
            ),
            DropdownMenuItem(
              child: Text(
                'green',
                style: TextStyle(
                  color:  Color.fromARGB(255, 30, 202, 7)
                ),
              ), 
              value:  Color.fromARGB(255, 30, 202, 7),
            ),
          ],
          onChanged: (color){
            setState(() {
              selected_color = color!;
            }
            );
            
          }
          ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: selected_size,
              min: 5,
              max: 100,
             onChanged: (size){
              setState(() {
                selected_size = size;
              });
              
             })
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: open_main_page,
              child: Text('data')
            )
          ],
        )
        
      ],
  

    ),
    )
    ;
  }

  void open_main_page(){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context)=>MainPage(Bg: selected_color, size: selected_size,)
      )
    );
  }
}

