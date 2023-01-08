part of 'pages.dart';

class EditForm extends StatefulWidget {
  final List<DataUser> dataUser;
  const EditForm(this.dataUser);

  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();
  final ctrlUsername = TextEditingController();
  final ctrlPhone = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    ctrlUsername.text = widget.dataUser[0].name.toString();
    ctrlPhone.text = widget.dataUser[0].phone.toString();
  }

  @override
  void dispose() {
    ctrlUsername.dispose();
    ctrlPhone.dispose();
    super.dispose();
  }

  Future<dynamic> addDataToServer() async {
    var username = ctrlUsername.text.toString();
    var phone = ctrlPhone.text.toString();
    dynamic response;

    await ServerService.updateProfile(username, phone).then((value) {
      if (value != null) {
        response = jsonDecode(value.body);
        setState(() {
          isLoading = false;
        });
        if (response['status']) {
          Navigator.pushAndRemoveUntil<dynamic>(
              context,
              MaterialPageRoute<dynamic>(builder: (context) => MenuPage()),
              (route) => false);
          UiToast.toastOk(response['message']);
        } else {
          UiToast.toastErr(
              "Failed to update profile. You must change your username or phone number!");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40),
                      width: 300,
                      child: TextFormField(
                        controller: ctrlUsername,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          hintText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter new username';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: ctrlPhone,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          hintText: 'Phone',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please add phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            addDataToServer();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[400],
                          elevation: 3,
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          isLoading ? UiLoading.loading() : Container(),
        ],
      ),
    );
  }
}
