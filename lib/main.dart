import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tempValue=0;
  int humiValue=0;

  Timer scheduleTimeout([int milliseconds = 10000]) =>
      Timer(Duration(milliseconds: milliseconds), temp);

  Timer scheduleTimeout2([int milliseconds = 10000]) =>
      Timer(Duration(milliseconds: milliseconds), humi);
  void temp(){
    setState(() {


    int min = 25;
    int max = 45;

    Random random = Random();
    tempValue = min + random.nextInt(max-min);
    scheduleTimeout(5000);
    });
  }

  void humi(){
    setState(() {
      int min = 50;
      int max = 85;

      Random random = Random();
      humiValue = min + random.nextInt(max-min);
      scheduleTimeout2(6000);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Row( //Menu-Title-Settings
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 34.5, 0, 0),
                  width: MediaQuery.of(context).size.width,
                  height: 100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: (){
                            temp();
                            humi();
                          },
                        ),
                      ),
                      Container(
                        child: const Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'ProductSansRegular',
                            ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: (){
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row( //Temperature-Humidity
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Card( //Temperature Card
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.only(top: 45.0),
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.device_thermostat,
                                color: Colors.red,
                                size: 45.0,
                              ),
                              Text(
                                '${tempValue}°C',
                                style: TextStyle(
                                  fontFamily: 'ProductSanRegular',
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                  'Temperature',
                                style: TextStyle(
                                  fontFamily: 'ProductSanRegular',
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card( //Humidity Card
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.only(top: 45.0),
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                  Icons.water_drop,
                                  color: Colors.blueAccent,
                                  size: 45.0,
                              ),
                              Text(
                                '${humiValue}%',
                                style: TextStyle(
                                  fontFamily: 'ProductSanRegular',
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                  'Humidity',
                                style: TextStyle(
                                  fontFamily: 'ProductSanRegular',
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row( //Initial: Relay Buttons
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 460.25,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 25.0),
                                child:
                                Text(
                                    'Relay Controllers',
                                  style: TextStyle(
                                    fontFamily: 'ProductSansBold',
                                    fontSize: 20.0,
                                    color: Colors.black54,
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Card( //Temperature Card
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 2,
                              child: Container(
                                margin: EdgeInsets.only(top: 45.0),
                                width: 150.0,
                                height: 100.0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                     Icon(
                                      Icons.ac_unit,
                                      color: Colors.green,
                                      size: 35.0,
                                    ),
                                     Text(
                                      'Fan',
                                      style: TextStyle(
                                        fontFamily: 'ProductSanRegular',
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card( //Humidity Card
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 2,
                              child: Container(
                                margin: EdgeInsets.only(top: 45.0),
                                width: 150.0,
                                height: 100.0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      Icons.dock,
                                      color: Colors.green,
                                      size: 35.0,
                                    ),
                                    Text(
                                      'Charger',
                                      style: TextStyle(
                                        fontFamily: 'ProductSanRegular',
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Card( //Temperature Card
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 2,
                              child: Container(
                                margin: EdgeInsets.only(top: 45.0),
                                width: 150.0,
                                height: 100.0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.laptop,
                                      color: Colors.green,
                                      size: 35.0,
                                    ),
                                    Text(
                                      'Laptop',
                                      style: TextStyle(
                                        fontFamily: 'ProductSanRegular',
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card( //Humidity Card
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 2,
                              child: Container(
                                margin: EdgeInsets.only(top: 45.0),
                                width: 150.0,
                                height: 100.0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      Icons.outlet,
                                      color: Colors.green,
                                      size: 35.0,
                                    ),
                                    Text(
                                      'Extension',
                                      style: TextStyle(
                                        fontFamily: 'ProductSanRegular',
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.w500,
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
                ),
              ],
            ),
            Row( //Initial: Logger
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 700.85,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 25.0),
                                child:
                                Text(
                                  'Device Log',
                                  style: TextStyle(
                                    fontFamily: 'ProductSansBold',
                                    fontSize: 20.0,
                                    color: Colors.black54,
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Card( //Temperature Card
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              color: Colors.blueGrey.shade100,
                              child: Container(
                                width: MediaQuery.of(context).size.width - 68,
                                height: 65.0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(8.0),
                                      child: Text(
                                        '04/04/2022 23:10:32 - Device Connected \n'
                                            '04/04/2022 23:10:35 - Access on R1 \n'
                                            '04/04/2022 23:11:35 - R1 is on \n',
                                        style: TextStyle(
                                          fontFamily: 'ProductSanRegular',
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


