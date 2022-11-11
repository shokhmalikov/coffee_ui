// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_ui/utils/coffee_tile.dart';
import 'package:coffee_ui/utils/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const path = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeType = [
    [
    'Cappucino',
    true
    ],
     [
    'Latte',
    false
    ],
     [
    'Black',
    false
    ],
     [
    'Tea',
    false
    ],
  ];
    void coffeTypeSelected(int index){
     setState(() {
      for(int i = 0; i<coffeType.length; i++){
        coffeType[i][1] = false;
      }
       coffeType[index][1]= true;
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: '',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.favorite,),
            label: '',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.notifications,),
            label: '',
          )
        ],
      ),
      body: Column(
        children: [
          //Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Find the best coffee for you',
            style: GoogleFonts.bebasNeue(
              fontSize: 56
            ),
            ),
          ),

          SizedBox(
            height: 25,
          ),
          //Search bar
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 25.0),
           child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Find your coffee...',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600)
              )
            ),
           ),
         ),

         SizedBox(
          height: 20,
         ),
         //listview of coffee types
         SizedBox(
          height: 30,
          child: ListView.builder(
            itemCount: coffeType.length,
            itemBuilder: (context, index){
              return CoffeeType(
                coffeeType: coffeType[index][0], 
                isSelected: coffeType[index][1], 
                onTap: (){
                  coffeTypeSelected(index);
                });
            },
            scrollDirection: Axis.horizontal,
          ),
         ),
          //listview of coffee tiles
         Expanded(
          child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CofeeTile(
              coffeeImagePath: 'assets/latte.webp',
              coffeeName: 'Latte',
              coffeePrice: '4.20',
            ),
            CofeeTile(
              coffeeImagePath: 'assets/cappucino.jpg',
              coffeeName: 'Cappucino',
              coffeePrice: '4.10',
            ),
            CofeeTile(
              coffeeImagePath: 'assets/milk.jpg',
              coffeeName: 'Milk Coffee thing',
              coffeePrice: '4.60',
            )
          ],
         )) 
        ],
      )
    );
  }
}