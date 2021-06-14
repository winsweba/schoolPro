import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nm/block/toast_message.dart';
import 'package:nm/servers/firestore_service.dart';

// class Details extends MaterialPageRoute<Null> {
//   Details()
//       : super(builder: (BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black45,
//         title: Text('Enter your details'),
//         elevation: 5.0,
//         centerTitle: true,
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(
//           vertical: 50.0,
//           horizontal: 10.0,
//         ),
//         child: Form(
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 validator: (String value) {
//                   if (value.isEmpty) {
//                     return 'Full name cannot be empty';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Full Name',
//                   hintText: 'Enter your full name here',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Phone number',
//                     hintText: 'Enter your Phone number here',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Location',
//                     hintText: 'Enter your Location here',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Car Type',
//                     hintText: 'Enter your Car here',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(Icons.done_sharp),
//         backgroundColor: Colors.black45,
//       ),
//     );
//   });
// }

class DetailsScreen extends StatefulWidget {

  final String washingBayName; //TODO Add  this

   DetailsScreen(this.washingBayName,); //TODO Add  this
 

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController locationTextEditingController = TextEditingController();
  TextEditingController carTypeTextEditingController = TextEditingController();


  //  StreamSubscription<QuerySnapshot> subscription;
  // List<DocumentSnapshot> washingBayList;
  // final CollectionReference collectionReference =
  //     FirebaseFirestore.instance.collection("hairstyles");

  //     @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   subscription = collectionReference.snapshots().listen((datasnapshot) {
  //     setState(() {
  //       washingBayList = datasnapshot.docs;
  //     });
  //   });

  // }

  // String imgPath = wallpapersList[i].get("hair");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text('Enter your details'),
        elevation: 5.0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 10.0,
        ),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                // TODO make sure to style the text 
                
                Text(widget.washingBayName),

                SizedBox(height: 20,),
                TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Full name cannot be empty';
                    }
                    return null;
                  },
                  controller: nameTextEditingController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Enter your full name here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneTextEditingController,
                    decoration: InputDecoration(
                      labelText: 'Phone number',
                      hintText: 'Enter your Phone number here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: locationTextEditingController,
                    decoration: InputDecoration(
                      labelText: 'Location',
                      hintText: 'Enter your Location here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: carTypeTextEditingController,
                    decoration: InputDecoration(
                      labelText: 'Car Type',
                      hintText: 'Enter your Car here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           if (nameTextEditingController.text.length < 3 )
                  {
                    displayToastMessage("Name must be at lest 3 characters.", context);
                  }

                  else if (phoneTextEditingController.text.length < 9 )
                  {
                     displayToastMessage("Check your phone number", context);
                  }
                  else if (locationTextEditingController.text.length < 2 )
                  {
                    displayToastMessage("Put in the right Location", context);
                  }
                  else if (carTypeTextEditingController.text.length < 2 )
                  {
                    displayToastMessage("Check Car name", context);
                  }
                  else
                {
                  makeRequest(context);
                  displayToastMessage("Thanks for making this request ", context);
                  Navigator.pop(context);
                }
        },
        child: Icon(Icons.done_sharp),
        backgroundColor: Colors.black45,
      ),
    );
  }
  
  void makeRequest(BuildContext context){
    try{
            infoUserSetup(
            nameTextEditingController.text, 
            phoneTextEditingController.text, 
            locationTextEditingController.text, 
            carTypeTextEditingController.text, 
            //TODO Add  this
            widget.washingBayName);
          }catch(e){
            print(e.toString());
            displayToastMessage("Error:::: " + e.toString(),context);
          }
  }
}