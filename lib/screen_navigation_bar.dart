import 'package:calculadora_cebrecos_fest_local/screen_drinks.dart';
import 'package:calculadora_cebrecos_fest_local/screen_food.dart';
import 'package:calculadora_cebrecos_fest_local/screen_calculation.dart';
import 'package:flutter/material.dart';


@immutable
class BottomNavigationWidget extends StatefulWidget {
  //late double summ;
  const BottomNavigationWidget({super.key});
  //required this.summ

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget>{
  //late BottomNavigationBar bottomNavigationBar;
  int _selectedIndex = 0;
  //late double summ;
  //late List<Widget> _children = [ScreenDrinks(summ: summ), ScreenFoods(summ: summ)];

  @override
  void initState() {
    super.initState();
    //summ = widget.summ;
  }
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    

  }
  Widget _setBody(int index){
    if (index == 0){
      return ScreenDrinks();
    }
    else{
      if(index == 1){
        return ScreenFoods();
      }
      else{
        return ScreenCalculation();
      }
      //summ: summ
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _setBody(_selectedIndex),//_children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.wine_bar),
              label: 'Bebidas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              label: 'Comidas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined),
              label: 'Recuento')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink.shade300,
        onTap: _onItemTapped,
      ),
    );

  }

}