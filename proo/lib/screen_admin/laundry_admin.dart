import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nm/screens/laundryscreen/laundry_home.dart';
import 'package:nm/widget/loadin.dart';
import 'package:nm/widget/text_file.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebaseStorage;


String userId = "";

class LaundryAdminScreen extends StatefulWidget {
  @override
  _LaundryAdminScreenState createState() => _LaundryAdminScreenState();
}

class _LaundryAdminScreenState extends State<LaundryAdminScreen> {

  final TextEditingController _maneNameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _comNameTextEditingController =
      TextEditingController();
  final TextEditingController _locationTextEditingController =
      TextEditingController();
  final TextEditingController _descriptionTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userPhotoUrl = "";
  
  File _image;
  final _picker = ImagePicker();

  chooseImage() async {
    PickedFile image;
    File croppedFile;

    //Get Image From Divce
    image = await _picker.getImage(source: ImageSource.gallery);

    //Upload to Firebase
    if (image != null) {
      // _isUploading.sink.add(true);
      // Geting Image Properties
      ImageProperties properties =
          await FlutterNativeImage.getImageProperties(image.path);

      //CropImage
      if (properties.height > properties.width) {
        var yoffset = (properties.height - properties.width) / 2;
        croppedFile = await FlutterNativeImage.cropImage(
            image.path, 0, yoffset.toInt(), properties.width, properties.width);
      } else if (properties.width > properties.height) {
        var xoffset = (properties.width - properties.height) / 2;
        croppedFile = await FlutterNativeImage.cropImage(image.path,
            xoffset.toInt(), 0, properties.height, properties.height);
      } else {
        croppedFile = File(image.path);
      }

      File compressedFile = await FlutterNativeImage.compressImage(
          croppedFile.path,
          quality: 100,
          targetHeight: 600,
          targetWidth: 600);

      setState(() {
        _image = compressedFile;
      });
    } else {
      print('No Path Received');
    }
  }

  upload() async{
    showDialog(
      context: context,
      builder: (_){
        return LoadingAlertDialog();
      }
    );

    String fileName = DateTime
    .now()
    .millisecondsSinceEpoch
    .toString();

    firebaseStorage.Reference reference = 
      firebaseStorage.FirebaseStorage.instance.ref(fileName);
    firebaseStorage.UploadTask uploadTask = reference.putFile(_image);
    firebaseStorage.TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() {

    } );

    await storageTaskSnapshot.ref.getDownloadURL().then((url) {
      userPhotoUrl = url;
      print(userPhotoUrl);
      saveUserData();
      // HomePageLon
      Route newRoute =
              MaterialPageRoute(builder: (context) => HomePageLon());
          Navigator.pushReplacement(context, newRoute);
    } );

    // await storageTaskSnapshot.ref.getDownloadURL().then((url) {
    //   userImageUrl = url;
    //   print(userImageUrl);
    //   _register();
    // } );

  }

  

  void saveUserData() {
    Map<String, dynamic> userData = {
      'laundryName' : _comNameTextEditingController.text.trim(),
      'descrbtion': _descriptionTextEditingController.text.trim(),
      'image': userPhotoUrl,
      'phoneNo': _phoneTextEditingController.text.trim(),
      'email': _emailTextEditingController.text.trim(),
      'MaName': _maneNameTextEditingController.text.trim(),
      'location': _locationTextEditingController.text.trim(),
      // 'imgPro': userImageUrl,
      'time': DateTime.now(),
      'status': "not approved",
    };

    FirebaseFirestore.instance.collection('laundry').doc().set(userData);
  }


  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
    _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Laundry'),),
      body: SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Text("this hwl;llllllllll dfjskdfhlsjfered fdgrertref"),
            InkWell(
              onTap: () {
                chooseImage();
              },
              child: CircleAvatar(
                radius: _screenWidth * 0.38,
                backgroundColor: Colors.white,
                backgroundImage: _image == null ? null : FileImage(_image),
                child: _image == null
                    ? Icon(
                        Icons.add_photo_alternate,
                        size: _screenWidth * 0.15,
                        color: Colors.grey,
                      )
                    : null,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _maneNameTextEditingController,
                    data: Icons.person,
                    hintText: "C M Name",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: _comNameTextEditingController,
                    data: Icons.person,
                    hintText: "C Name",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: _emailTextEditingController,
                    data: Icons.email,
                    hintText: "Email",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: _phoneTextEditingController,
                    data: Icons.email,
                    hintText: "Phone",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: _descriptionTextEditingController,
                    data: Icons.email,
                    hintText: "Description",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: _locationTextEditingController,
                    data: Icons.person,
                    hintText: "Loction",
                    isObsecure: false,
                  ),
                  // CustomTextField(
                  //   controller: _cPasswordTextEditingController,
                  //   data: Icons.person,
                  //   hintText: "Confirm Password",
                  //   isObsecure: true,
                  // ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                upload();
              },
              color: Colors.pink,
              child: Text(
                "Regester Company now",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 4.0,
              width: _screenWidth * 0.8,
              color: Colors.pink,
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    ),
    );
  }
}
