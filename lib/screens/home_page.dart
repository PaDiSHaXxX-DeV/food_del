import 'dart:ui';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_devilery/utils/my_colors.dart';

import '../models/k_model.dart';
import '../models/res_model.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

int Imageindicator = 0;

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 11, right: 144, top: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.2, 0.2),
                                blurRadius: 5,
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage('assets/icons/apbar.png'),
                            ),
                          ),
                        ),
                        const Text(
                          'Current Location',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Image.asset(
                          'assets/icons/past.png',
                          scale: 2,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 26, horizontal: 22),
                  child: TextField(
                    onChanged: (value) {
                      // Method For Searching
                    },
                    decoration: const InputDecoration(
                      hintText: "Searching here|",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ExpandablePageView.builder(
                            onPageChanged: (index) {
                              setState(() {
                                Imageindicator = index;
                              });
                            },
                            itemBuilder: (context, int index) {
                              return Container(
                                height: 220,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "${Res_model.res[index].img}"),
                                        fit: BoxFit.cover)),
                              );
                            },
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 22, left: 20.5),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 180),
                              child: Stack(children: [
                                Container(
                                  height: 40,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4, left: 14, bottom: 16),
                                      child: Column(
                                        children: [
                                          Text(
                                            Res_model.res[Imageindicator].name,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          Text(
                                            Res_model.res[Imageindicator].last,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ),
                                    postIndicator(Imageindicator),
                                  ],
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _tort(),
                      const SizedBox(
                        height: 26,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Promotions',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'View All >',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 8),
                          width: double.infinity,
                          height: 222,
                          child: Unfeture()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Featured',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'View All >',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return lipi(index);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 12,
                              );
                            },
                            itemCount: K_model.k_models.length),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //       bottomNavigationBar: BottomNavigationBar(
      //         type: BottomNavigationBarType.fixed,
      //         backgroundColor: My_colors.backround_E5E5E5,
      //         selectedItemColor: My_colors.F2A902,
      //         unselectedItemColor: Colors.grey.withOpacity(.60),
      //         selectedFontSize: 14,
      //         unselectedFontSize: 14,
      //         onTap: (value) {
      //           // Respond to item press.
      //         },
      //         items: const [
      //           BottomNavigationBarItem(
      //             label: '',
      //             icon: Icon(Icons.home_filled),
      //           ),
      //           BottomNavigationBarItem(
      //             label: '',
      //             icon: Icon(Icons.cast_outlined),
      //           ),
      //           BottomNavigationBarItem(
      //             label: '',
      //             icon: Icon(Icons.comment_outlined),
      //           ),
      //           BottomNavigationBarItem(
      //             label: '',
      //             icon: Icon(Icons.favorite_outline),
      //           ),
      //           BottomNavigationBarItem(
      //             label: '',
      //             icon: Icon(Icons.person_outline),
      //           ),
      //         ],
    );
  }
}

class _tort extends StatelessWidget {
  const _tort({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 24,
            width: 65,
            decoration: BoxDecoration(
              color: Color(0xFFFCF4CE),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                'Burgers',
                style: TextStyle(color: My_colors.F2A902),
              ),
            ),
          ),
          Container(
            height: 24,
            width: 55,
            decoration: BoxDecoration(
              color: Color(0xFFFFE1E1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                'Pizzas',
                style: TextStyle(color: Color(0xFFFF6060)),
              ),
            ),
          ),
          Container(
            height: 24,
            width: 65,
            decoration: BoxDecoration(
              color: Color(0xFFC9FFDA),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                'Chinese',
                style: TextStyle(color: Color(0xFF00BB13)),
              ),
            ),
          ),
          Container(
            height: 24,
            width: 80,
            decoration: BoxDecoration(
              color: Color(0xFFFFE1FE),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                'Ice Cream',
                style: TextStyle(color: Color(0xFFff5dfa)),
              ),
            ),
          ),
          Container(
            height: 24,
            width: 80,
            decoration: BoxDecoration(
              color: Color(0xFFd5f9ff),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                'Sodas',
                style: TextStyle(color: Color(0xFF00cbec)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget postIndicator(int currentIndex) {
  return Container(
    height: 12,
    margin: EdgeInsets.only(right: 24),
    child: ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index
                ? Colors.yellow
                : Colors.white.withOpacity(1),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: 8);
      },
    ),
  );
}

Widget Featured() {
  return Container(
    margin: EdgeInsets.only(right: 8, top: 8, bottom: 0, left: 8),
    child: ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 145,
          height: 145,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("${Res_model.res[index].img}"),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Text(
                  "${Res_model.res[index].img}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$\$",
                      style: TextStyle(fontSize: 16, color: Color(0xff868686)),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.grey[500], shape: BoxShape.circle),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Chinese",
                      style: TextStyle(fontSize: 16, color: Color(0xff868686)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 14,
        );
      },
      itemCount: 4,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
    ),
  );
}

Widget Unfeture() {
  return Container(
    margin: EdgeInsets.only(right: 8, top: 8, bottom: 0, left: 8),
    child: ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 190,
          height: 220,
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("${K_model.k_models[index].img}"),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    "${K_model.k_models[index].name}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${K_model.k_models[index].nametwo}",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff868686)),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 26,
                width: 180,
                color: My_colors.F2A902,
                child: Center(
                  child: Text(
                    'Flat 50% Off',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ]),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 14,
        );
      },
      itemCount: K_model.k_models.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
    ),
  );
}

Widget lipi(int index) {
  return Column(
    children: [
      Container(
        width: 332,
        // height: 110,
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage("${K_model.k_models[index].img}"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${K_model.k_models[index].name}",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 30,
                      height: 30,
                      padding: EdgeInsets.all(3.3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle),
                      child: Icon(Icons.favorite,color: Colors.white,)),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "${K_model.k_models[index].nametwo}",
                  style: TextStyle(fontSize: 16, color: Color(0xff868686)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.star_outline_sharp,
                            color: My_colors.F2A902,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "4.7",
                            style: TextStyle(
                                fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          
                          Text(
                            "(Based on 100 reviews)",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff868686)),
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        height: 14,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey,
        ),
      )
    ],
  );
}
