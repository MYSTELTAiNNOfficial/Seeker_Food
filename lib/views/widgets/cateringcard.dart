part of 'widgets.dart';

class CateringCard extends StatefulWidget {
  final Catering catering;
  const CateringCard(this.catering);

  @override
  State<CateringCard> createState() => _CateringCardState();
}

class _CateringCardState extends State<CateringCard> {
  @override
  Widget build(BuildContext context) {
    Catering catering = widget.catering;
    return Card(
      color: Colors.red[400],
      margin: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(catering.id),
            ),
          );
        },
        splashColor: Colors.red[300],
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          leading: Container(
            padding: EdgeInsets.all(3),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://seeker.api.mysteltainn.com${catering.photo!}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            catering.name!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
