/* import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
      title: 'Experiment', // used by the OS task switcher
      home: SafeArea(
        child: experimentV4(),
      ),
    ),
  );
}

class experimentV4 extends StatefulWidget {
  const experimentV4({super.key});

  @override
  State<experimentV4> createState() => _experimentV4State();
}

class _experimentV4State extends State<experimentV4> {
  Map<String, List> itemInfo = {
    'Green Top': [],
    'Orange Skirt': [],
    'Blue Jeans': [],
    'Yellow Dress': [],
    'Purple Shoes': [],
    'Black Jacket': [],
    'White T-shirt': [],
    'Brown Boots': [],
    'Gray Sweater': [],
    'Pink Scarf': [],
    'Navy Leggings': [],
    'Beige Coat': [],
    'Maroon Blouse': [],
    'Striped Blazer': [],
    'Floral Maxi Dress': [],
    'Denim Shorts': [],
    'Polka Dot Blouse': [],
    'Black Jeans': [],
    'Pink Dress': [],
    'Brown Loafers': [],
    'Gray Cardigan': [],
    'Navy Turtleneck': [],
    'Olive Pants': [],
    'Yellow Sweater': [],
    'Plaid Scarf': [],
    'Tan Boots': [],
    'Striped Shirt': [],
    'Floral Skirt': [],
    'Denim Jacket': [],
    'Red Leggings': [],
    'Beige Sweater': [],
    'Checkered Blazer': []
  };
  Random random = Random();

  initialiseData() {
    itemInfo.forEach((key, value) {
      Map info = {};

      //add data
      int classGen = random.nextInt(4);
      if (classGen == 0) {
        info['Class'] = 'A';
        int wardrobeGen = random.nextInt(2);
        if (wardrobeGen == 0) {
          info['Wardrobe'] = '1';
        } else {
          info['Wardrobe'] = '2';
        }

        info['Condition'] = 'Excellent';

        info['Price'] = random.nextInt(26) + 75;

        info['User Wears'] = 0;
        info['Total Wears'] = 0;

        info['Moved'] = '';
      } else if (classGen == 1) {
        info['Class'] = 'B';
        int wardrobeGen = random.nextInt(2);
        if (wardrobeGen == 0) {
          info['Wardrobe'] = '3';
        } else {
          info['Wardrobe'] = '4';
        }

        info['Condition'] = 'Very Good';

        info['Price'] = random.nextInt(26) + 50;
        info['User Wears'] = 0;
        info['Total Wears'] = 0;

        info['Moved'] = '';
      } else if (classGen == 2) {
        info['Class'] = 'C';
        int wardrobeGen = random.nextInt(2);
        if (wardrobeGen == 0) {
          info['Wardrobe'] = '5';
        } else {
          info['Wardrobe'] = '6';
        }

        info['Condition'] = 'Good';

        info['Price'] = random.nextInt(26) + 25;

        info['User Wears'] = 0;
        info['Total Wears'] = 0;

        info['Moved'] = '';
      } else {
        info['Class'] = 'D';
        int wardrobeGen = random.nextInt(2);
        if (wardrobeGen == 0) {
          info['Wardrobe'] = '7';
        } else {
          info['Wardrobe'] = '8';
        }

        info['Condition'] = 'Satisfactory';
        info['Price'] = random.nextInt(26);

        info['User Wears'] = 0;
        info['Total Wears'] = 0;

        info['Moved'] = '';
      }

      value.add(info);
    });
  }

  List moveA = [];
  List moveB = [];
  List moveC = [];
  List moveD = [];

 

  Color cellColour = Colors.white;
  Color cellColours(timesWorn, moved) {
    if (timesWorn >= 8) {
      cellColour =
          Colors.cyan; //cell is highlighted cyan when ready for exchange
    } else {
      cellColour = Colors.white;
    }

    if (moved.contains('Exchanged')) {
      cellColour = Colors.lime;
    } else if (moved.contains('Sold')) {
      cellColour = Colors.deepOrange;
    } else if (moved.contains('Donate')) {
      cellColour = Colors.amber;
    }
    return cellColour;
  }

  @override
  void initState() {
    initialiseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  simulation();
                });
              },
              icon: Icon(Icons.play_arrow),
              iconSize: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Table'),
                SingleChildScrollView(
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      // Headers 1+ how many months
                      TableRow(
                        decoration: const BoxDecoration(color: Colors.black12),
                        children: [
                          const TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('Item'),
                              ),
                            ),
                          ),
                          ...List.generate(
                            itemInfo.values.first.length,
                            (monthIndex) => TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text('Month ${monthIndex * 2}'),
                                ),
                              ),
                            ),
                          ),
                          // New Column Header
                        ],
                      ),
                      // generates number of rows based on how many items in class A
                      ...List.generate(
                        itemInfo.length,
                        (itemIndex) => TableRow(
                          decoration: const BoxDecoration(color: Colors.white),
                          children: [
                            //1 cell per row containing name
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    '${itemInfo.keys.toList()[itemIndex]}',
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                              ),
                            ),
                            // Generate cells for each month
                            ...List.generate(
                              itemInfo.values.first.length,
                              (monthIndex) => TableCell(
                                child: Container(
                                  color: cellColours(
                                    itemInfo[itemInfo.keys.toList()[itemIndex]]
                                        ?[monthIndex]['User Wears'],
                                    itemInfo[itemInfo.keys.toList()[itemIndex]]
                                        ?[monthIndex]['Moved'],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        '${itemInfo.values.toList()[itemIndex][monthIndex]}',
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // New Column Cells (You can populate these cells with appropriate data)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 */