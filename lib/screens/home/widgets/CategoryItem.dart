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
      child: Container(
        width: 130,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.isActive ? AppColors.primary : AppColors.lighterBlack,
            width: widget.isActive ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        margin: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.categoryName[0].toUpperCase().toString() + widget.categoryName.substring(1).toString(),
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: widget.isActive ? AppColors.primary : AppColors.lighterBlack,
                fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
