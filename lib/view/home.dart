import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadiah_bank/controller/home.dart';
import 'package:hadiah_bank/model/customer.dart';
import 'package:hadiah_bank/theme.dart';
import 'package:hadiah_bank/widget/homeCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // const HomePage({super.key});

  late ScrollController _controller;

  HomeController home = HomeController();
  List<Map> dataMenu = [];

  String nama = "-";

  ModelsCustomer? selectedValueDropDown;
  List<ModelsCustomer> dropDownDataCustomer = [];

  @override
  initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener); //the listener for up and down.
    init();
    super.initState();
  }

  init() async {
    await getMenu();
    await getnamaCust();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
  }

  getnamaCust() async {
    await home.getnamaCust().then((value) {
      // print(value);
      setState(() {
        dropDownDataCustomer = value['data'];
      });
    });
  }

  getMenu() async {
    await home.getMenu().then((data) {
      if (data['status']) {
        setState(() {
          dataMenu = data['menu'];
        });
      }
    });
  }

  header() {
    return AppBar(
      title: Text('Beranda'),
    );
  }

  // body(BuildContext context) {
  //   return ;
  // }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: Column(children: [
          Container(
            // margin: EdgeInsets.only(top: 40),
            child: Row(
              children: [
                Container(
                  width: 200,
                  child: DropdownButtonFormField<ModelsCustomer>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: lightColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: lightColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: lightColor,
                          ),
                        ),
                      ),
                      // value: selectedValueDropDown,
                      hint: Row(
                        children: [
                          const Icon(
                            Icons.home_filled,
                            color: Colors.black,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Semua Toko",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                      items: dropDownDataCustomer.map((ModelsCustomer value) {
                        return DropdownMenuItem<ModelsCustomer>(
                          value: value,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.home_filled,
                                color: Colors.black,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                value.getName,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedValueDropDown = value;
                      }),
                ),
                Container(
                  height: 60,
                  // width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: TextButton(
                    onPressed: (() {}),
                    style: TextButton.styleFrom(
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.wallet_giftcard,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Total Hadiah',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            // height: ScreenUtil().setHeight(100),
            height: ScreenUtil().setHeight(500),
            child: ListView.builder(
                controller: _controller, //new line
                itemCount: dataMenu.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return HomeCard(
                    cust: dataMenu[index]['cust'],
                    alamat: dataMenu[index]['alamat'],
                    noHp: dataMenu[index]['noHp'],
                    status: dataMenu[index]['status'],
                    hadiah: dataMenu[index]['hadiah'],
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
