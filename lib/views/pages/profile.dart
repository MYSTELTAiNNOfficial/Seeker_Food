part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            Text("${AuthService.auth.currentUser!.displayName}",
                style: TextStyle(fontSize: 16)),
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
            (AuthService.auth.currentUser!.phoneNumber == null)
                ? const Align(
                    alignment: Alignment.center,
                    child: Text("Phone number is not registered",
                        style: TextStyle(fontSize: 16)))
                : Text("${AuthService.auth.currentUser!.phoneNumber}",
                    style: TextStyle(fontSize: 16)),
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
          ],
        ),
      ),
    );
  }
}
