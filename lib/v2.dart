/* import 'dart:js_util';
import 'dart:math';
import 'dart:ui';

import 'package:experiment/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

/* void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      title: 'Experiment', // used by the OS task switcher
      home: SafeArea(
        child: experimentV2(),
      ),
    ),
  );
}
 */
class experimentV2 extends StatefulWidget {
  experimentV2({super.key});

  @override
  State<experimentV2> createState() => _experimentV2State();
}

class _experimentV2State extends State<experimentV2> {
  List classes = ['A', 'B', 'C', 'D'];
  final Logger _logger = Logger();
  List wardrobes = [1, 2, 3, 4, 5, 6, 7, 8];
  Map<String, dynamic> addItemInfo = {
    'Wardrobe': '',
    'Class': '',
    'User Wears': 0,
    'Total Wears': 0,
    'Price': 0,
    'Condition': '',
    'Exchanged': '',
    'Sold': '',
    'Donated': '',
    'Disposed': ''
  };
  List monthlyInfo = [];
  Random random = Random();
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

  Map<String, List> classA = {};
  List wardrobesA = [];
  Map<String, List> classB = {};
  List wardrobesB = [];
  Map<String, List> classC = {};
  List wardrobesC = [];
  Map<String, List> classD = {};
  List wardrobesD = [];
  int months = 0;

