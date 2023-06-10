import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publishpoint/src/bloc/home_bloc/home_bloc.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/constants/app_data.dart';
import 'package:publishpoint/src/constants/responsivness.dart';
import 'package:publishpoint/src/dialog/ui/show_search_result_dialog.dart';
import 'package:publishpoint/src/model/api/category_enum.dart';
import 'package:publishpoint/src/model/api/journal_list_model.dart';
import 'package:publishpoint/src/model/api/spec_model.dart';
import 'package:publishpoint/src/ui/about_project/about_project_screen.dart';
import 'package:publishpoint/src/ui/contacts/contacts_screen.dart';
import 'package:publishpoint/src/ui/privacy_screen/privacy_screen.dart';
import 'package:publishpoint/src/utils/utils.dart';
import 'package:publishpoint/src/widget/app/custom_scroll_loading.dart';
import 'package:publishpoint/src/widget/app/magazine_search_widget.dart';
import 'package:publishpoint/src/widget/app/sort_by_mobile_widget.dart';
import 'package:publishpoint/src/widget/app/spec_desc_widget.dart';
import 'package:publishpoint/src/widget/mobile/magazine_item_widget.dart';
import 'package:publishpoint/src/widget/web/magazine/web_magazine_center_widget.dart';
import 'package:publishpoint/src/widget/web/magazine/web_table_header_widget.dart';
import 'package:publishpoint/src/widget/web/magazine/web_table_row_widget.dart';
import 'package:publishpoint/src/widget/app/bottom_column_widget.dart';
import 'package:publishpoint/src/widget/app/bottom_row_widget.dart';
import 'package:publishpoint/src/widget/app/main_app_bar.dart';

class MainScreen extends StatefulWidget {
  final int? index;

