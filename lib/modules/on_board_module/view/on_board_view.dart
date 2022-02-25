import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/on_board_model.dart';
import 'package:shop_app/modules/login_module/view/login_module.dart';
import 'package:shop_app/modules/on_board_module/components/on_board_single_component.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardView extends StatefulWidget {
  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  var boardController = PageController();

  List<OnBoardModel> onBoardModelList = [
    OnBoardModel(
      image: "assets/images/empty_cart.svg",
      title: "Empty Cart",
      body: "empty cart",
    ),
    OnBoardModel(
      image: "assets/images/online_groceries.svg",
      title: "Online Groceries",
      body: "online groceries",
    ),
    OnBoardModel(
      image: "assets/images/shopping_app.svg",
      title: "Shopping App",
      body: "shopping app",
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginModule()),
                  (Route<dynamic> route) => false);
            },
            child: Center(child: Text("SKIP")),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    if (index == onBoardModelList.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  controller: boardController,
                  itemBuilder: (context, index) => OnBoardSingleComponent(
                    onBoardModel: onBoardModelList[index],
                  ),
                  itemCount: onBoardModelList.length,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    count: onBoardModelList.length,
                    effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.orange,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 4,
                      spacing: 2,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginModule()),
                            (Route<dynamic> route) => false);
                      } else {
                        boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Icon(Icons.arrow_forward_sharp),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
