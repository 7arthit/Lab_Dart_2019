import 'package:flutter/material.dart';
import 'package:work3/responsive.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = displayWidth(context);
    double h = displayHeight(context);
    MediaQuery.of(context).padding.top;
    kToolbarHeight;

    Color color = Theme.of(context).backgroundColor;

    //Customized Widget โครงสร้าง ที่ 1
    Widget Section1 = Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon( //WidgetUI 1
                          Icons.star,
                          color: Colors.amber,
                          size: w * 0.05,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: w * 0.05,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: w * 0.05,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: w * 0.05,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: w * 0.05,
                        ),
                        ElevatedButton( //WidgetUI 2
                          onPressed: () {},
                          child: Text(
                            "Reviwe",
                            style: TextStyle(fontSize: w * 0.03),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purple,
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            minimumSize: Size(w * 0.15, h * 0.06),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text( //WidgetUI 3
                    "Aventador LP700-4",
                    style: TextStyle(
                      fontSize: w * 0.05,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    //เรียกใช้ ฟังชั่น Customized Widget
    Widget Section2 = Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIconTextColmn(color, 'Charge', Icons.battery_5_bar),
            _buildIconTextColmn(color, 'Range', Icons.map),
            _buildIconTextColmn(color, 'Good', Icons.car_crash),
          ],
        ),
      ),
    );

    //Customized Widget โครงสร้าง ที่ 2
    Widget Section3 = Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon( //WidgetUI 1
                      Icons.car_repair_outlined,
                      color: Colors.indigo,
                      size: w * 0.10,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text( //WidgetUI 2
                          'Fleet Assistant',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xB3FFFFFF),
                            fontSize: w * 0.025,
                          ),
                        ),
                        ElevatedButton( //WidgetUI 3
                          onPressed: () {},
                          child: Text(
                            "Test",
                            style: TextStyle(fontSize: w * 0.03),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo,
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            minimumSize: Size(w * 0.15, h * 0.08),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Battery is in need of charging.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: w * 0.03,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    //Customized Widget โครงสร้าง ที่ 3
    Widget Section4 = Container(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x37000000),
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: InkWell(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Icon( //WidgetUI 1
                            Icons.bolt,
                            color: Colors.white,
                            size: w * 0.10,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text( //WidgetUI 2
                            'Start Car',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: w * 0.03,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 10),
                          child: Text(
                            'Tap here to start your car.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: w * 0.02,
                            ),
                          ),
                        ),
                        ElevatedButton( //WidgetUI 3
                          onPressed: () {},
                          child: Text(
                            "Start",
                            style: TextStyle(fontSize: w * 0.03),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            minimumSize: Size(w * 0.15, h * 0.08),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: Color(0x39000000),
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Icon(Icons.electric_car,
                          color: Colors.white, size: w * 0.10),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Text(
                        'Car Charging',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: w * 0.03,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 10),
                      child: Text(
                        'Current Status 30m until full',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: w * 0.02,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Charg",
                        style: TextStyle(fontSize: w * 0.03),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        minimumSize: Size(w * 0.15, h * 0.08),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));

    //เรียกใช้ Customized Widget
    return MaterialApp(
      title: 'Car Center',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: Text(
            'Lamborghini',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        backgroundColor: Colors.indigo,
        body: ListView(
          children: [
            Section1, //เรียกใช้ Customized Widget 1
            Image.asset(
              'images/photo.png',
              width: MediaQuery.of(context).size.width * 0.8,
              height: h * 0.6,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2, 10, 2, 2),
            ),
            Section2, //เรียกใช้ Customized Widget ของฟังชั่น
            Section3, //เรียกใช้ Customized Widget 2
            Section4, //เรียกใช้ Customized Widget 3
          ],
        ),
      ),
    );
  }

  //กำหนดฟังชั่น Customized Widget
  Column _buildIconTextColmn(Color color, String label, IconData icon) { //Widget UI 2 อัน มี text Icon
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );
  }
}
