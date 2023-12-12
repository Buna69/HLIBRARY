import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hlibrary/pages/app_pages/main_pages/widgets/best_seller_cell.dart';
import 'package:hlibrary/pages/app_pages/main_pages/widgets/recently_cell.dart';
import 'package:hlibrary/pages/app_pages/main_pages/widgets/top_picks_cell.dart';
import 'package:hlibrary/pages/app_pages/search_page/search_page.dart';
import 'package:hlibrary/pages/book_read/book_read.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  List topPicksArr = [
    {
      "name": "Manga ",
      "author": "Mangaka",
      "images": "assets/images/1.jpg"
    },
    {
      "name": "Jujutsu Kaisen",
      "author": "Gege Akutami",
      "images": "assets/images/2.jpg"
    },
    {
      "name": "The Faraway Paladin",
      "author": "Kanata Yanagino",
      "images": "assets/images/3.jpg"
    },
    {
      "name": "Сарны Гэрэл",
      "author": "С.Лочин",
      "images": "assets/images/8.jpg"
    },
    {
      "name": "Харанхуй хутга",
      "author": "Төр Баянсан",
      "images": "assets/images/7.jpg"
    },
    {
      "name": "My Hero Academia",
      "author": "Kohei Horikoshi",
      "images": "assets/images/4.jpg"
    },
    {
      "name": "Хойд Дүр",
      "author": "Б.Энхбат",
      "images": "assets/images/6.jpg"
    }
  ];

  List bestArr = [
    {
      "name": "Manga ",
      "author": "Mangaka",
      "images": "assets/images/1.jpg",
      "rating": 3.7
    },
    {
      "name": "Jujutsu Kaisen",
      "author": "Gege Akutami",
      "images": "assets/images/2.jpg",
      "rating": 4.8
    },
    {
      "name": "The Faraway Paladin",
      "author": "Kanata Yanagino",
      "images": "assets/images/3.jpg",
      "rating": 4
    },
    {
      "name": "My Hero Academia",
      "author": "Kohei Horikoshi",
      "images": "assets/images/4.jpg",
      "rating": 5.0
    },
    {
      "name": "Улаан Мөчирийн Багачууд",
      "author": "Боржигон Юань-е",
      "images": "assets/images/5.jpg",
      "rating": 4.0
    },
    {
      "name": "Хойд Дүр",
      "author": "Б.Энхбат",
      "images": "assets/images/6.jpg",
      "rating": 3.0
    },
  ];

  List recentArr = [
    {
      "name": "Сарны Гэрэл",
      "author": "С.Лочин",
      "images": "assets/images/8.jpg"
    },
    {
      "name": "Харанхуй хутга",
      "author": "Төр Баянсан",
      "images": "assets/images/7.jpg"
    },
    {
      "name": "Хойд Дүр",
      "author": "Б.Энхбат",
      "images": "assets/images/6.jpg"
    },
    {
      "name": "My Hero Academia",
      "author": "Kohei Horikoshi",
      "images": "assets/images/4.jpg"
    },
    {
      "name": "Manga ",
      "author": "Mangaka",
      "images": "assets/images/1.jpg"
    },
    {
      "name": "Jujutsu Kaisen",
      "author": "Gege Akutami",
      "images": "assets/images/2.jpg"
    },
    {
      "name": "The Faraway Paladin",
      "author": "Kanata Yanagino",
      "images": "assets/images/3.jpg"
    },

  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  child: Transform.scale(
                    scale: 1.5,
                    origin: Offset(0, media.width * 0.8),
                    child: Container(
                      width: media.width,
                      height: media.width,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFB800),
                          borderRadius:
                              BorderRadius.circular(media.width * 0.5)),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    AppBar(                      
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: const Row(children: [
                        Text(
                          "Our Top Picks",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                        
                        
                      ]),
                      leading: Container(),
                      leadingWidth: 1,   
                      actions: [
                        IconButton(
                          iconSize: 35,
                          icon: const Icon(Icons.search),
                         onPressed: () {
                               Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>  SearchPage(),
                                ),);
                            },
                        ),
                      ],
                                         
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.8,
                      child: CarouselSlider.builder(
                        itemCount: topPicksArr.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          var iObj = topPicksArr[itemIndex] as Map? ?? {};
                          return TopPicksCell(
                            iObj: iObj,
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          viewportFraction: 0.45,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Row(children: [
                        Text(
                          "Bestsellers",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: media.width * 0.9,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: bestArr.length,
                          itemBuilder: ((context, index) {
                            var bObj = bestArr[index] as Map? ?? {};

                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BookReadingView(bObj: bObj,) ) );
                              },
                              child: BestSellerCell(
                                bObj: bObj,
                              ),
                            );
                          })),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Row(children: [
                        Text(
                          "Recently Viewed",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: media.width * 0.7,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: recentArr.length,
                          itemBuilder: ((context, index) {
                            var bObj = recentArr[index] as Map? ?? {};

                            return RecentlyCell(
                              iObj: bObj,
                            );
                          })),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    

                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}