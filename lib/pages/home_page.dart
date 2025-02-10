import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TopPortion(),
          
          SearchPortion(),
        ],
      )),
    );
  }
}
class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  int selectedIndex = 0;
  final List<String> categories = [
    "POPULAR","POPULAR","POPULAR","POPULAR",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 35),
      child: SingleChildScrollView(
        child: Row(
          children: categories
              .map(
              (category) {
                int index = categories.indexOf(category);
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: selectedIndex == index ? AppColors.primaryGreen:AppColors.textBlack.withOpacity(0.5),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.only(top: 7),
                          padding: EdgeInsets.symmetric(horizontal: selectedIndex == index ? 26 : 0, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: selectedIndex == index ? AppColors.primaryGreen : Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
          ).toList(),
        ),
      ),
    );
  }
}

class SearchPortion extends StatelessWidget {
  const SearchPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 30, top: 35, right: 30),
      child: Row(
        children: [
          Expanded(child: TextField(
            decoration: InputDecoration(
              fillColor: AppColors.lightGray,
              filled: true,
              prefixIcon: IconButton(onPressed: null, icon: SvgPicture.asset("assets/icons/home.svg"),),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12)
              )
            ),
          )),
          const SizedBox(width: 10),
          CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: (){}, 
              child: Container(
                height: 50, 
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: SvgPicture.asset("assets/icons/home.svg"),
              )
          )
        ],
      ),
    );
  }
}


class TopPortion extends StatelessWidget {
  const TopPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Welcome to",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SvgPicture.asset("assets/icons/home.svg")
            ],
          ),
          const Text(
            "Plant Shop",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryGreen,
            ),
          )
        ],
      ),
    );
  }
}
