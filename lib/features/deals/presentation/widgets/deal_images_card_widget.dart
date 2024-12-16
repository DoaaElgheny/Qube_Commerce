import 'package:flutter/material.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/utils/hex_color.dart';
import '../../deals_export.dart';

class DealImagesCardWidget extends StatefulWidget {
  const DealImagesCardWidget({super.key, required this.pictures});
  final List<Picture>? pictures;
  @override
  State<DealImagesCardWidget> createState() => _DealImagesCardWidgetState();
}

class _DealImagesCardWidgetState extends State<DealImagesCardWidget> {
  String selectedImage = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedImage = '${EndPoints.baseUrl}${widget.pictures!.first.filePath}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 6),
                      blurRadius: 8,
                      color: HexColor("#0000800A"))
                ],
                image: DecorationImage(
                  image: NetworkImage(selectedImage),
                  fit: BoxFit.cover,
                )),
            // child: Image.network(
            //   selectedImage,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
          ),
          Expanded(
              child: ListView.separated(
            padding: const EdgeInsets.all(5),
            scrollDirection: Axis.horizontal,
            itemCount: widget.pictures!.length,
            itemBuilder: (context, index) {
              final image =
                  '${EndPoints.baseUrl}${widget.pictures![index].filePath}';
              return GestureDetector(
                onTap: () => setState(() {
                  selectedImage = image;
                }),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: selectedImage == image
                          ? Border.all(
                              color: AppColors.primaryColor,
                              width: 2,
                            )
                          : null,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 12,
                            color: HexColor("#0000800A"))
                      ],
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      )),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
          ))
        ],
      ),
    );
  }
}
