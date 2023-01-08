part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<DataUser> dataUser = [];

  Future<dynamic> getDetailUser() async {
    await ServerService.getUserProfile().then((value) {
      setState(() {
        dataUser = value;
      });
      return dataUser;
    });
  }

  @override
  void initState() {
    super.initState();
    getDetailUser().then((value) => {
          dataUser = value,
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
              onPressed: () async {
                await AuthService.signOut().then((value) {
                  if (value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                    UiToast.toastOk("Logout successful!");
                  } else {
                    UiToast.toastErr("Logout failed!");
                  }
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 32),
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage("${AuthService.auth.currentUser!.photoURL}"),
            ),
            SizedBox(height: 20),
            Text("Username: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text("${dataUser[0].name}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Text("Email: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text("${AuthService.auth.currentUser!.email}",
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Text("Phone number: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            (dataUser[0].phone == "0")
                ? const Align(
                    alignment: Alignment.center,
                    child: Text("Phone number is not registered",
                        style: TextStyle(fontSize: 16)))
                : Text("${dataUser[0].phone}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Text("Email Status: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            (AuthService.auth.currentUser!.emailVerified == false)
                ? const Align(
                    alignment: Alignment.center,
                    child: Text("Email is not Verified",
                        style: TextStyle(fontSize: 16)))
                : Text("Email is Verified", style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Container(
              width: 200,
              padding: EdgeInsets.only(top: 12),
              child: ElevatedButton(
                  onPressed: () async {
                    // go to edit form
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditForm(dataUser)));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[400],
                    elevation: 0,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Edit Data")),
            ),
          ],
        ),
      ),
    );
  }
}
