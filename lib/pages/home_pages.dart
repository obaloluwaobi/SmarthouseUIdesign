import 'package:flutter/material.dart';

import '../util/smart_device_box.dart';

class home_Page extends StatefulWidget {
  const home_Page({Key? key}) : super(key: key);

  @override
  State<home_Page> createState() => _home_PageState();
}

class _home_PageState extends State<home_Page> {

  //padding constants
  final double horizontalPadding = 30;
  final double verticalPadding = 25;
   bool _isEnabled = true;

  //list of smart devices
  List mySmartDevices = [
    //smartDevicesName,iconpath, PowerStatus
    ["Smart light","icons/light-bulb.png",true],
    ["Smart Ac","icons/air-conditioner.png",false],
    ["Smart Tv","icons/smart-tv.png",false],
    ["Smart fan","icons/fan.png",false],
  ];
  //power button switched
  void powerSwitchChanged(bool value, int index ){
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        top: _isEnabled,
        bottom: _isEnabled,
        //padding: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Custom app bar
               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: horizontalPadding,
                     vertical: verticalPadding),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      Image.asset('icons/menu.png',height: 45,color: Colors.grey[800],),
                      Icon(
                          Icons.person,
                           size: 45,
                           color: Colors.grey[800],
                      ),


                       ],),
               ),
            const SizedBox(height: 20,),
            //welcome home solomon
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: horizontalPadding,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Welcome Home'),
                  Text('Mr Hubs',style: TextStyle(fontSize: 40),),
                ],
              ),
            ),

            const SizedBox(height: 20,),
            //smart device + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text('Smart Devices'),
            ),

            Expanded(child: GridView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: mySmartDevices.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                childAspectRatio: 1/1.3,),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),

                  );

                }))
          ],
        ),
      ),
    );
  }
  }

