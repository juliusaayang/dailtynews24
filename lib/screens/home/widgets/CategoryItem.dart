import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dailynews24/common/colors.dart';

class CategoryItem extends StatefulWidget {
  final String categoryName;
  final bool isActive;
  final Function onClick;

  const CategoryItem({
    super.key,
    required this.categoryName,
    required this.isActive,
    required this.onClick,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClick(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.categoryName[0].toUpperCase().toString() + widget.categoryName.substring(1).toString(),
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: widget.isActive ? AppColors.black : AppColors.lighterBlack,
                  fontWeight: widget.isActive ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: 100,
              height: 4,
              color: widget.isActive ?  AppColors.primary : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
