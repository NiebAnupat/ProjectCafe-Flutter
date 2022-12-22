import 'package:flutter/material.dart';
import 'menuCafe.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _buttonAction = [
    Center(child: Text('Menu Page')),
    Center(child: Text('Summary Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Menu Page',
          style: TextStyle(fontSize: 24),
        ),
      ),

      // Bottom Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'เมนู',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'สรุปรายการ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'ออกจากระบบ',
          ),
        ],
      ),
    );
  }
}

// void main() {
//   // var app = MyWidget();
//   // runApp(app);
//   runApp(LessWidget());
// }

//Build widget
//Stateless can't change
// class LessWidget extends StatelessWidget {
//   const LessWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: "Cafe App",
//         home: FullWidget(),
//         // Scaffold(
//         //   appBar: AppBar(
//         //     title: Center(
//         //         child: Text(
//         //       "Ruen Darunee`s Cafe",
//         //       style: TextStyle(fontSize: 24),
//         //     )),
//         //   ),
//         //   body: Center(
//         //       child: Column(
//         //     mainAxisAlignment: MainAxisAlignment.center,
//         //     children: [
//         //       Text("Welcome to Ruen Darunee`s Cafe"),
//         //       Text("We serve the best coffee in town"),
//         //       Image(
//         //         image: NetworkImage(
//         //             "https://cdn.pixabay.com/photo/2017/08/07/22/57/coffee-2608864_960_720.jpg"),
//         //       )
//         //     ],
//         //   )),
//         // ),
//         theme: ThemeData(
//           primarySwatch: Colors.brown,
//         ));
//   }
// }

// //Stateful can change
// class FullWidget extends StatefulWidget {
//   const FullWidget({super.key});

//   @override
//   State<FullWidget> createState() => _FullWidgetState();
// }

// class _FullWidgetState extends State<FullWidget> {
//   int count = 0;

//   //List of menu
//   List<menuCafe> menu = [
//     menuCafe("Latte", "40", "assets/images/latte.jpg"),
//     menuCafe("Mocha", "50", "assets/images/mocha.jpg"),
//     menuCafe("Cappuccino", "60", "assets/images/cappu.jpg"),
//   ];

// // Print data
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Center(
//               child: Text(
//             "Ruen Darunee`s Cafe",
//             style: TextStyle(fontSize: 24),
//           )),
//         ),
//         body: ListView.builder(
//             itemCount: menu.length,
//             itemBuilder: (BuildContext context, int index) {
//               menuCafe food = menu[index];
//               return ListTile(
//                 leading: Image.asset(food.image),
//                 title: Text(food.name),
//                 subtitle: Text("Price " + food.price + " Baht"),
//                 onTap: () {
//                   print("You have choosen " + food.name);
//                 },
//               );
//             }));

//     // Button to count
//     // floatingActionButton: FloatingActionButton(
//     //   onPressed: incrementCounter,
//     //   child: Icon(Icons.add),
//     // ));
//   }

//   //Function to count
//   // void incrementCounter() {
//   //   setState(() {
//   //     count++;
//   //   });
//   // }

//   // Prepare data
//   // List<Widget> getData(int count) {
//   //   List<Widget> data = [];
//   //   // data.add(Text("Welcome to Ruen Darunee`s Cafe"));
//   //   // data.add(Text("We serve the best coffee in town"));
//   //   // data.add(Text("You have pressed the button $count times"));

//   //   for (var i = 0; i < count; i++) {
//   //     // var menu = Text("Menu $i", style: TextStyle(fontSize: 24));
//   //     var menu = ListTile(
//   //       title: Text("Menu $i"),
//   //       subtitle: Text("List ${i + 1}"),
//   //     );
//   //     data.add(menu);
//   //   }
//   //   return data;
//   // }
// }
