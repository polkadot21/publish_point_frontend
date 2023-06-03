import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publishpoint/src/bloc/home_bloc/home_bloc.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/constants/responsivness.dart';
import 'package:publishpoint/src/dialog/ui/show_search_result_dialog.dart';
import 'package:publishpoint/src/model/api/journal_list_model.dart';
import 'package:publishpoint/src/model/api/spec_model.dart';
import 'package:publishpoint/src/ui/about_project/about_project_screen.dart';
import 'package:publishpoint/src/ui/contacts/contacts_screen.dart';
import 'package:publishpoint/src/ui/privacy_screen/privacy_screen.dart';
import 'package:publishpoint/src/utils/utils.dart';
import 'package:publishpoint/src/widget/app/custom_scroll_loading.dart';
import 'package:publishpoint/src/widget/app/magazine_search_widget.dart';
import 'package:publishpoint/src/widget/app/sort_by_mobile_widget.dart';
import 'package:publishpoint/src/widget/mobile/magazine_item_widget.dart';
import 'package:publishpoint/src/widget/web/magazine/web_magazine_center_widget.dart';
import 'package:publishpoint/src/widget/web/magazine/web_table_header_widget.dart';
import 'package:publishpoint/src/widget/web/magazine/web_table_row_widget.dart';
import 'package:publishpoint/src/widget/app/bottom_column_widget.dart';
import 'package:publishpoint/src/widget/app/bottom_row_widget.dart';
import 'package:publishpoint/src/widget/app/main_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int sportIndex = -1, infoIndex = -1, screenIndex = 0, sortIndex = -1;
  final ScrollController _scrollController = ScrollController();
  final textController = TextEditingController();
  final dropDownController = TextEditingController();
  bool isAboutMagazineOpen = false, onSearchActive = false;
  String selectedSort = '', sortType = 'asc';
  Timer? searchOnStoppedTyping;

  int sportPage = 1, infoPage = 1, perPage = 10, specIndex = 0;
  bool addSportData = true,
      addInfoData = true,
      loadSportData = false,
      loadInfoData = false;

  String? priceSort,
      nextDateSort,
      nextDateDeadlineSort,
      acceptSort,
      generalSort,
      search;

  JournalListModel sportData = JournalListModel.fromJson({});
  JournalListModel infoData = JournalListModel.fromJson({});

  /// added spec data
  /// lib/model/api/spec_model.dart
  List<SpecData> newSpecData = [];
  List<SpecData> specData = AppColor.specData;

  /// to show spec search dialog
  bool showCenterDialog = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getMoreSportData();
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          screenIndex == 0) {
        if (specIndex == 0) {
          _getMoreSportData();
        } else {
          _getMoreInfoData();
        }
      }
    });
    newSpecData = specData;
    dropDownController.text = newSpecData[specIndex].name;
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
    double magazineWidth = 0;
    if (ResponsiveWidget.isCustomSize(context)) {
      magazineWidth =
          1366 - (ResponsiveWidget.marginHorizontal(context) * 2 + 86);
    } else {
      magazineWidth = MediaQuery.of(context).size.width -
          (ResponsiveWidget.marginHorizontal(context) * 2 + 74);
    }
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
          return GestureDetector(
            onTap: () {
              Utils.closeKeyboard(context);
              onSearchActive = false;
              showCenterDialog = false;
              setState(() {});
            },
            child: Scaffold(
              backgroundColor: AppColor.bg,
              appBar: AppBar(
                titleSpacing: 0,
                elevation: 0,
                backgroundColor: AppColor.dark,
                toolbarHeight: 72,
                title: MainAppBar(
                  onMenuTap: (int val) {
                    screenIndex = val;
                    setState(() {});
                  },
                  controller: textController,
                  onSearchActive: onSearchActive,
                  onSearch: (bool active) {
                    setState(() {
                      onSearchActive = active;
                    });
                    if (!active) {
                      search = null;
                      if (specIndex == 0) {
                        sportPage = 1;
                        loadSportData = false;
                        _getMoreSportData();
                      } else {
                        infoPage = 1;
                        loadInfoData = false;
                        _getMoreInfoData();
                      }
                    }
                  },
                  onChanged: (String obj) {
                    if (screenIndex == 0) {
                      const duration = Duration(milliseconds: 1200);
                      if (searchOnStoppedTyping != null) {
                        searchOnStoppedTyping!.cancel();
                      }
                      searchOnStoppedTyping = Timer(
                        duration,
                        () {
                          search = obj;
                          if (specIndex == 0) {
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
                              ? const WebMagazineCenterWidget()
                              : screenIndex == 1
                                  ? const AboutProjectScreen()
                                  : screenIndex == 2
                                      ? const ContactsScreen()
                                      : const PrivacyScreen(),
                        ),
                        if (ResponsiveWidget.isSmallScreen(context) ||
                            ResponsiveWidget.isMediumScreen(context))
                          const SizedBox(height: 20),
                        if (screenIndex == 0)
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
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// added magazine search widget
                                    /// control widget removed
                                    MagazineSearchWidget(
                                      controller: dropDownController,
                                      onChanged: (obj) {
                                        showCenterDialog = true;
                                        newSpecData = specData
                                            .where(
                                              (element) =>
                                                  element.name.contains(obj),
                                            )
                                            .toList();
                                        setState(() {});
                                      },
                                      onDropDownTap: () {
                                        showCenterDialog = true;
                                        setState(() {});
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    if (ResponsiveWidget.isMediumScreen(
                                            context) ||
                                        ResponsiveWidget.isSmallScreen(context))

                                      /// sort by mobile optimised
                                      SortByMobileWidget(
                                        onSelect: (String sort, int index) {
                                          onMobileSort(sort, index);
                                        },
                                        selectedSort: selectedSort,
                                      ),
                                    if (ResponsiveWidget.isMediumScreen(
                                            context) ||
                                        ResponsiveWidget.isSmallScreen(context))
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          if (specIndex == 0
                                              ? index == sportData.data.length
                                              : index == infoData.data.length) {
                                            return CustomScrollLoading(
                                              loading: specIndex == 0
                                                  ? loadSportData
                                                  : loadInfoData,
                                            );
                                          }
                                          return MagazineItemWidget(
                                            data: specIndex == 0
                                                ? sportData.data[index]
                                                : infoData.data[index],
                                            isExpanded: isAboutMagazineOpen,
                                            onTap: () {
                                              if (specIndex == 0) {
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
                                        itemCount: specIndex == 0
                                            ? sportData.data.length + 1
                                            : infoData.data.length + 1,
                                      )
                                    else
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: SizedBox(
                                          width: magazineWidth,
                                          child: ListView.separated(
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
                                                      nextDateDeadlineSort =
                                                          sortType;
                                                    } else if (index == 3) {
                                                      acceptSort = sortType;
                                                    } else if (index == 4) {
                                                      generalSort = sortType;
                                                    }
                                                    if (specIndex == 0) {
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
                                                  (specIndex == 0
                                                      ? sportData.data.length +
                                                          1
                                                      : infoData.data.length +
                                                          1)) {
                                                return CustomScrollLoading(
                                                  loading: specIndex == 0
                                                      ? loadSportData
                                                      : loadInfoData,
                                                );
                                              }
                                              return WebTableRowWidget(
                                                data: specIndex == 0
                                                    ? sportData.data[index - 1]
                                                    : infoData.data[index - 1],
                                                isExpanded: specIndex == 0
                                                    ? sportIndex == index
                                                    : infoIndex == index,
                                                onTap: () {
                                                  if (specIndex == 0) {
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
                                            itemCount: specIndex == 0
                                                ? sportData.data.length + 2
                                                : infoData.data.length + 2,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),

                                /// spec search dialog added
                                /// shown when spec search active
                                if (showCenterDialog)
                                  Positioned(
                                    top: 56,
                                    width: 296,
                                    child: ShowSearchResultDialog(
                                      data: newSpecData,
                                      chosen: specIndex,
                                      onChoose: (String name, int index) {
                                        dropDownController.text = name;
                                        showCenterDialog = false;
                                        specIndex = index;
                                        if (specIndex == 0) {
                                          _getMoreSportData();
                                          loadSportData = false;
                                        } else {
                                          _getMoreInfoData();
                                          loadInfoData = false;
                                        }
                                        setState(() {});
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 72),
                        if (ResponsiveWidget.isSmallScreen(context) ||
                            ResponsiveWidget.isMediumScreen(context))
                          BottomColumnWidget(
                            onTap: () {
                              screenIndex = 3;
                              setState(() {});
                            },
                          ),
                      ],
                    ),
                  ),
                  if (ResponsiveWidget.isLargeScreen(context) ||
                      ResponsiveWidget.isCustomSize(context))
                    BottomRowWidget(
                      onTap: () {
                        screenIndex = 3;
                        setState(() {});
                      },
                    ),
                ],
              ),
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
          search,
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
          search,
        ),
      );
      infoPage++;
    }
  }

  /// on mobile sort method added
  void onMobileSort(String sort, int index) {
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
    if (specIndex == 0) {
      sportPage = 1;
      loadSportData = false;
      _getMoreSportData();
    } else {
      infoPage = 1;
      loadInfoData = false;
      _getMoreInfoData();
    }
  }
}
