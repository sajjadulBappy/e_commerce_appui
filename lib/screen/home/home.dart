import 'package:ecommerce_appui/constent.dart';
import 'package:ecommerce_appui/model/product.dart';
import 'package:ecommerce_appui/screen/details/details_screen.dart';
import 'package:ecommerce_appui/screen/home/components/categories.dart';
import 'package:ecommerce_appui/screen/home/components/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/back.svg"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              colorFilter: const ColorFilter.mode(kTextColor, BlendMode.srcIn),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              colorFilter: const ColorFilter.mode(kTextColor, BlendMode.srcIn),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Text(
                "Woman",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight:FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: kDefaultPaddin,),
            const Categories(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                      mainAxisSpacing: kDefaultPaddin/2,
                      crossAxisSpacing: kDefaultPaddin/2,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index)=> ItemCard(
                        product: products[index],
                        press: ()=> Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: products[index],
                            ),
                          ),
                        ),
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
