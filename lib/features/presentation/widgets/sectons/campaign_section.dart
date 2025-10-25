import 'package:arafah/core/constants/api_urls.dart';
import 'package:arafah/core/utils/extensions/null_empty_extension.dart';
import 'package:arafah/core/utils/extensions/status_extension.dart';
import 'package:arafah/core/utils/styles/app_colors.dart';
import 'package:arafah/core/utils/ui_helpers/radius.dart';
import 'package:arafah/core/utils/ui_helpers/spacing.dart';
import 'package:arafah/features/shop/presentation/bloc/shop_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CampaignsSection extends HookWidget {
  final double? height;

  const CampaignsSection({
    super.key,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final activeIndex = useState(0);
    final carouselController = useMemoized(() => CarouselSliderController());

    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        if(state.campaignStatus.isSuccess && (state.campaignsEntity?.campaigns).isNotNullAndNotEmpty) {
            return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: radius8,
                child: CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: state.campaignsEntity?.campaigns?.length,
                  options: CarouselOptions(
                    height: height ?? 150,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    onPageChanged: (index, reason) {
                      activeIndex.value = index;
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return CachedNetworkImage(
                      imageUrl: ApiUrls.imageBaseURL + state.campaignsEntity!.campaigns![index].banner!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),

              gap12,

              AnimatedSmoothIndicator(
                activeIndex: activeIndex.value,
                count: state.campaignsEntity?.campaigns?.length ?? 0,
                effect: const ExpandingDotsEffect(
                  expansionFactor: 4,
                  dotWidth: 6,
                  dotHeight: 6,
                  spacing: 6,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: 1.5,
                  dotColor: AppColors.greyLight,
                  activeDotColor: AppColors.primaryColor,
                ),
                onDotClicked: (index) => carouselController.animateToPage(index),
              ),
            ],
          );

        }else{
          return SizedBox.shrink();
        }
      },
    );
  }
}
