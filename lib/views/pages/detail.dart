part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final dynamic cateringId;
  const DetailPage(this.cateringId);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoading = false;
  late List<Catering> cateringList;

  List<CateringDetail> cateringDetail = [];
  Future<dynamic> getDetailCatering(dynamic id) async {
    await ServerService.getCateringDetail(id).then((value) {
      setState(() {
        isLoading = false;
        cateringDetail = value;
      });
      return cateringDetail;
    });
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    getDetailCatering(widget.cateringId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: Text('Detail Catering'),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 600,
                    child: cateringDetail.isEmpty
                        ? const Center(
                            child: Text(""),
                          )
                        : ListView.builder(
                            itemCount: cateringDetail.length,
                            itemBuilder: (context, index) {
                              return LazyLoadingList(
                                  loadMore: () {},
                                  child:
                                      CateringDetailCard(cateringDetail[index]),
                                  index: index,
                                  hasMore: true);
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
          isLoading ? UiLoading.loading() : Container(),
        ],
      ),
    );
  }
}
