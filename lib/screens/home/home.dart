import 'package:dailynews24/cubit/get_categories_cubit.dart';
import 'package:dailynews24/cubit/get_categories_state.dart';
import 'package:dailynews24/cubit/new_cubit.dart';
import 'package:dailynews24/cubit/new_state.dart';
import 'package:dailynews24/models/category_model.dart';
import 'package:dailynews24/screens/home/widgets/trending_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loadmore/loadmore.dart';
import 'package:dailynews24/common/colors.dart';
import 'package:dailynews24/common/common.dart';
import 'package:dailynews24/common/widgets/no_connectivity.dart';
import 'package:dailynews24/models/listdata_model.dart';
import 'package:dailynews24/models/news_model.dart' as m;
import 'package:dailynews24/providers/news_provider.dart';
import 'package:dailynews24/screens/home/widgets/CategoryItem.dart';
import 'package:dailynews24/screens/home/widgets/newsCard.dart';
import 'package:skeletons/skeletons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final selectedCategory = ValueNotifier<CategoryModel?>(
    null,
  );

  final newsCat = const CategoryModel(id: 0, name: 'Home', slug: 'news');

  int page = 1;
  bool isFinish = false;
  bool data = false;
  ListData listData = ListData([], false);
  List<dynamic> articles = [];
  late final ScrollController newsScrollController;

  void scrollListener() {
    if (newsScrollController.position.pixels == newsScrollController.position.maxScrollExtent) {
      context.read<NewCubit>().loadMore(
            keyword: selectedCategory.value == null ? null : selectedCategory.value!.id,
          );
    }
  }

  @override
  void initState() {
    super.initState();
    selectedCategory.value = newsCat;
    newsScrollController = ScrollController()..addListener(scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Builder(
      builder: (context) {
        return ValueListenableBuilder(
          valueListenable: selectedCategory,
          builder: (context, category, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocConsumer<GetCategoriesCubit, GetCategoriesState>(
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
                      orElse: () => const SizedBox(),
                      loading: () => Row(
                        children: List.generate(
                          5,
                          (index) => const Skeleton(
                            isLoading: true,
                            skeleton: SkeletonItem(
                              child: SizedBox(
                                width: 80,
                                height: 50,
                              ),
                            ),
                            child: Text(''),
                          ),
                        ),
                      ),
                      loaded: (categories) {
                        return Container(
                          height: 40,
                          width: size.width,
                          color: Colors.white,
                          child: ListView.builder(
                            itemCount: categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => CategoryItem(
                              categoryName: categories[index].name,
                              isActive: categories[index] == category,
                              onClick: () {
                                selectedCategory.value = categories[index];
                                if (selectedCategory.value == newsCat) {
                                  context.read<NewCubit>().getNews();
                                } else {
                                  context.read<NewCubit>().getNews(
                                        keyword: categories[index].id,
                                      );
                                }
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                if (category == newsCat)
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'TRENDING',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          const Gap(10),
                          BlocProvider(
                            create: (context) => NewCubit()..getNews(keyword: 18),
                            child: Builder(builder: (context) {
                              return Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: BlocBuilder<NewCubit, NewState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      orElse: () {
                                        return const Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CircularProgressIndicator(),
                                          ],
                                        );
                                      },
                                      news: (news) {
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: List.generate(
                                              news.length,
                                              (index) => TrendingCard(
                                                article: news[index],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            }),
                          ),
                          const Gap(20),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'TOP STORIES',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          const Gap(10),
                          Flexible(
                            child: BlocProvider(
                              create: (context) => NewCubit()..getNews(),
                              child: Builder(builder: (context) {
                                return Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(0),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: BlocBuilder<NewCubit, NewState>(
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        orElse: () {
                                          return const Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CircularProgressIndicator(),
                                            ],
                                          );
                                        },
                                        news: (news) {
                                          return SingleChildScrollView(
                                            child: Column(
                                              children: List.generate(
                                                news.length,
                                                (index) => NewsCard(
                                                  article: news[index],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  BlocConsumer<NewCubit, NewState>(
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
                        noInternet: () {
                          if (mounted) {
                            Navigator.of(
                              context,
                              rootNavigator: true,
                            ).push(
                              MaterialPageRoute(
                                builder: (context) => NoConnectivity(
                                  onTap: () => context.read<NewCubit>().getNews(),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          final news = context.read<NewCubit>().news;
                          return Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: ListView.builder(
                                    controller: newsScrollController,
                                    itemCount: news.length,
                                    itemBuilder: (context, index) => NewsCard(
                                      article: news[index],
                                    ),
                                  ),
                                ),
                                state.maybeWhen(
                                  orElse: () => const SizedBox(),
                                  loadMore: () {
                                    return const Column(
                                      children: [
                                        Gap(10),
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(),
                                        ),
                                        Gap(10),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        error: (message) {
                          return Center(
                            child: Text(
                              message,
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                        loading: () => const CircularProgressIndicator(),
                      );
                    },
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
