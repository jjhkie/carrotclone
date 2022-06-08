import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> datas = [];
  var _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
    datas = [
      {
        "cid": "1",
        "image": "assets/images/ara-1.jpg",
        "title": "네메시스 축구화275",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "2"
      },
      {
        "cid": "2",
        "image": "assets/images/ara-2.jpg",
        "title": "LA갈비 5kg팔아요~",
        "location": "제주 제주시 아라동",
        "price": "100000",
        "likes": "5"
      },
      {
        "cid": "3",
        "image": "assets/images/ara-3.jpg",
        "title": "치약팝니다",
        "location": "제주 제주시 아라동",
        "price": "5000",
        "likes": "0"
      },
      {
        "cid": "4",
        "image": "assets/images/ara-4.jpg",
        "title": "[풀박스]맥북프로16인치 터치바 스페이스그레이",
        "location": "제주 제주시 아라동",
        "price": "2500000",
        "likes": "6"
      },
      {
        "cid": "5",
        "image": "assets/images/ara-5.jpg",
        "title": "디월트존기임팩",
        "location": "제주 제주시 아라동",
        "price": "150000",
        "likes": "2"
      },
      {
        "cid": "6",
        "image": "assets/images/ara-6.jpg",
        "title": "갤럭시s10",
        "location": "제주 제주시 아라동",
        "price": "180000",
        "likes": "2"
      },
      {
        "cid": "7",
        "image": "assets/images/ara-7.jpg",
        "title": "선반",
        "location": "제주 제주시 아라동",
        "price": "15000",
        "likes": "2"
      },
      {
        "cid": "8",
        "image": "assets/images/ara-8.jpg",
        "title": "냉장 쇼케이스",
        "location": "제주 제주시 아라동",
        "price": "80000",
        "likes": "3"
      },
      {
        "cid": "9",
        "image": "assets/images/ara-9.jpg",
        "title": "대우 미니냉장고",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "3"
      },
      {
        "cid": "10",
        "image": "assets/images/ara-10.jpg",
        "title": "멜킨스 풀업 턱걸이 판매합니다.",
        "location": "제주 제주시 아라동",
        "price": "50000",
        "likes": "7"
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }

  PreferredSizeWidget _appBarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print('click');
        },
        child: Row(
          children: [Text("xx동"), Icon(Icons.arrow_drop_down)],
        ),
      ),
      elevation: 1,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svg/bell.svg", width: 22)),
      ],
    );
  }
  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label){
    return BottomNavigationBarItem(icon: SvgPicture.asset("assets/svg/${iconName}_off.svg",width:22),
    label: label);
  }


  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState((){
          _currentPageIndex = index;
        });
      },
        currentIndex: _currentPageIndex,
        selectedItemColor: Colors.black,
        items: [
          _bottomNavigationBarItem("home","홈"),
          _bottomNavigationBarItem("notes","동네생활"),
          _bottomNavigationBarItem("location","내 근처"),
          _bottomNavigationBarItem("chat","채팅"),
          _bottomNavigationBarItem("user","나의 당근"),
        ]
    );
  }


  final oCcy = new NumberFormat("#,###", "ko_KR");

  String calcStringToWon(String priceString) {
    return "${oCcy.format(int.parse(priceString))}원";
  }

  Widget _bodyWidget() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Image.asset(datas[index]['image']!,
                        width: 100, height: 100),
                    /**
                     *
                        Image.asset(datas[index]["image"]
                        여기서 The argument type 'String?' can't be assigned to the parameter type 'String'.오류
                        해당 부분이 null이 올 수 있는 데이터이기 때문에 !를 넣어 강제추출을 해준다.
                     **/
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(datas[index]['title']!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15),),
                          SizedBox(height: 5),
                          Text(datas[index]['location']!,
                            style: TextStyle(fontSize: 12, color: Colors.black
                                .withOpacity(0.3)),),
                          SizedBox(height: 5),
                          Text(calcStringToWon(datas[index]['price']!),
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          Expanded(
                            child: Container(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset("assets/svg/heart_off.svg",
                                        width: 13, height: 13),
                                    SizedBox(width: 5),
                                    Text(datas[index]['likes']!)
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ));
        }, //item Widget
        separatorBuilder: (context, index) {
          return Container(height: 1, color: Colors.black.withOpacity(0.4));
        }, //item 사이에 있는 구분선
        itemCount: 10);
  }
}
