import 'package:dailynews24/cubit/get_categories_cubit.dart';
import 'package:dailynews24/cubit/get_categories_state.dart';
import 'package:dailynews24/cubit/new_cubit.dart';
import 'package:dailynews24/cubit/new_state.dart';
import 'package:dailynews24/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  final selectedCategory = ValueNotifier<CategoryModel?>(null);

  int page = 1;
  bool isFinish = false;
  bool data = false;
  ListData listData = ListData([], false);
  List<dynamic> articles = [];

  @override
  void initState() {
    super.initState();
    //checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewCubit(),
        ),
        BlocProvider(
          create: (context) => GetCategoriesCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "DailyNews24",
              style: GoogleFonts.aBeeZee(
                fontSize: 20,
                color: AppColors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            leading: const Icon(
              Icons.settings,
              color: AppColors.white,
              size: 25,
            ),
            backgroundColor: Colors.red,
            elevation: 5,
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  size: 34,
                  color: AppColors.white,
                ),
              )
            ],
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
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
                        (index) => Skeleton(
                          isLoading: true,
                          skeleton: SkeletonItem(
                            child: Container(
                              width: 80,
                              height: 50,
                            ),
                          ),
                          child: const Text(''),
                        ),
                      ),
                    ),
                    loaded: (categories) {
                      return SizedBox(
                        height: 50,
                        width: size.width,
                        child: ValueListenableBuilder(
                          valueListenable: selectedCategory,
                          builder: (context, category, _) {
                            return ListView.builder(
                              itemCount: categories.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => CategoryItem(
                                categoryName: categories[index].name,
                                isActive: categories[index] == category,
                                onClick: () {
                                  selectedCategory.value = categories[index];
                                  context.read<NewCubit>().getNews(
                                        keyword: categories[index].id,
                                      );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              // SizedBox(
              //   height: size.height,
              //   child: LoadMore(
              //     isFinish: isFinish,
              //     onLoadMore: getNewsData,
              //     whenEmptyLoad: true,
              //     delegate: const DefaultLoadMoreDelegate(),
              //     textBuilder: DefaultLoadMoreTextBuilder.english,
              //     child: ListView.builder(
              //       itemCount: listData.data.length,
              //       itemBuilder: (context, index) => NewsCard(
              //         article: listData.data ?? [],
              //       ),
              //     ),
              //   ),
              // ),
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
                    orElse: () => const SizedBox(),
                    error: (message) {
                      return Center(
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    news: (data) {
                      return Flexible(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) => NewsCard(
                            article: data[index],
                          ),
                          shrinkWrap: true,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
