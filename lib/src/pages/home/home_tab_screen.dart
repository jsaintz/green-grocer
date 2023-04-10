import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:green_grocer/src/common/app_name_widget.dart';
import 'package:green_grocer/src/common/custom_shimmer.dart';

import 'package:green_grocer/src/constants/app_data.dart' as data;
import 'package:green_grocer/src/constants/constants.dart';
import 'package:green_grocer/src/pages/home/components/category_tile.dart';
import 'package:green_grocer/src/pages/home/components/items_tile.dart';
import 'package:green_grocer/src/services/utils_services.dart';
import 'package:badges/badges.dart' as badges;

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  String selectedCategory = 'Frutas';
  GlobalKey<CartIconKey> gkCart = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimations(GlobalKey globalKeyImage) {
    runAddToCardAnimation(globalKeyImage);
  }

  final UtilsServices utilsServices = UtilsServices();

  bool isloading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: GestureDetector(
          onTap: () {},
          child: const AppNameWidget(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: badges.Badge(
                badgeColor: Constants.customContrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: AddToCartIcon(
                  key: gkCart,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Constants.customSwatchColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: AddToCartAnimation(
        gkCart: gkCart,
        previewDuration: const Duration(microseconds: 100),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCartAnimationMethod) {
          runAddToCardAnimation = addToCartAnimationMethod;
        },
        child: Column(
          children: [
            searchBar(),
            categoriesTab(),
            gridViewItems(),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          hintText: ' Pesquise aqui...',
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 14,
          ),
          prefix: Icon(
            Icons.search,
            color: Constants.customContrastColor,
            size: 25,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
        ),
      ),
    );
  }

  Widget categoriesTab() {
    return Container(
      padding: const EdgeInsets.only(left: 25),
      height: 40,
      child: !isloading
          ? ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTile(
                  onPressed: () {
                    setState(() {
                      selectedCategory = data.categories[index];
                    });
                  },
                  category: data.categories[index],
                  isSelected: data.categories[index] == selectedCategory,
                );
              },
              separatorBuilder: (_, index) => const SizedBox(width: 10),
              itemCount: data.categories.length,
            )
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (_) => Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 12),
                  child: CustomShimmer(
                    height: 20,
                    width: 80,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
    );
  }

  Widget gridViewItems() {
    return Expanded(
      child: !isloading
          ? GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
              ),
              itemCount: data.items.length,
              itemBuilder: (_, index) {
                return ItemsTile(
                  itemModel: data.items[index],
                  cartAnimationMethod: itemSelectedCartAnimations,
                );
              },
            )
          : GridView.count(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 9 / 11.5,
              children: List.generate(
                10,
                (index) => CustomShimmer(
                  height: double.infinity,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
    );
  }
}