  const MainScreen({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int journalIndex = -1, screenIndex = 0, sortIndex = -1;
  final ScrollController _scrollController = ScrollController();
  final textController = TextEditingController();
  final dropDownController = TextEditingController();
  bool isAboutMagazineOpen = false, onSearchActive = false;
  String selectedSort = '', sortType = 'asc';
  Timer? searchOnStoppedTyping;

  int page = 1, specIndex = 0;
  bool addData = true, loadData = false;
  CategoryEnum categoryEnum = CategoryEnum.psychology;

  String? search;

  JournalListModel data = JournalListModel.fromJson({});

  List<SpecData> newSpecData = [];
  List<SpecData> specData = AppData.specData;

  bool showDropdown = false, showSpecDesc = true;

  @override
  void initState() {
    if (widget.index != null) {
      screenIndex = widget.index!;
    }
    _getMoreData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          screenIndex == 0) {
        _getMoreData();
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
          if (state is SuccessJournalsState) {
            if (addData) {
              if (state.page == 1) {
                data = state.data;
              } else {
                data.data.addAll(state.data.data);
              }
            }
            loadData = !state.data.next;
          } else if (state is ChangeIndexState) {
            if (state.type == 'screen') {
              screenIndex = state.index;
            } else if (state.type == 'journal') {
              journalIndex = state.index;
            }
          } else if (state is ChangeStatusState) {
            if (state.type == 'dropdown') {
              showDropdown = state.status;
            } else if (state.type == 'search') {
              onSearchActive = state.status;
            } else if (state.type == 'spec_desc') {
              showSpecDesc = state.status;
            }
          }
          return GestureDetector(
            onTap: () {
              Utils.closeKeyboard(context);
              onSearchActive = false;
              _changeStatus(false, 'dropdown');
            },
            child: Scaffold(
              backgroundColor: AppColor.bg,
              appBar: AppBar(
                titleSpacing: 0,
                elevation: 0,
                backgroundColor: AppColor.dark,
                toolbarHeight: 72,
                leading: const SizedBox(),
                leadingWidth: 0,
                title: MainAppBar(
                  onMenuTap: (int index) {
                    _changeIndex('screen', index);
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.easeInOut,
                    );
                  },
                  controller: textController,
                  onSearchActive: onSearchActive,
                  onSearch: (bool active) {
                    _changeStatus(active, 'search');
                    if (!active) {
                      search = null;
                      page = 1;
                      loadData = false;
                      _getMoreData();
                    }
                  },
                  onChanged: _onChange,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MagazineSearchWidget(
                                        controller: dropDownController,
                                        onChanged: (obj) {
                                          newSpecData = specData
                                              .where(
                                                (element) =>
                                                    element.name.contains(obj),
                                              )
                                              .toList();
                                          _changeStatus(true, 'dropdown');
                                        },
                                        onDropDownTap: () {
                                          _changeStatus(true, 'dropdown');
                                        },
                                      ),
                                      if (showSpecDesc)
                                        const SizedBox(height: 16),
                                      if (showSpecDesc)
                                        SpecDescWidget(
                                          desc: specData[specIndex].desc,
                                          onClose: () {
                                            _changeStatus(
                                              false,
                                              'spec_desc',
                                            );
                                          },
                                        ),
                                      const SizedBox(height: 32),
                                      if (ResponsiveWidget.isMediumScreen(
                                              context) ||
                                          ResponsiveWidget.isSmallScreen(
                                              context))
                                        SortByMobileWidget(
                                          onSelect: (String sort, int index) {
                                            onMobileSort(sort, index);
                                          },
                                          selectedSort: selectedSort,
                                        ),
                                      if (ResponsiveWidget.isMediumScreen(
                                              context) ||
                                          ResponsiveWidget.isSmallScreen(
                                              context))
                                        ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            if (index == data.data.length) {
                                              return CustomScrollLoading(
                                                loading: loadData,
                                              );
                                            }
                                            return MagazineItemWidget(
                                              data: data.data[index],
                                              isExpanded: isAboutMagazineOpen,
                                              onTap: () {
                                                _changeIndex('journal', index);
                                              },
                                            );
                                          },
                                          separatorBuilder: (_, __) {
                                            return const Divider(height: 32);
                                          },
                                          itemCount: data.data.length + 1,
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
                                                      page = 1;
                                                      loadData = false;
                                                      _getMoreData();
                                                    },
                                                  );
                                                }
                                                if (index ==
                                                    data.data.length + 1) {
                                                  return CustomScrollLoading(
                                                    loading: loadData,
                                                  );
                                                }
                                                return WebTableRowWidget(
                                                  data: data.data[index - 1],
                                                  isExpanded:
                                                      journalIndex == index,
                                                  onTap: () {
                                                    if (journalIndex == index) {
                                                      _changeIndex(
                                                          'journal', -1);
                                                    } else {
                                                      _changeIndex(
                                                          'journal', index);
                                                    }
                                                  },
                                                );
                                              },
                                              separatorBuilder: (_, __) {
                                                return const Divider(
                                                    height: 32);
                                              },
                                              itemCount: data.data.length + 2,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  if (showDropdown)
                                    Positioned(
                                      top: 56,
                                      width: 296,
                                      child: ShowSearchResultDialog(
                                        data: newSpecData,
                                        chosen: specIndex,
                                        onChoose: (String name, int index) {
                                          dropDownController.text = name;
                                          showDropdown = false;
                                          specIndex = index;
                                          categoryEnum =
                                              newSpecData[index].category;
                                          page = 1;
                                          loadData = false;
                                          showSpecDesc = true;
                                          _getMoreData();
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
                                Navigator.pushNamed(
                                  context,
                                  '/privacy',
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (ResponsiveWidget.isLargeScreen(context) ||
                      ResponsiveWidget.isCustomSize(context))
                    BottomRowWidget(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/privacy',
                        );
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

  void _getMoreData() {
    if (!loadData) {
      addData = true;
      BlocProvider.of<HomeBloc>(context).add(
        AllJournalsEvent(
          categoryEnum,
          page,
          sortIndex,
          sortType,
          search,
        ),
      );
      page++;
    }
  }

  void onMobileSort(String sort, int index) {
    selectedSort = sort;
    sortIndex = index;
    sortType = 'asc';
    page = 1;
    loadData = false;
    _getMoreData();
  }

  void _onChange(String obj) {
    if (screenIndex == 0) {
      const duration = Duration(milliseconds: 1200);
      if (searchOnStoppedTyping != null) {
        searchOnStoppedTyping!.cancel();
      }
      searchOnStoppedTyping = Timer(
        duration,
        () {
          search = obj;
          page = 1;
          loadData = false;
          _getMoreData();
        },
      );
    }
  }

  void _changeIndex(String type, int index) {
    BlocProvider.of<HomeBloc>(context).add(
      ChangeIndexEvent(
        type,
        index,
      ),
    );
  }

  void _changeStatus(bool status, String type) {
    BlocProvider.of<HomeBloc>(context).add(
      ChangeStatusEvent(status, type),
    );
  }
}
