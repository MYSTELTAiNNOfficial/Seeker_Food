part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  List<Catering> allCatering = [];

  Future<List<Catering>> getCatering() async {
    await ServerService.getAllCatering().then((value) {
      if (value != null) {
        setState(() {
          allCatering = value;
          isLoading = false;
        });
      }
    });
    return allCatering;
  }

  @override
  void initState() {
    isLoading = true;
    getCatering().then((value) => {
          allCatering = value,
        });
    super.initState();
  }

  @override
  void dispose() {
    allCatering.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: isLoading
          ? UiLoading.loading()
          : Column(
              children: [
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                  child: Text(
                    "Hi, ${AuthService.auth.currentUser!.displayName} !",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[600]),
                  ),
                ),
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                  child: Text(
                    "List of Catering",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[900]),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: EdgeInsets.only(bottom: 55),
                    child: allCatering.isEmpty
                        ? const Align(
                            alignment: Alignment.center, child: Text("No Data"))
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: allCatering.length,
                            itemBuilder: ((context, index) {
                              return LazyLoadingList(
                                  loadMore: () {},
                                  child: CateringCard(allCatering[index]),
                                  index: index,
                                  hasMore: true);
                            }),
                          ),
                  ),
                ),
              ],
            ),
    );
  }
}
