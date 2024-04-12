import 'dart:math';
import 'package:flutter/material.dart';

Random random = Random();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      title: 'Experiment', // used by the OS task switcher
      home: SafeArea(
        child: sim(),
      ),
    ),
  );
  //variables
}

//simulates every 2 months
bool simulate(Map dress, bool disposed) {
  Random random = Random();
  int wears = random.nextInt(9); //worn up to 8 times

  dress['User Wears'] += wears;
  dress['Total Wears'] += wears;
  dress['Movements'] = '';
  dress['Month'] = dress['Month'] + 2;
  int what2do = random.nextInt(5);
  if (dress['User Wears'] > 7 && dress['Class'] == 'A') {
    if (what2do == 0) {
      exchange(dress, random);
    } else if (what2do == 1) {
      sell(dress);
    } else if (what2do == 2) {
      donate(dress);
    } else if (what2do == 3) {
      disposed = dispose(dress, disposed);
    }
  } else if (dress['User Wears'] > 15 && dress['Class'] == 'B') {
    if (what2do == 0) {
      exchange(dress, random);
    } else if (what2do == 1) {
      sell(dress);
    } else if (what2do == 2) {
      donate(dress);
    } else if (what2do == 3) {
      disposed = dispose(dress, disposed);
    }
  } else if (dress['User Wears'] > 25 && dress['Class'] == 'C') {
    if (what2do < 1) {
      donate(dress);
    } else if (what2do >= 1 && what2do < 3) {
      disposed = dispose(dress, disposed);
    }
  } else if (dress['User Wears'] > 50 && dress['Class'] == 'D') {
    if (what2do > 1) {
      disposed = dispose(dress, disposed);
    }
  }

  print(dress);
  return disposed;
}

void exchange(Map dress, Random random) {
  //4 wardrobes to exchange with
  int wardrobe2Xchng = random.nextInt(4) + 1;
  while (wardrobe2Xchng.toString() == dress['wardrobe']) {
    wardrobe2Xchng = random.nextInt(4) + 1;
  }

  dress['Wardrobe'] = wardrobe2Xchng.toString();
  dress['Movements'] = 'Exchanged';
  dress['User Wears'] = 0;
}

void sell(Map dress) {
  //sell from a2b, b2c
  if (dress['Class'] == 'A') {
    //selling to B
    dress['Price'] = (dress['Price'] / 2).toInt();
    dress['Class'] = 'B';
    dress['User Wears'] = 0;
    dress['Movements'] = 'Sold';
  } else {
    //selling to C
    dress['Price'] = (dress['Price'] / 2).toInt();
    dress['Class'] = 'C';
    dress['User Wears'] = 0;
    dress['Movements'] = 'Sold';
  }
}

void donate(Map dress) {
  //donate to D
  dress['Class'] = 'D';
  dress['Price'] = (dress['Price'] - ((dress['Price']) / 4) * 3).toInt();
  dress['User Wears'] = 0;
  dress['Movements'] = 'Donated';
}

bool dispose(Map dress, bool disposed) {
  //dispose
  dress['Movements'] = 'Disposed';
  return true;
}

class sim extends StatefulWidget {
  const sim({super.key});

  @override
  State<sim> createState() => _simState();
}

class _simState extends State<sim> {
  Map dress = {
    'Class': 'A',
    'Wardrobe': '1',
    'Price': 100,
    'User Wears': 0,
    'Total Wears': 0,
    'Movements': '',
    'Month': 0
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bool disposed = false;
    int index = 0;
    while (!disposed) {
      disposed = simulate(dress, disposed);
      index++;
    }
/*     if (disposed == false && index == 18) {
      dispose(dress, disposed);
    }
 */
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Results',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
          Container(
            color: Colors.purple,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'Class: ${dress['Class']}',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  'Wardrobe: ${dress['Wardrobe']}',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  'Price: ${dress['Price']}',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  'User Wears: ${dress['User Wears']}',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  'Total Wears: ${dress['Total Wears']}',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  'Month: ${dress['Month']}',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
