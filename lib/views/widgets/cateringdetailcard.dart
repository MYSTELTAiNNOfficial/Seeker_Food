part of 'widgets.dart';

class CateringDetailCard extends StatefulWidget {
  final CateringDetail cateringDetail;
  const CateringDetailCard(this.cateringDetail);

  @override
  _CateringDetailCardState createState() => _CateringDetailCardState();
}

class _CateringDetailCardState extends State<CateringDetailCard> {
  @override
  Widget build(BuildContext context) {
    CateringDetail cateringDetail = widget.cateringDetail;
    final link = WhatsAppUnilink(
      phoneNumber: cateringDetail.phone!,
    );
    // final link = Uri.parse("whatsapp://send?phone=${cateringDetail.phone}");
    final linkAsString = link.toString();
    final linkAsUri = link.asUri();

    // Future<void> launchUrl(Uri url) async {
    //   final lin = Uri.parse("whatsapp://send?phone=${cateringDetail.phone}");
    //   if (await canLaunch(lin.toString())) {
    //     await launch(url.toString());
    //   } else {
    //     throw 'Could not launch $url';
    //   }
    // }

    return Card(
      color: Colors.red[400],
      margin: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 18),
            Container(
              padding: EdgeInsets.all(3),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://seeker.api.mysteltainn.com${cateringDetail.photo!}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 22),
            Text(
              cateringDetail.name!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              cateringDetail.location!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {
                    onPressed:
                    () async {
                      await link.asUri();
                    };
                  },
                  child: const Icon(Icons.whatsapp_rounded,
                      color: Colors.white, size: 30, semanticLabel: 'WhatsApp'),
                ),
                const SizedBox(width: 5),
                Text(
                  cateringDetail.phone!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.access_time,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                Text(
                  cateringDetail.open!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
