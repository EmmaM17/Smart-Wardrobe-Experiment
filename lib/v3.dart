/* import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
      title: 'Experiment', // used by the OS task switcher
      home: SafeArea(
        child: experimentV3(),
      ),
    ),
  );
}

class experimentV3 extends StatefulWidget {
  const experimentV3({super.key});

  @override
  State<experimentV3> createState() => _experimentV3State();
}

class _experimentV3State extends State<experimentV3> {
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
  simulation() {
    // Reset move lists before processing
    moveA.clear();
    moveB.clear();
    moveC.clear();
    moveD.clear();
    itemInfo.forEach((key, value) {
      Map info = Map.from(value.last); // Create a copy of the last item
      //reset moved
      info['Moved'] = '';
      // Update wears
      int wears = random.nextInt(9);
      int userWears = info['User Wears'] + wears;
      info['User Wears'] = userWears;
      int totalWears = info['Total Wears'] + wears;
      info['Total Wears'] = totalWears;

      // If the number of wears is 8 or more
      if (userWears > 7) {
        // Class A
        if (info['Class'] == 'A') {
          moveA.add({
            key: [info]
          });
        }

        // Class B
        if (info['Class'] == 'B') {
          moveB.add({
            key: [info]
          });
        }

        // Class C
        if (info['Class'] == 'C') {
          moveC.add({
            key: [info]
          });
        }

        // Class D
        if (info['Class'] == 'D') {
          moveD.add({
            key: [info]
          });
        }
      }

      value.add(info); // Add the updated info back to the list
    });
  }

  exchange(classData) {
    if (classData.isNotEmpty) {
      Map item1 = classData[0].values.first[0];
      Map item2 = {};
      List toRemove = [];

      for (int i = 0; i < classData.length; i++) {
        if (item1['Wardrobe'] != classData[i].values.first[0]['Wardrobe']) {
          item2 = classData[i].values.first[0];
          if (item2.isNotEmpty) {
            // Swap the values
            var wardrobe = item1['Wardrobe'];
            item1['Wardrobe'] = item2['Wardrobe'];
            item2['Wardrobe'] = wardrobe;

            item1['Moved'] =
                'Exchanged from wardrobe ${item2['Wardrobe']} ${classData[i].keys.first}';
            item2['Moved'] =
                'Exchanged from wardrobe ${item1['Wardrobe']} ${classData[0].keys.first}';

            item1['User Wears'] = 0;
            item2['User Wears'] = 0;

            toRemove = [classData[0], classData[i]];
            break; // This will exit the loop
          }
        }
      }
      return toRemove;
    }
  }

  sell(classData, class2sell2) {
    List wardrobes = [];
    Map item2sell = classData[0].values.first.first;

    //find wardrobe to sell item 2
    itemInfo.forEach((key, value) {
      if (value.last['Class'] == class2sell2) {
        wardrobes.add(value.last['Wardrobe']);
      }
    });
    wardrobes = wardrobes.toSet().toList();

    //now sell
    item2sell['Class'] = class2sell2;
    item2sell['Moved'] = 'Sold';
    item2sell['Wardrobe'] = wardrobes[random.nextInt(2)];
    item2sell['User Wears'] = 0;
    item2sell['Price'] = (item2sell['Price'] / 2).toInt();
    item2sell['Condtion'] = 'Very Good';

    Map sold = classData[0];
    return sold;
  }

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
                  // Class A
                  if (moveA.length > 1) {
                    List toRemove = exchange(moveA);
                    moveA.removeWhere((element) =>
                        element == toRemove[0] || element == toRemove[1]);
                  }
                  // Class B
                  else if (moveB.length > 1) {
                    List toRemove = exchange(moveB);
                    moveB.removeWhere((element) =>
                        element == toRemove[0] || element == toRemove[1]);
                  }

                  if (moveA.isNotEmpty) {
                    Map sold = sell(moveA, 'B');
                    moveA.removeWhere((element) => element == sold);
                  }
                  if (moveB.isNotEmpty) {
                    Map sold = sell(moveB, 'C');
                    moveB.removeWhere((element) => element == sold);
                  }
                });
                List classesLeft = [];
                itemInfo.forEach(
                  (key, value) {
                    classesLeft.add(value.last['Class']);
                  },
                );
                int aLeft =
                    classesLeft.where((element) => element == 'A').length;
                int bLeft =
                    classesLeft.where((element) => element == 'B').length;
                int cLeft =
                    classesLeft.where((element) => element == 'C').length;
                int dLeft =
                    classesLeft.where((element) => element == 'D').length;
                print('items in A $aLeft');
                print('items in b $bLeft');
                print('items in c $cLeft');
                print('items in  $dLeft');
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