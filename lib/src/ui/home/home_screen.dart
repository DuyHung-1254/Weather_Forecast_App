// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:thirty_widgets/src/model/current_weather_data.dart';
import 'package:thirty_widgets/src/model/five_days_data.dart';
import 'package:thirty_widgets/src/ui/home/home_controller.dart';

// hàm viết hoa chữ cái đầu 
String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return '';
  return text.substring(0, 1).toUpperCase() + text.substring(1);
}

class HomeScreen extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<HomeController>(
        
        builder: (controller) => Column(
          
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg_sky.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: IconButton(
                          icon: Icon(
                            Icons.menu,
                            // chinrh csi 3 gach
                            color: const Color.fromARGB(255, 99, 6, 6),
                          ),
                          // chua nghix ra lam gi
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      // chỉnh thanh search
                      padding: EdgeInsets.only(top: 65, left: 20, right: 20),
                      child: TextField(
                        onChanged: (value) => controller.city = value,
                        style: TextStyle(
                          // chinhr mafu chữ thanh search 
                          color: Color.fromARGB(231, 241, 246, 245),
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) => controller.updateWeather(),
                        decoration: InputDecoration(
                          suffix: Icon(
                            Icons.search,
                            // chinrh mafu icon 
                            color: Color.fromARGB(64, 21, 11, 209),
                          ),
                          // dday cung hcinh mau
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: 'Search'.toUpperCase(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      // chỉnh big box lên hay xuống
                      alignment: Alignment(0.0, 1.0),
                      child: SizedBox(
                        // chính margin của thành phố , giống cái alignment
                        height: 20,
                        width: 10,
                        child: OverflowBox(
                          minWidth: 0.0,
                          maxWidth: MediaQuery.of(context).size.width,
                          // maxWidth: 400,  // bằng cái size.width
                          minHeight: 0.0,
                          // chỉnh chiều cao của big box
                          maxHeight: (MediaQuery.of(context).size.height /3.4),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                width: double.infinity,
                                height: double.infinity,
                                child: Card(
                                  color: Colors.white,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),


                                  child:SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(
                                          // chỉnh tên citys  trong big box, lên hay xuống
                                            top: 10, left: 20, right: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Center(
                                              child: Text(
                                                (controller.currentWeatherData != null)
                                                    ? '${controller.currentWeatherData.name}'
                                                        .toUpperCase()
                                                    : '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                      color: Colors.black45,
                                                      // chỉnh cỡ chữ tên thành phố ( big box)
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'flutterfonts',
                                                    ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                DateFormat()
                                                    .add_MMMMEEEEd()
                                                    .format(DateTime.now()),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                      color: Colors.black45,
                                                      // chỉnh chữ ben dưới big box
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'flutterfonts',
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            // chihr padding nhiệt độ big box
                                            padding: EdgeInsets.only(left: 40,top:2),

                                            child: Column(
                                              children: <Widget>[

                                                // đoạn này để hinej thị ngày này thì nhuwnoaf, gió hay mưa nhẹ
                                                Text(
                                                  (controller.currentWeatherData
                                                              .weather !=
                                                          null)
                                                     ? '${capitalizeFirstLetter(controller.currentWeatherData.weather?[0].description ?? '')}': '',
                                                      
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 16, 
                                                        fontFamily:
                                                            'flutterfonts',
                                                      ),
                                                ),
                                                // chỉnh chiều cao nhietj độ in big box
                                                SizedBox(height:2),
                                                Text(
                                                  (controller.currentWeatherData.main !=null)
                                                      ? '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline2
                                                      !.copyWith(
                                                          color: Colors.black45,
                                                          fontFamily:
                                                              'flutterfonts'),
                                                ),
                                                Text(
                                                  (controller.currentWeatherData
                                                              .main !=
                                                          null)
                                                      ? 'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      !.copyWith(
                                                        // chỉnh chữ min max ở big box
                                                        color: Colors.black45,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'flutterfonts',
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(right: 20,top:2,bottom:20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  // set hình đám mây
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        // hình đám mây
                                                          'assets/images/icon_sun.png'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    (controller.currentWeatherData
                                                                .wind !=
                                                            null)
                                                        ? 'wind ${controller.currentWeatherData.wind?.speed} m/s'
                                                        : '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        !.copyWith(
                                                          color: Colors.black45,
                                                          // chỉnh chữ wind big box
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'flutterfonts',
                                                        ),
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              // child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
              child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
              child: Column(
                children: <Widget>[
                  // chỉnh pading nguyen second box
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      padding: EdgeInsets.only(top: 120),
                      child: Align(
                        alignment: Alignment.topLeft,
                        
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'Các thành phố'.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    !.copyWith(
                                      // chirh chữ other city
                                      fontSize: 16,
                                      fontFamily: 'flutterfonts',
                                      color: Colors.black45,
                                      // fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Container(
                              // chỉnh height của list city( chỉnh nhỏ hơn là lỗi bottom...)
                              height: 120 ,
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    VerticalDivider(
                                  color: Colors.transparent,
                                  width: 5,
                                ),
                                itemCount: controller.dataList.length,
                                itemBuilder: (context, index) {
                                  CurrentWeatherData? data;
                                  (controller.dataList.length > 0)
                                      ? data = controller.dataList[index]
                                      : data = null;
                                  return Container(
                                    // contaner này để chứa list thành phố , set cao và rộng
                                    width: 150,
                                    height: 20,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Container(  
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              //tên thành phố
                                              (data != null)
                                                  ? '${data.name}'
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  !.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black45,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                            ),
                                            // nhiệt đọ của list box
                                            Text(
                                              (data != null)
                                                  // chỉnh nhiệt độ 
                                                  ? '${(data.main!.temp!- 273.15).round().toString()}\u2103'
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  !.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black45,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                            ),
                                            // img của list box
                                            Container(
                                              width: 50,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/icon-01.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),

                                            // dodanj nay chinh  đoạn description về hôm đáy của list box

                                          Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                            // thêm center để chữ ra giữa
                                            child: Center(
                                              child: Text(
                                                (data != null) ? capitalizeFirstLetter(data.weather?[0].description ?? '') : '',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context).textTheme.caption!.copyWith(
                                                  color: Colors.black45,
                                                  fontFamily: 'flutterfonts',
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),





                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            //chỉnh cái 5 ngay
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: 
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Thời tiết 5 ngày tiếp theo'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        !.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
                                  ),
                                  
                                  // Icon(
                                  //   Icons.next_plan_outlined,
                                  //   color: Colors.black45,
                                  // ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 240,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  series: <ChartSeries<FiveDayData, String>>[
                                    SplineSeries<FiveDayData, String>(
                                      dataSource: controller.fiveDaysData,
                                      xValueMapper: (FiveDayData f, _) =>
                                          f.dateTime,
                                      yValueMapper: (FiveDayData f, _) =>
                                          f.temp,
                                      color: Color.fromARGB(255, 193, 196, 207), // Thay đổi màu sắc của SplineSeries
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
  }
}
