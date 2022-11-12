import 'package:flutter/material.dart';
import 'package:flutter_web/components/data_manager.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../components/footer.dart';
import '../../components/header.dart';
import '../../components/side_menu.dart';
import '../../components/jumbotron.dart';
import '../../components/jumbotron2.dart';
import '../../components/jumbotron3.dart';
import 'package:sliver_tools/sliver_tools.dart';

/*
   TODO: 

		✅(feat) Scroll down to section on nav or button click
		❌(feat) Complete about and pricing jumbo
		❌(bug) Darken banner so text is more visible
*/

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ItemScrollController itemScrollController = ItemScrollController();
    final ItemPositionsListener itemPositionsListener =
        ItemPositionsListener.create();

    return Scaffold(
      endDrawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300),
        child: SideMenu(),
      ),
      body: ScrollablePositionedList.builder(
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            color: Color(0xfff7eee6),
            child: Column(
              children: [
                if (index == 0)
                  Jumbotron(itemScrollController: itemScrollController),
                if (index == 1) Jumbotron2(),
                if (index == 2) Jumbotron3(),
                if (index == 3) Footer(),
              ],
            ),
          );
        },
      ),

      // CustomScrollView(
      // slivers: [
      // MultiSliver(
      // children: [
      // SliverToBoxAdapter(
      // child: Header(),
      // ),
      // SliverToBoxAdapter(
      // child: Jumbotron(),
      // ),
      // SliverToBoxAdapter(
      // child: Jumbotron2(),
      // ),
      // SliverToBoxAdapter(
      // child: Footer(),
      // ),
      // ],
      // ),
      // ],
      // ),
    );
  }
}