  initialiseSimulation() {
    List items = itemInfo.keys.toList();
    //Assign each wardrobe to a class
    Map<String, List> addClass = {};
    for (int i = 0; i < 4; i++) {
      String className = classes[i];
      List addWardrobes = [];
      int wardrobe = wardrobes[random.nextInt(wardrobes.length)];
      addWardrobes.add(wardrobe);
      wardrobes.remove(wardrobe);
      wardrobe = wardrobes[random.nextInt(wardrobes.length)];
      addWardrobes.add(wardrobe);
      wardrobes.remove(wardrobe);
      addClass.addAll({className: addWardrobes});
    }

    // Assign items to wardrobes in class A
    // Assign items to wardrobes in class A
    for (int i = 0; i < 4; i++) {
      List classA = addClass.values.first;
      int wardrobe1 = classA[0];
      int wardrobe2 = classA[1];

      // Create a new addItemInfo map for each iteration
      Map<String, dynamic> addItemInfo = {};

      addItemInfo['Class'] = 'A';
      addItemInfo['Wardrobe'] = wardrobe1;
      addItemInfo['Condition'] = 'Excellent';
      addItemInfo['Price'] = random.nextInt(26) + 75;
      addItemInfo['User Wears'] = 0;
      addItemInfo['Total Wears'] = 0;
      addItemInfo['Moved'] = '';

      String item = items[random.nextInt(items.length)];
      items.remove(item);
      List addData = [addItemInfo];
      itemInfo[item] = addData;

      // Create a new addItemInfo map for each iteration
      addItemInfo = {};

      addItemInfo['Class'] = 'A';
      addItemInfo['Wardrobe'] = wardrobe2;
      addItemInfo['Condition'] = 'Excellent';
      addItemInfo['Price'] = random.nextInt(26) + 75;
      addItemInfo['User Wears'] = 0;
      addItemInfo['Total Wears'] = 0;
      addItemInfo['Moved'] = '';

      item = items[random.nextInt(items.length)];
      items.remove(item);
      addData = [addItemInfo];
      itemInfo[item] = addData;
    }

    addClass.remove(addClass.keys.first);

    // Assign items to wardrobes in class B
    for (int i = 0; i < 4; i++) {
      List classB = addClass.values.first;
      int wardrobe1 = classB[0];
      int wardrobe2 = classB[1];

      // Create a new addItemInfo map for each iteration
      Map<String, dynamic> addItemInfo = {};

      addItemInfo['Class'] = 'B';
      addItemInfo['Wardrobe'] = wardrobe1;
      addItemInfo['Condition'] = 'Very Good';
      addItemInfo['Price'] = random.nextInt(26) + 50;
      addItemInfo['User Wears'] = 0;
      addItemInfo['Total Wears'] = 0;
      addItemInfo['Moved'] = '';

      String item = items[random.nextInt(items.length)];
      items.remove(item);
      List addData = [addItemInfo];
      itemInfo[item] = addData;

      // Create a new addItemInfo map for each iteration
      addItemInfo = {};

      addItemInfo['Class'] = 'B';
      addItemInfo['Wardrobe'] = wardrobe2;
      addItemInfo['Condition'] = 'Very Good';
      addItemInfo['Price'] = random.nextInt(26) + 50;
      addItemInfo['User Wears'] = 0;
      addItemInfo['Total Wears'] = 0;
      addItemInfo['Moved'] = '';

      item = items[random.nextInt(items.length)];
      items.remove(item);
      addData = [addItemInfo];
      itemInfo[item] = addData;
    }

    addClass.remove(addClass.keys.first);

// Assign items to wardrobes in class C
    for (int i = 0; i < 4; i++) {
      List classC = addClass.values.first;
      int wardrobe1 = classC[0];
      int wardrobe2 = classC[1];

      // Create a new addItemInfo map for each iteration
      Map<String, dynamic> addItemInfo = {};

      addItemInfo['Class'] = 'C';
      addItemInfo['Wardrobe'] = wardrobe1;
      addItemInfo['Condition'] = 'Good';
      addItemInfo['Price'] = random.nextInt(26) + 25;
      addItemInfo['User Wears'] = 0;
      addItemInfo['Total Wears'] = 0;
      addItemInfo['Moved'] = '';

      String item = items[random.nextInt(items.length)];
      items.remove(item);
      List addData = [addItemInfo];
      itemInfo[item] = addData;

      // Create a new addItemInfo map for each iteration
      addItemInfo = {};

      addItemInfo['Class'] = 'C';
      addItemInfo['Wardrobe'] = wardrobe2;
      addItemInfo['Condition'] = 'Good';
      addItemInfo['Price'] = random.nextInt(26) + 25;
      addItemInfo['User Wears'] = 0;
      addItemInfo['Total Wears'] = 0;
      addItemInfo['Moved'] = '';

      item = items[random.nextInt(items.length)];
      items.remove(item);
      addData = [addItemInfo];
      itemInfo[item] = addData;
    }

    addClass.remove(addClass.keys.first);

// Assign items to wardrobes in class D
    for (int i = 0; i < 4; i++) {
      List classD = addClass.values.first;
      int wardrobe1 = classD[0];
      int wardrobe2 = classD[1];

      // Create a new addItemInfo map for each iteration
      Map<String, dynamic> addItemInfo = {};

      addItemInfo['Class'] = 'D';
      addItemInfo['Wardrobe'] = wardrobe1;
      addItemInfo['Condition'] = 'Satisfactory';
      addItemInfo['Price'] = random.nextInt(26);
      addItemInfo['User Wears'] = 0;
      addItemInfo['Total Wears'] = 0;
      addItemInfo['Moved'] = '';

      String item = items[random.nextInt(items.length)];
      items.remove(item);
      List addData = [addItemInfo];
      itemInfo[item] = addData;

      // Create a new addItemInfo map for each iteration
      addItemInfo = {};

      addItemInfo['Class'] = 'D';
      addItemInfo['Wardrobe'] = wardrobe2;
      addItemInfo['Condition'] = 'Satisfactory';
      addItemInfo['Price'] = random.nextInt(26);
      addItemInfo['User Wears'] = 0;
      addItemInfo['Total Wears'] = 0;
      addItemInfo['Moved'] = '';

      item = items[random.nextInt(items.length)];
      items.remove(item);
      addData = [addItemInfo];
      itemInfo[item] = addData;
    }

    addClass.remove(addClass.keys.first);

    //Format data visually
    List infoList = [];
    itemInfo.forEach((key, value) {
      value.forEach((map) {
        map['Item'] = key;
        infoList.add(map);
      });
    });

    for (var item in infoList) {
      String findClass = item['Class'];

      if (findClass == 'A') {
        if (!classA.containsKey(item['Item'])) {
          classA[item['Item']] = [];
        }
        classA[item['Item']]!.add(item);
      } else if (findClass == 'B') {
        if (!classB.containsKey(item['Item'])) {
          classB[item['Item']] = [];
        }
        classB[item['Item']]!.add(item);
      } else if (findClass == 'C') {
        if (!classC.containsKey(item['Item'])) {
          classC[item['Item']] = [];
        }
        classC[item['Item']]!.add(item);
      } else {
        if (!classD.containsKey(item['Item'])) {
          classD[item['Item']] = [];
        }
        classD[item['Item']]!.add(item);
      }
    }
    classA.values.forEach((value) {
      Map remove = value[0];
      remove.remove('Item');
    });
    classB.values.forEach((value) {
      Map remove = value[0];
      remove.remove('Item');
    });
    classC.values.forEach((value) {
      Map remove = value[0];
      remove.remove('Item');
    });
    classD.values.forEach((value) {
      Map remove = value[0];
      remove.remove('Item');
    });
  }

