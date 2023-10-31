import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/address/presentation/cubit/selected_address_cubit.dart';
import 'package:malina_mobile_app/features/yandex_map/data/models/app_lat_long.dart';
import 'package:malina_mobile_app/features/yandex_map/data/models/search_result.dart';
import 'package:malina_mobile_app/features/yandex_map/presentation/cubit/yandex_map_cubit.dart';
import 'package:malina_mobile_app/features/yandex_map/presentation/cubit/yandex_search_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../../../../shared/constants/colors.dart';

class YandexSearchContainer extends StatefulWidget {
  const YandexSearchContainer({super.key});

  @override
  State<YandexSearchContainer> createState() => _YandexSearchContainerState();
}

class _YandexSearchContainerState extends State<YandexSearchContainer> {
  late TextEditingController searchCont;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchCont = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YandexSearchCubit(),
      child: Builder(builder: (context) {
        void search() async {
          final query = searchCont.text;
          if (query.isEmpty) return;
          try {
            final resultWithSession = YandexSearch.searchByText(
              searchText: query,
              geometry: Geometry.fromBoundingBox(const BoundingBox(
                southWest: Point(
                    latitude: 55.76996383933034, longitude: 37.57483142322235),
                northEast: Point(
                    latitude: 55.785322774728414,
                    longitude: 37.590924677311705),
              )),
              searchOptions: const SearchOptions(
                searchType: SearchType.geo,
                geometry: false,
              ),
            );

            final results = await resultWithSession.result;
            List<SearchResultModel> locations = results.items!
                .map(
                  (e) => SearchResultModel(
                    name: e.toponymMetadata?.address.formattedAddress ?? '',
                    location: AppLatLong(
                      lat: e.toponymMetadata!.balloonPoint.latitude,
                      long: e.toponymMetadata!.balloonPoint.longitude,
                    ),
                  ),
                )
                .toList();
            if (mounted) {
              context.read<YandexSearchCubit>().search(locations);
            }
          } catch (e) {
            log('Fetching data error; $e');
          }
        }

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              height: 50,
              decoration: const BoxDecoration(
                color: AppColor.softGrey,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: TextField(
                controller: searchCont,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Поиск адреса',
                  contentPadding: const EdgeInsets.all(15),
                  prefixIcon: Container(
                    height: 15,
                    padding: const EdgeInsets.only(right: 15),
                    child: Image.asset(
                      'assets/icons/search.png',
                      color: AppColor.darkGrey,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    maxHeight: 20,
                  ),
                ),
                onChanged: (value) {
                  search();
                },
              ),
            ),
            BlocBuilder<YandexSearchCubit, YandexSearchState>(
              builder: (context, state) {
                if (state is YandexSearchAssigned) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        context.read<YandexMapCubit>().select(
                              state.locations[index].location,
                            );
                        context.read<SelectedAddressCubit>().select(
                              state.locations[index],
                            );
                        context.read<YandexSearchCubit>().empty();
                      },
                      child: SearchResultItemContainer(
                        name: state.locations[index].name,
                      ),
                    ),
                    itemCount:
                        state.locations.length < 7 ? state.locations.length : 6,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        );
      }),
    );
  }
}

class SearchResultItemContainer extends StatelessWidget {
  final String name;
  const SearchResultItemContainer({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.lightGrey,
            ),
            child: Image.asset(
              'assets/icons/location.png',
              color: AppColor.darkGrey,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: st14,
                ),
                const Divider(
                  thickness: 1,
                  color: AppColor.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
