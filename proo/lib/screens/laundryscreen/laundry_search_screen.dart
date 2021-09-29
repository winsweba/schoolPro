import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nm/screens/laundryscreen/Laundrydetails.dart';
import 'package:nm/screens/carwashscreen/details.dart';
import 'package:nm/screens/laundryscreen/laundry_home.dart';
import 'package:nm/screens/sign_in.dart';

class LaundeyearchScreen extends StatefulWidget {

  @override
  _LaundeyearchScreenState createState() => _LaundeyearchScreenState();
}

class _LaundeyearchScreenState extends State<LaundeyearchScreen> {

  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "";

  QuerySnapshot items;

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search here...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30)
      ),
      onChanged: (query) => updateSearchQuery(query),
    );
  }

  List<Widget> _buildActions() {
    if(_isSearching){
      return <Widget>[
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if(_searchQueryController == null || _searchQueryController.text.isEmpty ) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        )
      ];
    }

    return <Widget> [
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      )
    ];
  }

  _startSearch () {
    ModalRoute.of(context).addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
          _isSearching = true;
        });
  }
  updateSearchQuery(String newQuery ) {
    setState(() {
          getResults();

          searchQuery = newQuery;
        });

  }

  _stopSearching( ) {
    setState(() {
          _clearSearchQuery();

          _isSearching = false;
        });

  }

  _clearSearchQuery( ) {
    setState(() {
          _searchQueryController.clear();
          updateSearchQuery("");
        });

  }

  _buildTitle(BuildContext context){
    return Text("Search SHop");
  }


  _buildBackButton (){
    return IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white,),
      onPressed: () {
        Route newRoute = MaterialPageRoute(builder: (context) => HomePageLon());
        Navigator.pushReplacement(context, newRoute);
      },
    );
  }

  getResults() {
    FirebaseFirestore.instance.collection("laundry")
    .where("laundryName", isGreaterThanOrEqualTo: _searchQueryController.text.trim()).get().then((results) {
      setState(() {
              items = results;
            });
    });

    print("Result = " + items.docs[0].get('itmeModel'));
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _buildBackButton(),
        title: _isSearching ? _buildSearchField() : _buildTitle(context),
        actions: _buildActions(),
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [
                Colors.deepPurple[300],
                Colors.deepPurple
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
     ),
     body: (items != null) ? ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: items.docs.length,
              itemBuilder: (BuildContext context, int i) {
                return BuildImageInteractionCard(
                  image: items.docs[i].get("image"),
                  laundName:items.docs[i].get("laundryName"),
                  descrbtion: items.docs[i].get("descrbtion"),
                );
              },
            ) : Center(child: CircularProgressIndicator(),), 
     );
  }
}


class BuildImageInteractionCard extends StatelessWidget {
  final String image;
  final String descrbtion;
  final String laundName;

  BuildImageInteractionCard({
    this.descrbtion,
    this.image,
    this.laundName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 8,
      child: Column(
        children: [
          Stack(
            children: [
              Ink.image(
                image: NetworkImage(image),
                height: 200,
                child: InkWell(
                  onTap: () {
                    if (FirebaseAuth.instance.currentUser == null) {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => SignIn()));
                    } else {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          //TODO Add  this
                          builder: (context) => LaundryDetails(laundName),
                        ),
                      );
                    }
                  },
                ),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Text(
                  laundName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16).copyWith(bottom: 0),
            child: Text(
              descrbtion,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