  @override
  void initState() {
    super.initState();
    initialiseSimulation();
  }

  List lifeCycle = [];
  Map<String, List> classData = {};
  simulate() {
    //new month
    months = months + 1;

    classA.forEach((key, value) {
      Map info = value[value.length - 1];

      // Update wears
      int randomWears = random.nextInt(
          8); // Assuming worn max once per week --item is worn up to 8 times
      int timesWorn = info['User Wears'];
      int totalWears = info['Total Wears'];
      timesWorn += randomWears;
      totalWears += randomWears;

      // Create a new map with updated values
      Map newInfo = Map.from(info); // Create a copy of the original map
      newInfo['User Wears'] = timesWorn;
      newInfo['Total Wears'] = totalWears;
      newInfo['Moved'] = '';

      // Add the new map to the list
      value.add(newInfo);

      classData[key] = value;
    });

    //class B
    classB.forEach((key, value) {
      Map info = value[value.length - 1];

      // Update wears
      int randomWears = random.nextInt(
          8); // Assuming worn max once per week --item is worn up to 8 times
      int timesWorn = info['User Wears'];
      int totalWears = info['Total Wears'];
      timesWorn += randomWears;
      totalWears += randomWears;

      // Create a new map with updated values
      Map newInfo = Map.from(info); // Create a copy of the original map
      newInfo['User Wears'] = timesWorn;
      newInfo['Total Wears'] = totalWears;
      newInfo['Moved'] = '';

      // Add the new map to the list
      value.add(newInfo);

      //Ready to move....
      classData[key] = value;
    });

    //CLASS C

    classC.forEach((key, value) {
      Map info = value[value.length - 1];

      // Update wears
      int randomWears = random.nextInt(
          8); // Assuming worn max once per week --item is worn up to 8 times
      int timesWorn = info['User Wears'];
      int totalWears = info['Total Wears'];
      timesWorn += randomWears;
      totalWears += randomWears;

      // Create a new map with updated values
      Map newInfo = Map.from(info); // Create a copy of the original map
      newInfo['User Wears'] = timesWorn;
      newInfo['Total Wears'] = totalWears;
      newInfo['Moved'] = '';

      // Add the new map to the list
      value.add(newInfo);

      //Ready to move....
      classData[key] = value;
    });

    //CLASS D
    classD.forEach((key, value) {
      Map info = value[value.length - 1];

      // Update wears
      int randomWears = random.nextInt(
          8); // Assuming worn max once per week --item is worn up to 8 times
      int timesWorn = info['User Wears'];
      int totalWears = info['Total Wears'];
      timesWorn += randomWears;
      totalWears += randomWears;

      // Create a new map with updated values
      Map newInfo = Map.from(info); // Create a copy of the original map
      newInfo['User Wears'] = timesWorn;
      newInfo['Total Wears'] = totalWears;
      newInfo['Moved'] = '';

      // Add the new map to the list
      value.add(newInfo);

      //Ready to move....
      classData[key] = value;
    });
    exchange(classData);
  }

