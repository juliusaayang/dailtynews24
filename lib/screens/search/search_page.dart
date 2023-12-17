import 'package:dailynews24/common/colors.dart';
import 'package:dailynews24/cubit/search_post_cubit.dart';
import 'package:dailynews24/cubit/search_post_state.dart';
import 'package:dailynews24/screens/home/widgets/newsCard.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchPostCubit(),
      child: Builder(builder: (context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: SearchBar(
                hintText: 'Search news',
                controller: searchTextEditingController,
                leading: const Center(
                  child: Icon(Icons.search_outlined),
                ),
                onChanged: (value) {
                  EasyDebounce.debounce(
                    'search',
                    const Duration(milliseconds: 500),
                    () => context.read<SearchPostCubit>().searchNews(value),
                  );
                },
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shadowColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
            const Gap(20),
            BlocConsumer<SearchPostCubit, SearchPostState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (message) {
                    Fluttertoast.showToast(
                      msg: message,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: AppColors.lighterGray,
                      textColor: AppColors.black,
                      fontSize: 16.0,
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                  orElse: () => const SizedBox(),
                  news: (data) {
                    return data.isNotEmpty
                        ? Flexible(
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) => NewsCard(
                                article: data[index],
                              ),
                              shrinkWrap: true,
                            ),
                          )
                        : const Column(
                            children: [
                              Gap(50),
                              Text(
                                'Please search what you want',
                              ),
                            ],
                          );
                  },
                );
              },
            )
          ],
        );
      }),
    );
  }
}
