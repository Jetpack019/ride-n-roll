import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlineshop/views/shared/appstyle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  IconData defaultProfileIcon = Icons.person;
  String profileImagePath = 'assets/images/pedalpower1.jpg';

  String name = "Jade Ross D. Banag";
  String gender = "Male";
  String contactNumber = "09169973136";
  String address = "905 Batasan St. Inaon Pulilan Bulacan";

  Future<void> _selectImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profileImagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Profile',
          style: appstyle(20, Colors.white, FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _selectImage,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                child: Icon(
                  defaultProfileIcon,
                  size: 80,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person, size: 24),
              title: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      String editedValue = '';

                      return AlertDialog(
                        title: Text('Edit Name'),
                        content: TextField(
                          onChanged: (value) {
                            editedValue = value;
                          },
                        ),
                        actions: [
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Save'),
                            onPressed: () {
                              setState(() {
                                name = editedValue;
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  name,
                  style: appstyle(20, Colors.black, FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.people, size: 24),
              title: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      String editedValue = '';

                      return AlertDialog(
                        title: Text('Edit Gender'),
                        content: TextField(
                          onChanged: (value) {
                            editedValue = value;
                          },
                        ),
                        actions: [
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Save'),
                            onPressed: () {
                              setState(() {
                                name = editedValue;
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  gender,
                  style: appstyle(16, Colors.black, FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone, size: 24),
              title: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      String editedValue =
                          ''; // Variable to hold the edited value

                      return AlertDialog(
                        title: Text(
                            'Edit Contact No.'), // Replace with the field you want to edit
                        content: TextField(
                          onChanged: (value) {
                            editedValue =
                                value; // Update the edited value as the user types
                          },
                        ),
                        actions: [
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Close the dialog without saving
                            },
                          ),
                          TextButton(
                            child: Text('Save'),
                            onPressed: () {
                              // Perform save operation with the edited value
                              // You can update the corresponding variable or trigger an update function
                              setState(() {
                                name =
                                    editedValue; // Assuming `name` is a variable that holds the current value
                              });
                              Navigator.of(context)
                                  .pop(); // Close the dialog after saving
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  contactNumber,
                  style: appstyle(16, Colors.black, FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on, size: 24),
              title: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      String editedValue =
                          ''; // Variable to hold the edited value

                      return AlertDialog(
                        title: Text(
                            'Edit Address'), // Replace with the field you want to edit
                        content: TextField(
                          onChanged: (value) {
                            editedValue =
                                value; // Update the edited value as the user types
                          },
                        ),
                        actions: [
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Close the dialog without saving
                            },
                          ),
                          TextButton(
                            child: Text('Save'),
                            onPressed: () {
                              // Perform save operation with the edited value
                              // You can update the corresponding variable or trigger an update function
                              setState(() {
                                name =
                                    editedValue; // Assuming `name` is a variable that holds the current value
                              });
                              Navigator.of(context)
                                  .pop(); // Close the dialog after saving
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  address,
                  style: appstyle(16, Colors.black, FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