  exchange(Map<String, List> classData) {
    // Clean data
    Map<String, List> cleanedClassData = {};
    classData.forEach((key, value) {
      if (value.isNotEmpty && value[value.length - 1]['User Wears'] > 6) {
        cleanedClassData[key] = value;
      }
    });

    // If there are items ready...
    if (cleanedClassData.isNotEmpty) {
      print('Ready to move');

      List exchangeA = [];
      List sellA = [];
      List donationA = [];
      List exchangeB = [];
      List sellB = [];
      List donationB = [];

      // Find Class
      cleanedClassData.forEach((key, value) {
        if (value[value.length - 1]['Class'] == 'A') {
          Map info = {key: value};
          exchangeA.add(info);
        } else if (value[value.length - 1]['Class'] == 'B') {
          Map info = {key: value};
          exchangeB.add(info);
        }
      });

      // Then perform an exchange for A...

      if (exchangeA.isNotEmpty) {
        if (exchangeA.length > 1) {
          Map item1 =
              exchangeA[0].values.first[exchangeA[0].values.first.length - 1];
          item1['Item'] = exchangeA[0].keys.toString();
          Map item2 = {};
          for (int i = 0; i < exchangeA.length; i++) {
            if (item1['Wardrobe'] !=
                exchangeA[i].values.first[exchangeA[i].values.first.length - 1]
                    ['Wardrobe']) {
              item2 = exchangeA[i]
                  .values
                  .first[exchangeA[i].values.first.length - 1];
              item2['Item'] = exchangeA[i].keys.toString();
            }
            if (item2.isNotEmpty) {
              // Now perform exchange
              int wardrobe = item1['Wardrobe'];
              item1['Wardrobe'] = item2['Wardrobe'];
              item2['Wardrobe'] = wardrobe;
              item1['Moved'] =
                  'Swapped Wardrobe${item2['Wardrobe']} Class${item2['Class']}';
              item2['Moved'] =
                  'Swapped Wardrobe${item1['Wardrobe']} Class${item1['Class']}';

              // Reset wears
              item1['User Wears'] = 0;
              item2['User Wears'] = 0;

              // Value of item
              item1['Price'] = (item1['Price'] - (item1['Price'] / 4)).toInt();
              item2['Price'] = (item2['Price'] - (item1['Price'] / 4)).toInt();

              // print(item2);

              for (Map item in exchangeA) {
                if (item != exchangeA[0] && item != exchangeA[i]) {
                  sellA.add(item);
                }
              }

              break;
            }
          }
        } else {
          sellA.add(exchangeA.first);
        }
      }

      // Perform Sale/Donation/dispose to B C D
      if (sellA.isNotEmpty) {
        //randomly choose to sell/donate/dispose
        int what2do = random.nextInt(5); //0,1, - sell 2,3 -donate -4 dispose

        if (what2do == 0 || what2do == 1) {
          //sell

          Map item2Sell = sellA[random.nextInt(sellA.length)];
          Map item = item2Sell.values.first[item2Sell.values.first.length - 1];

          print(item);

          item['Price'] = (item['Price'] / 2).toInt();
          item['Condition'] = 'Very Good';

          item['Class'] = 'B';
          classB.forEach((key, value) {
            wardrobesB.add(value[value.length - 1]['Wardrobe']);
          });

          wardrobesB = wardrobesB.toSet().toList();

          item['Wardrobe'] = wardrobesB[random.nextInt(2)];
          item['Moved'] = 'Sold Wardrobe${item['Wardrobe']}';
          item['User Wears'] = 0;
        } else if (what2do == 2 || what2do == 3) {
          //donate to D
          donationA = sellA;
          Map item2Donate = donationA[random.nextInt(donationA.length)];
          Map item =
              item2Donate.values.first[item2Donate.values.first.length - 1];

          item['Price'] = (item['Price'] / 3).toInt();
          item['Condition'] = 'Satisfactory';
          item['Class'] = 'D';
          classD.forEach((key, value) {
            wardrobesD.add(value[value.length - 1]['Wardrobe']);
          });

          wardrobesD = wardrobesD.toSet().toList();

          item['Wardrobe'] = wardrobesD[random.nextInt(2)];
          item['Moved'] = 'Donate Wardrobe${item['Wardrobe']}';
          item['User Wears'] = 0;
        } else {
          print('donate');
        }
      }

      // Then perform an exchange for B.....

      if (exchangeB.isNotEmpty) {
        if (exchangeB.length > 1) {
          Map item1 =
              exchangeB[0].values.first[exchangeB[0].values.first.length - 1];
          item1['Item'] = exchangeB[0].keys.toString();
          Map item2 = {};
          for (int i = 0; i < exchangeB.length; i++) {
            if (item1['Wardrobe'] !=
                exchangeB[i].values.first[exchangeB[i].values.first.length - 1]
                    ['Wardrobe']) {
              item2 = exchangeB[i]
                  .values
                  .first[exchangeB[i].values.first.length - 1];
              item2['Item'] = exchangeB[i].keys.toString();
            }
            if (item2.isNotEmpty) {
              // Now perform exchange
              int wardrobe = item1['Wardrobe'];
              item1['Wardrobe'] = item2['Wardrobe'];
              item2['Wardrobe'] = wardrobe;
              item1['Moved'] =
                  'Swapped Wardrobe${item2['Wardrobe']} Class${item2['Class']}';
              item2['Moved'] =
                  'Swapped Wardrobe${item1['Wardrobe']} Class${item1['Class']}';

              // Reset wears
              item1['User Wears'] = 0;
              item2['User Wears'] = 0;

              // Value of item
              item1['Price'] = (item1['Price'] - (item1['Price'] / 4)).toInt();
              item2['Price'] = (item2['Price'] - (item1['Price'] / 4)).toInt();

              for (Map item in exchangeB) {
                if (item != exchangeB[0] && item != exchangeB[i]) {
                  sellB.add(item);
                }
              }

              break;
            }
          }
        } else {
          sellB.add(exchangeB.first);
        }
      }
      //randomly choose to sell/donate/dispose
      int what2do = random.nextInt(5); //0,1, - sell 2,3 -donate -4 dispose

      if (what2do == 0 || what2do == 1) {
        // Perform Sale to C
        if (sellB.isNotEmpty) {
          Map item2Sell = sellB[random.nextInt(sellB.length)];
          Map item = item2Sell.values.first[item2Sell.values.first.length - 1];

          print(item);

          item['Price'] = (item['Price'] / 2).toInt();
          item['Condition'] = 'Very Good';
          item['Class'] = 'C';
          classC.forEach((key, value) {
            wardrobesC.add(value[value.length - 1]['Wardrobe']);
          });

          wardrobesC = wardrobesC.toSet().toList();

          item['Wardrobe'] = wardrobesC[random.nextInt(2)];
          item['Moved'] = 'Sold Wardrobe${item['Wardrobe']}';
          item['User Wears'] = 0;
        } else if (what2do == 2 || what2do == 3) {
          //donate to D
          donationB = sellB;
          Map item2Donate = donationB[random.nextInt(donationB.length)];
          Map item =
              item2Donate.values.first[item2Donate.values.first.length - 1];

          item['Price'] = (item['Price'] / 3).toInt();
          item['Condition'] = 'Satisfactory';
          item['Class'] = 'D';
          classD.forEach((key, value) {
            wardrobesD.add(value[value.length - 1]['Wardrobe']);
          });

          wardrobesD = wardrobesD.toSet().toList();

          item['Wardrobe'] = wardrobesD[random.nextInt(2)];
          item['Moved'] = 'Donate Wardrobe${item['Wardrobe']}';
          item['User Wears'] = 0;
        } else {
          print('donate');
        }
      }
    }
  }

