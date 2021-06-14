import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appdsds/block/bookings_block.dart';
import 'package:flutter_appdsds/block/toast_messages.dart';
import 'package:flutter_appdsds/models/booking.dart';
import 'package:flutter_appdsds/screens/signin.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context){

    var washingBay = Provider.of<WashingBlock>(context);

     return Scaffold(
        appBar: AppBar(
          title: Text("title"),
          centerTitle: true,
          backgroundColor: Colors.black45,
          elevation: 4.0,
          leading: IconButton(icon: Icon( Icons.exit_to_app), onPressed: (){
            FirebaseAuth.instance.signOut();
            displayToastMessage("You are now Logged Out", context);
             Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => SignIn()));
          }),
        ),
        body: StreamBuilder<List<Bookig>>(
          stream:  washingBay.fetchUpcomingWashingBay,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            return ListView.builder(
               padding: EdgeInsets.all(16),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                var bookingData = snapshot.data[index];
                return BookingCards(
                  name: bookingData.name,
                  phone: bookingData.phone,
                  location: bookingData.location,
                  carType: bookingData.carType,
                  washingBayName: bookingData.washingBayName,
                );
              }
            );
          }
        ),
      );
  } 

  // Widget buildRoundedCard() => Card(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(12),
  //       ),
  //       elevation: 8.0,
  //       child: Container(
  //         padding: EdgeInsets.all(16),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               'Name ',
  //               style: TextStyle(
  //                 fontSize: 20,
  //               ),
  //             ),
  //             const SizedBox(height: 4),
  //             Text(
  //               'Phone number ',
  //               style: TextStyle(fontSize: 20),
  //             ),
  //             const SizedBox(height: 4),
  //             Text(
  //               'Location ',
  //               style: TextStyle(fontSize: 20),
  //             ),
  //             const SizedBox(height: 4),
  //             Text(
  //               'Car Type ',
  //               style: TextStyle(fontSize: 20),
  //             ),
  //             const SizedBox(height: 4),
  //             Text(
  //               'Washing bay shop name ',
  //               style: TextStyle(fontSize: 20),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  // Widget buildRoundedCard1() => Card(
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(12),
  //   ),
  //   elevation: 8.0,
  //   child: Container(
  //     padding: EdgeInsets.all(16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'Name ',
  //           style: TextStyle(
  //             fontSize: 20,
  //           ),
  //         ),
  //         const SizedBox(height: 4),
  //         Text(
  //           'Phone number ',
  //           style: TextStyle(fontSize: 20),
  //         ),
  //         const SizedBox(height: 4),
  //         Text(
  //           'Location ',
  //           style: TextStyle(fontSize: 20),
  //         ),
  //         const SizedBox(height: 4),
  //         Text(
  //           'Car Type ',
  //           style: TextStyle(fontSize: 20),
  //         ),
  //         const SizedBox(height: 4),
  //         Text(
  //           'Washing bay shop name ',
  //           style: TextStyle(fontSize: 20),
  //         ),
  //       ],
  //     ),
  //   ),
  // );

  // Widget buildRoundedCard2() => Card(
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(12),
  //   ),
  //   elevation: 8.0,
  //   child: Container(
  //     padding: EdgeInsets.all(16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'Name ',
  //           style: TextStyle(
  //             fontSize: 20,
  //           ),
  //         ),
  //         const SizedBox(height: 4),
  //         Text(
  //           'Phone number ',
  //           style: TextStyle(fontSize: 20),
  //         ),
  //         const SizedBox(height: 4),
  //         Text(
  //           'Location ',
  //           style: TextStyle(fontSize: 20),
  //         ),
  //         const SizedBox(height: 4),
  //         Text(
  //           'Car Type ',
  //           style: TextStyle(fontSize: 20),
  //         ),
  //         const SizedBox(height: 4),
  //         Text(
  //           'Washing bay shop name ',
  //           style: TextStyle(fontSize: 20),
  //         ),
  //       ],
  //     ),
  //   ),
  // );

}

class BookingCards extends StatelessWidget {
  final String name;
  final String phone;
  final String location;
  final String carType;
  final String washingBayName;

  BookingCards(
    {this.name,
    this.phone,
    this.location,
    this.carType,
    this.washingBayName}
  );

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 8.0,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                phone,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 4),
              Text(
                location,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 4),
              Text(
                carType,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 4),
              Text(
                washingBayName,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      );
  }
}