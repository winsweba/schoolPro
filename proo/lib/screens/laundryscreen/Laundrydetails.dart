
import 'package:flutter/material.dart';
import 'package:nm/block/toast_message.dart';
import 'package:nm/screens/laundryscreen/laundryanimation.dart';
import 'package:nm/screens/paymentplan.dat.dart';
import 'package:nm/servers/firestore_service.dart';

import 'laundry_home.dart';

class LaundryDetails extends StatefulWidget {

  final String laundName; //TODO Add  this

  LaundryDetails(this.laundName,); //TODO Add  this


  @override
  _LaundryDetailsState createState() => _LaundryDetailsState();
}

class _LaundryDetailsState extends State<LaundryDetails> {

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController locationTextEditingController = TextEditingController();
  TextEditingController additionalTextEditingController = TextEditingController();





  //   // TODO: implement initState


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text('Enter your details'),

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

                Text(widget.laundName),

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
                    controller: additionalTextEditingController,
                    decoration: InputDecoration(
                      labelText: 'Additional Info',
                      hintText: 'Enter your additional here',
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


          else
          {
            makeRequest(context);
          }
        },
        child: Icon(Icons.done_sharp),
        backgroundColor: Colors.lightBlue[200],
      ),
    );
  }
  void makeRequest(BuildContext context){
    try{
      infoUserLaundrySetup(
          nameTextEditingController.text,
          phoneTextEditingController.text,
          locationTextEditingController.text,
          additionalTextEditingController.text,

          //TODO Add  this
          widget.laundName);

      displayToastMessage("Thanks for making this request ", context);
      Navigator.push(
        context,
        new MaterialPageRoute(
          //TODO Add  this
          builder: (context) => HomePageLon(),
        ),
      );
    }catch(e){
      print(e.toString());
      displayToastMessage("Error:::: " + e.toString(),context);
    }
  }
}