  Color cellColour = Colors.white;
  Color cellColours(timesWorn, moved) {
    if (timesWorn >= 7) {
      cellColour =
          Colors.cyan; //cell is highlighted cyan when ready for exchange
    } else {
      cellColour = Colors.white;
    }

    if (moved.contains('Swapped')) {
      cellColour = Colors.lime;
    } else if (moved.contains('Sold')) {
      cellColour = Colors.deepOrange;
    } else if (moved.contains('Donate')) {
      cellColour = Colors.amber;
    }
    return cellColour;
  }

  @override //remobve grid view make go one after another
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //--------------------------------------------------------------------class A
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          simulate();
                        });
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                      ),
                    ),
                    const Text('Class A Starting Point'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context)
                      .size
                      .height, // Set height to half the screen height
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Table(
                      border: TableBorder.all(color: Colors.black),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        // Headers 1+ how many months
                        TableRow(
                          decoration:
                              const BoxDecoration(color: Colors.black12),
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
                              classA.values.first.length,
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
                          classA.length,
                          (itemIndex) => TableRow(
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            children: [
                              //1 cell per row containing name
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      '${classA.keys.toList()[itemIndex]}',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ),
                              ),
                              // Generate cells for each month
                              ...List.generate(
                                classA.values.first.length,
                                (monthIndex) => TableCell(
                                  child: Container(
                                    color: cellColours(
                                        classA[classA.keys.toList()[itemIndex]]
                                            ?[monthIndex]['User Wears'],
                                        classA[classA.keys.toList()[itemIndex]]
                                            ?[monthIndex]['Moved']),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          '${classA.values.toList()[itemIndex][monthIndex]}',
                                          style: TextStyle(fontSize: 10),
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
                ),
              ],
            ),

            //--------------------------------------------------------------------class B
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Class B Starting Point'),
                SizedBox(
                  height: MediaQuery.of(context)
                      .size
                      .height, // Set height to half the screen height
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Table(
                      border: TableBorder.all(color: Colors.black),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        // Headers 1+ how many months
                        TableRow(
                          decoration:
                              const BoxDecoration(color: Colors.black12),
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
                              classB.values.first.length,
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
                          classB.length,
                          (itemIndex) => TableRow(
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            children: [
                              //1 cell per row containing name
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      '${classB.keys.toList()[itemIndex]}',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ),
                              ),
                              // Generate cells for each month
                              ...List.generate(
                                classB.values.first.length,
                                (monthIndex) => TableCell(
                                  child: Container(
                                    color: cellColours(
                                        classB[classB.keys.toList()[itemIndex]]
                                            ?[monthIndex]['User Wears'],
                                        classB[classB.keys.toList()[itemIndex]]
                                            ?[monthIndex]['Moved']),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          '${classB.values.toList()[itemIndex][monthIndex]}',
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
                ),
              ],
            ),

            //--------------------------------------------------------------------class C
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Class C Starting Point'),
                SizedBox(
                  height: MediaQuery.of(context)
                      .size
                      .height, // Set height to half the screen height
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Table(
                      border: TableBorder.all(color: Colors.black),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        // Headers 1+ how many months
                        TableRow(
                          decoration:
                              const BoxDecoration(color: Colors.black12),
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
                              classC.values.first.length,
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
                          classC.length,
                          (itemIndex) => TableRow(
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            children: [
                              //1 cell per row containing name
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      '${classC.keys.toList()[itemIndex]}',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ),
                              ),
                              // Generate cells for each month
                              ...List.generate(
                                classC.values.first.length,
                                (monthIndex) => TableCell(
                                  child: Container(
                                    color: cellColours(
                                        classC[classC.keys.toList()[itemIndex]]
                                            ?[monthIndex]['User Wears'],
                                        classC[classC.keys.toList()[itemIndex]]
                                            ?[monthIndex]['Moved']),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          '${classC.values.toList()[itemIndex][monthIndex]}',
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
                ),
              ],
            ),

            //--------------------------------------------------------------------class D
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Class D Starting Point'),
                SizedBox(
                  height: MediaQuery.of(context)
                      .size
                      .height, // Set height to half the screen height
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Table(
                      border: TableBorder.all(color: Colors.black),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        // Headers 1+ how many months
                        TableRow(
                          decoration:
                              const BoxDecoration(color: Colors.black12),
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
                              classD.values.first.length,
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
                          classD.length,
                          (itemIndex) => TableRow(
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            children: [
                              //1 cell per row containing name
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      '${classD.keys.toList()[itemIndex]}',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ),
                              ),
                              // Generate cells for each month
                              ...List.generate(
                                classD.values.first.length,
                                (monthIndex) => TableCell(
                                  child: Container(
                                    color: cellColours(
                                        classD[classD.keys.toList()[itemIndex]]
                                            ?[monthIndex]['User Wears'],
                                        classD[classD.keys.toList()[itemIndex]]
                                            ?[monthIndex]['Moved']),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          '${classD.values.toList()[itemIndex][monthIndex]}',
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