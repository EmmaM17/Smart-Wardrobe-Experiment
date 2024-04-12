//import 'dart:ffi';

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*  void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
      title: 'Experiment', // used by the OS task switcher
      home: SafeArea(
        child: Experiment(),
      ),
    ),
  );
}  

class Experiment extends StatefulWidget {
  const Experiment({super.key});

  @override
  State<Experiment> createState() => _ExperimentState();
}

class _ExperimentState extends State<Experiment> {
  //create simulation

  Random random = Random();

  //map containing info on each clothing item
  int timesWorn = 0;
  int totalWears = 0;
  int week = 0;

  Map<int, Map<String, String>> monthData = {
    0: {
      'wardrobe': '',
      'times worn by user': '0',
      'total wears': '0',
      'exchanged': ''
    }
  };

  List monthInfo = [];

  Map<String, List> itemInfo = {
    'Red Hat': [],
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
    'Polka Dot Blouse': []
  };

  List items4exchange = [];
  Color cellColour = Colors.white;

  void createWardrobe() {
    List items2asign = itemInfo.keys.toList();

    // Add 6 random clothing items to wardrobe 1
    for (int i = 0; i < 6; i++) {
      String item = items2asign[
          random.nextInt(items2asign.length)]; // Get random clothing item

      Map<String, String> info =
          Map.from(monthData[0]!); // Get a copy of info for week 0
      info['wardrobe'] = '1'; // Update info to assign it to wardrobe 1
      items2asign.remove(item); // Remove from assignment list

      monthData[0] = info;

      itemInfo[item]?.add(info); // Add info to itemInfo
    }

// Add 6 random clothing items to wardrobe 2
    for (int i = 0; i < 6; i++) {
      String item = items2asign[random.nextInt(items2asign.length)];

      Map<String, String> info = Map.from(monthData[0]!);
      info['wardrobe'] = '2';
      items2asign.remove(item);
      monthData[0] = info;

      itemInfo[item]?.add(info);
    }

// Add 6 random clothing items to wardrobe 3
    for (int i = 0; i < 6; i++) {
      String item = items2asign[random.nextInt(items2asign.length)];

      Map<String, String> info = Map.from(monthData[0]!);
      info['wardrobe'] = '3';
      items2asign.remove(item);
      monthData[0] = info;

      itemInfo[item]?.add(info);
    }
  }

  @override
  void initState() {
    super.initState();
    createWardrobe();
  }

  void simulation() {
    //increment week
    week++;

    List itemList = itemInfo.keys.toList();

    for (var item in itemList) {
      // Map<String, String> info = Map.from(monthData[0]!);
      List? infoList = itemInfo[item];
      Map<String, String> info = Map.from(infoList?[infoList.length - 1]!);
      //clear any previous exchange formatting
      info['exchanged'] = '';

      //get the times worn by user and total
      timesWorn = int.parse(info['times worn by user']!);
      totalWears = int.parse(info['total wears']!);

      //randomly generate how many times the item is worn
      int randomWears = random.nextInt(
          4); //Assuming worn max once per week --item is worn up to 4 times
      timesWorn = timesWorn + randomWears;
      totalWears = totalWears + randomWears;

      info['times worn by user'] = timesWorn.toString();
      info['total wears'] = totalWears.toString();

      itemInfo[item]?.add(info);
      monthData[week] = info;
    }
    for (var item in itemList) {
      List? infoList = itemInfo[item];
      Map<String, String> info = Map.from(infoList?[infoList.length - 1]!);
      info['item'] = item;

      if (int.parse(info['times worn by user']!) >= 7) {
        items4exchange.add(info);
        //print(items4exchange);
      }
    }

    while (items4exchange.length > 1) {
      //if (items4exchange.length % 2 == 0) {

      // Swap wardrobe values for pairs of items
      Map<String, String> item1 = items4exchange.removeAt(0);

      Map<String, String>? item2 = null;

      for (int i = 0; i < items4exchange.length; i++) {
        if (items4exchange[i]['wardrobe'] != item1['wardrobe']) {
          item2 = items4exchange.removeAt(i);
          break;
        }
      }

      if (item2 == null) {
        break;
      }

      // Perform wardrobe value swap logic here
      item1['wardrobe'] = item2['wardrobe']!;
      item2['wardrobe'] = itemInfo[item1['item']]
          ?[itemInfo[item1['item']]!.length - 1]['wardrobe'];
      // print('item 2: ${item2['wardrobe']}');

      // Reset timesWorn to 0 for both items
      item1['times worn by user'] = '0';
      item2['times worn by user'] = '0';

      //exchanged
      item1['exchanged'] = item2['item']!;
      item2['exchanged'] = item1['item']!;

      //add back to item list

      List? update = itemInfo[item1['item']];
      String itm = item1['item']!;
      item1.remove('item');
      //print('item 1 list $update');

      update?[update.length - 1] = item1;
      itemInfo[itm] = update!;

      update = itemInfo[item2['item']];
      itm = item2['item']!;
      item2.remove('item');
      //print('item 2 list $update');

      update?[update.length - 1] = item2;
      itemInfo[itm] = update!;

      //}
    }
  }

  Color cellColours(timesWorn, exchange) {
    if (int.parse(timesWorn) > 7) {
      cellColour =
          Colors.cyan; //cell is highlighted cyan when ready for exchange
    } else {
      cellColour = Colors.white;
    }

    if (exchange != '') {
      cellColour = Colors.lime;
    }
    return cellColour;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Stack(children: [
          Padding(
              padding: const EdgeInsets.all(15),
              child: Table(
                  border: TableBorder.all(color: Colors.black),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    //headers

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
                              monthData
                                  .length, //number of cells SHOULD BE NUMBER OF WEEKS
                              (index) => TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text('Month $index'),
                                    ),
                                  ))),
                        ]), // Generate dynamic rows
                    ...List.generate(
                      itemInfo.length, //number of items
                      (itemIndex) => TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                    // ignore: unnecessary_string_interpolations
                                    '${itemInfo.keys.toList()[itemIndex]}'), //name of items
                              ),
                            ),
                          ),
                          // Generate dynamic cells for each item
                          ...List.generate(
                            itemInfo.values.first
                                .length, //number of cells (goes under month)
                            (monthIndex) => TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: cellColours(
                                      itemInfo[
                                              itemInfo.keys.toList()[itemIndex]]
                                          ?[monthIndex]['times worn by user'],
                                      itemInfo[
                                              itemInfo.keys.toList()[itemIndex]]
                                          ?[monthIndex]['exchanged']),
                                  child: Center(
                                      child: Column(children: [
                                    Text(
                                      'Wardrobe: ${itemInfo[itemInfo.keys.toList()[itemIndex]]?[monthIndex]['wardrobe']}',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Text(
                                      'Times worn by user: ${itemInfo[itemInfo.keys.toList()[itemIndex]]?[monthIndex]['times worn by user']}',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Text(
                                      'Total wears: ${itemInfo[itemInfo.keys.toList()[itemIndex]]?[monthIndex]['total wears']}',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Text(
                                      'Exchanged: ${itemInfo[itemInfo.keys.toList()[itemIndex]]?[monthIndex]['exchanged']}',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ])),
                                ),
                              ),
                            ), //add weeks
                          )
                        ],
                      ),
                    )
                  ])),

          //Start Button

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    simulation();
                  });
                },
                icon: const Icon(
                  Icons.play_arrow,
                  size: 75,
                )),
          )
        ]),
      ),
    ));
  }
}*/
