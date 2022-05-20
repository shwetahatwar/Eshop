import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: buildMenuItems(context)),

    );
  }
  List<Widget> buildMenuItems(BuildContext context){
    final List<String> menuTitles = [
      'Home',
      'BMI Calculator',
      'Training',
      'Wheater'
    ];
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text(' Fitness Menu',
            style: TextStyle(color: Colors.white, fontSize: 28))));
    menuTitles.forEach((String element) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(element,
            style: TextStyle(fontSize: 18)),
        onTap: (){
          // switch (element) {
          //   case 'Home':
          //     screen  = IntroScreen();
          //     break;
          //   case 'BMI Calculator':
          //     screen = BmiScreen();
          //     break;
          // }
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    });
    return menuItems;
  }
}