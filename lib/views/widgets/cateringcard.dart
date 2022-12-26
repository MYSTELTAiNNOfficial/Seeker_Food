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
              builder: (context) => DetailPage(),
            ),
          );
        },
        splashColor: Colors.red[300],
        child: ListTile(
          contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          // leading: Container(
          //   width: 50,
          //   height: 50,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     image: DecorationImage(
          //       image: NetworkImage(catering.photo!),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
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
