import 'package:favours_app/models/favour_model.dart';
import 'package:favours_app/pages/RequestFavourPage.dart';
import 'package:favours_app/widgets/favour_card_item.dart';
import 'package:flutter/material.dart';

class FavoursPage extends StatelessWidget {
  final List<Favor> pendingAnswerFavours;
  final List<Favor> acceptedFavours;
  final List<Favor> completedFavours;
  final List<Favor> refusedFavours;
  const FavoursPage(
      {Key? key,
      required this.pendingAnswerFavours,
      required this.acceptedFavours,
      required this.completedFavours,
      required this.refusedFavours})
      : super(key: key);

  Widget _buildCategoryTab(String title) {
    return Tab(
      child: Text(title),
    );
  }

  Widget _favoursList(String title, List<Favor> favours) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(title),
        ),
        Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: favours.length,
                itemBuilder: (ctx, index) {
                  final favour = favours[index];
                  return FavourCardItem(favour: favour);
                }))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Your Favours"),
          bottom: TabBar(isScrollable: true, tabs: [
            _buildCategoryTab("Requests"),
            _buildCategoryTab("Doing"),
            _buildCategoryTab("Completed"),
            _buildCategoryTab("Refused"),
          ]),
        ),
        body: TabBarView(children: [
          _favoursList("Pending Requests", pendingAnswerFavours),
          _favoursList("Doing", acceptedFavours),
          _favoursList("Completed", completedFavours),
          _favoursList("Refused", refusedFavours),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(RequestFavourPage.routeName);
          },
          child: const Icon(Icons.add),
          tooltip: "Ask for a Favour",
        ),
      ),
    );
  }
}
