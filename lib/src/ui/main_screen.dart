import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:publishpoint/src/bloc/home_bloc/home_bloc.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/constants/responsivness.dart';
import 'package:publishpoint/src/dialog/bottom_dialog.dart';
import 'package:publishpoint/src/model/api/journal_list_model.dart';
import 'package:publishpoint/src/ui/about_project/about_project_screen.dart';
import 'package:publishpoint/src/ui/cotacts/contacts_screen.dart';
import 'package:publishpoint/src/widget/app/custom_scroll_loading.dart';
import 'package:publishpoint/src/widget/mobile/magazine_item_widget.dart';
import 'package:publishpoint/src/widget/web/magazine/web_magazine_center_widget.dart';
import 'package:publishpoint/src/widget/web/magazine/web_table_header_widget.dart';
import 'package:publishpoint/src/widget/web/magazine/web_table_row_widget.dart';
import 'package:publishpoint/src/widget/app/bottom_column_widget.dart';
import 'package:publishpoint/src/widget/app/bottom_row_widget.dart';
import 'package:publishpoint/src/widget/app/changable_container.dart';
import 'package:publishpoint/src/widget/app/main_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0,
      sportIndex = -1,
      infoIndex = -1,
      screenIndex = 0,
      sortIndex = -1;
  final ScrollController _scrollController = ScrollController();
  final textController = TextEditingController();
  bool isListOpen = true, isAboutMagazineOpen = false, onSearchActive = false;
  String selectedSort = '', sortType = 'asc';

  int sportPage = 1, infoPage = 1, perPage = 10;
  bool addSportData = true,
      addInfoData = true,
      loadSportData = false,
      loadInfoData = false;

  String? priceSort,
      nextDateSort,
      nextDateDeadlineSort,
      acceptSort,
      generalSort;

  JournalListModel sportData = JournalListModel.fromJson({});
  JournalListModel infoData = JournalListModel.fromJson({});

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getMoreSportData();
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentIndex == 0) {
          _getMoreSportData();
        } else {
          _getMoreInfoData();
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {},
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is SuccessSportJournalsState) {
            if (addSportData) {
              if (state.page == 1) {
                sportData = state.data;
              } else {
                sportData.data.addAll(state.data.data);
              }
            }
            loadSportData = !state.data.next;
          } else if (state is SuccessInfoJournalsState) {
            if (addSportData) {
              if (state.page == 1) {
                infoData = state.data;
              } else {
                infoData.data.addAll(state.data.data);
              }
            }
            loadInfoData = !state.data.next;
          }
          return Scaffold(
            backgroundColor: AppColor.bg,
            appBar: AppBar(
              titleSpacing: 0,
              elevation: 0,
              backgroundColor: AppColor.dark,
              title: MainAppBar(
                onMenuTap: (int val) {
                  screenIndex = val;
                  setState(() {});
                },
                controller: textController,
                onSearchActive: onSearchActive,
                onSearch: (bool active) {
                  onSearchActive = active;
                  setState(() {});
                },
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              ResponsiveWidget.marginHorizontal(context),
                        ),
                        child: screenIndex == 0
                            ? WebMagazineCenterWidget(
                                onTap: () {
                                  isListOpen = !isListOpen;
                                  setState(() {});
                                },
                              )
                            : screenIndex == 1
                                ? const AboutProjectScreen()
                                : const ContactsScreen(),
                      ),
                      if (ResponsiveWidget.isSmallScreen(context) ||
                          ResponsiveWidget.isMediumScreen(context))
                        const SizedBox(height: 20),
                      if (isListOpen && screenIndex == 0)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: AppColor.white,
                            border: Border.all(
                              color: AppColor.lightGray,
                              width: 1,
                            ),
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal:
                                ResponsiveWidget.marginHorizontal(context),
                          ),
                          padding: const EdgeInsets.all(36),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IntrinsicHeight(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.bg,
                                    border: Border.all(
                                      color: AppColor.divider,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.all(2),
                                  margin: const EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ResponsiveWidget.isSmallScreen(context) ||
                                              ResponsiveWidget.isMediumScreen(
                                                  context)
                                          ? Expanded(
                                              child: ChangeableContainer(
                                                isChosen: currentIndex == 0,
                                                text: 'Спортивная наука',
                                                onTap: () {
                                                  currentIndex = 0;
                                                  sportPage = 1;
                                                  loadSportData = false;
                                                  _getMoreSportData();
                                                },
                                              ),
                                            )
                                          : ChangeableContainer(
                                              isChosen: currentIndex == 0,
                                              text: 'Спортивная наука',
                                              onTap: () {
                                                currentIndex = 0;
                                                sportPage = 1;
                                                loadSportData = false;
                                                _getMoreSportData();
                                              },
                                            ),
                                      ResponsiveWidget.isSmallScreen(context) ||
                                              ResponsiveWidget.isMediumScreen(
                                                  context)
                                          ? Expanded(
                                              child: ChangeableContainer(
                                                isChosen: currentIndex == 1,
                                                text: 'Информатика',
                                                onTap: () {
                                                  currentIndex = 1;
                                                  infoPage = 1;
                                                  loadInfoData = false;
                                                  _getMoreInfoData();
                                                },
                                              ),
                                            )
                                          : ChangeableContainer(
                                              isChosen: currentIndex == 1,
                                              text: 'Информатика',
                                              onTap: () {
                                                currentIndex = 1;
                                                infoPage = 1;
                                                loadInfoData = false;
                                                _getMoreInfoData();
                                              },
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                              if (ResponsiveWidget.isMediumScreen(context) ||
                                  ResponsiveWidget.isSmallScreen(context))
                                InkWell(
                                  onTap: () {
                                    BottomDialog.showSortByDialog(
                                      context,
                                      selected: selectedSort,
                                      onSelect: (String sort, int index) {
                                        selectedSort = sort;
                                        sortIndex = index;
                                        priceSort = null;
                                        nextDateSort = null;
                                        nextDateDeadlineSort = null;
                                        acceptSort = null;
                                        generalSort = null;
                                        if (index == 0) {
                                          priceSort = 'asc';
                                        } else if (index == 1) {
                                          nextDateSort = 'asc';
                                        } else if (index == 2) {
                                          nextDateDeadlineSort = 'asc';
                                        } else if (index == 3) {
                                          acceptSort = 'asc';
                                        } else if (index == 4) {
                                          generalSort = 'asc';
                                        }
                                        if (currentIndex == 0) {
                                          sportPage = 1;
                                          loadSportData = false;
                                          _getMoreSportData();
                                        } else {
                                          infoPage = 1;
                                          loadInfoData = false;
                                          _getMoreInfoData();
                                        }
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: AppColor.lightGray,
                                        width: 1,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    margin: const EdgeInsets.only(bottom: 24),
                                    child: Row(
                                      children: [
                                        Text(
                                          selectedSort.isEmpty
                                              ? 'Сортировать по'
                                              : selectedSort,
                                          style: const TextStyle(
                                            color: AppColor.dark,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 18 / 14,
                                          ),
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(
                                          'assets/icons/arrow_bottom.svg',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (ResponsiveWidget.isMediumScreen(context) ||
                                  ResponsiveWidget.isSmallScreen(context))
                                ListView.separated(
                                  // controller: _scrollController,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    if (index ==
                                        (currentIndex == 0
                                            ? sportData.data.length
                                            : infoData.data.length)) {
                                      return CustomScrollLoading(
                                        loading: currentIndex == 0
                                            ? loadSportData
                                            : loadInfoData,
                                      );
                                    }
                                    return MagazineItemWidget(
                                      data: currentIndex == 0
                                          ? sportData.data[index]
                                          : infoData.data[index],
                                      isExpanded: isAboutMagazineOpen,
                                      onTap: () {
                                        if (currentIndex == 0) {
                                          sportIndex = index;
                                        } else {
                                          infoIndex = index;
                                        }
                                        setState(() {});
                                      },
                                    );
                                  },
                                  separatorBuilder: (_, __) {
                                    return const Divider(height: 32);
                                  },
                                  itemCount: currentIndex == 0
                                      ? sportData.data.length + 1
                                      : infoData.data.length + 1,
                                )
                              else
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: SizedBox(
                                    width: ResponsiveWidget.isCustomSize(
                                            context)
                                        ? 1366 -
                                            (ResponsiveWidget.marginHorizontal(
                                                      context,
                                                    ) *
                                                    2 +
                                                86)
                                        : MediaQuery.of(context).size.width -
                                            (ResponsiveWidget.marginHorizontal(
                                                      context,
                                                    ) *
                                                    2 +
                                                74),
                                    child: ListView.separated(
                                      // controller: _scrollController,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        if (index == 0) {
                                          return WebTableHeaderWidget(
                                            sortIndex: sortIndex,
                                            sortType: sortType,
                                            onSort: (
                                              String sortTypeVal,
                                              int index,
                                              String sort,
                                            ) {
                                              selectedSort = sort;
                                              sortIndex = index;
                                              sortType = sortTypeVal;
                                              priceSort = null;
                                              nextDateSort = null;
                                              nextDateDeadlineSort = null;
                                              acceptSort = null;
                                              generalSort = null;
                                              if (index == 0) {
                                                priceSort = sortType;
                                              } else if (index == 1) {
                                                nextDateSort = sortType;
                                              } else if (index == 2) {
                                                nextDateDeadlineSort = sortType;
                                              } else if (index == 3) {
                                                acceptSort = sortType;
                                              } else if (index == 4) {
                                                generalSort = sortType;
                                              }
                                              if (currentIndex == 0) {
                                                sportPage = 1;
                                                loadSportData = false;
                                                _getMoreSportData();
                                              } else {
                                                infoPage = 1;
                                                loadInfoData = false;
                                                _getMoreInfoData();
                                              }
                                            },
                                          );
                                        }
                                        if (index ==
                                            (currentIndex == 0
                                                ? sportData.data.length + 1
                                                : infoData.data.length + 1)) {
                                          return CustomScrollLoading(
                                            loading: currentIndex == 0
                                                ? loadSportData
                                                : loadInfoData,
                                          );
                                        }
                                        return WebTableRowWidget(
                                          data: currentIndex == 0
                                              ? sportData.data[index - 1]
                                              : infoData.data[index - 1],
                                          isExpanded: currentIndex == 0
                                              ? sportIndex == index
                                              : infoIndex == index,
                                          onTap: () {
                                            if (currentIndex == 0) {
                                              if (sportIndex == index) {
                                                sportIndex = -1;
                                              } else {
                                                sportIndex = index;
                                              }
                                            } else {
                                              if (infoIndex == index) {
                                                infoIndex = -1;
                                              } else {
                                                infoIndex = index;
                                              }
                                            }
                                            setState(() {});
                                          },
                                        );
                                      },
                                      separatorBuilder: (_, __) {
                                        return const Divider(height: 32);
                                      },
                                      itemCount: currentIndex == 0
                                          ? sportData.data.length + 2
                                          : infoData.data.length + 2,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 72),
                      if (ResponsiveWidget.isSmallScreen(context) ||
                          ResponsiveWidget.isMediumScreen(context))
                        const BottomColumnWidget(),
                    ],
                  ),
                ),
                if (ResponsiveWidget.isLargeScreen(context) ||
                    ResponsiveWidget.isCustomSize(context))
                  const BottomRowWidget(),
              ],
            ),
          );
        },
      ),
    );
  }

  void _getMoreSportData() {
    if (!loadSportData) {
      addSportData = true;
      BlocProvider.of<HomeBloc>(context).add(
        AllSportJournalsEvent(
          sportPage,
          perPage,
          priceSort,
          nextDateSort,
          nextDateDeadlineSort,
          acceptSort,
          generalSort,
        ),
      );
      sportPage++;
    }
  }

  void _getMoreInfoData() {
    if (!loadInfoData) {
      addInfoData = true;
      BlocProvider.of<HomeBloc>(context).add(
        AllInfoJournalsEvent(
          infoPage,
          perPage,
          priceSort,
          nextDateSort,
          nextDateDeadlineSort,
          acceptSort,
          generalSort,
        ),
      );
      infoPage++;
    }
  }
}
