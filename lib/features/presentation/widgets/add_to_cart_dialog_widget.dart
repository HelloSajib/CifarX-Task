
import 'package:arafah/core/constants/api_urls.dart';
import 'package:arafah/core/helpers/helpers.dart';
import 'package:arafah/core/helpers/toast_notification/toast_notifications.dart';
import 'package:arafah/core/utils/extensions/null_empty_extension.dart';
import 'package:arafah/core/utils/extensions/status_extension.dart';
import 'package:arafah/core/utils/styles/app_colors.dart';
import 'package:arafah/core/utils/styles/app_text_styles.dart';
import 'package:arafah/core/utils/ui_helpers/alignments.dart';
import 'package:arafah/core/utils/ui_helpers/paddings.dart';
import 'package:arafah/core/utils/ui_helpers/radius.dart';
import 'package:arafah/core/utils/ui_helpers/spacing.dart';
import 'package:arafah/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:arafah/features/auth/presentation/pages/sign_in_page.dart';
import 'package:arafah/features/carts/presentation/bloc/carts_bloc.dart';
import 'package:arafah/features/carts/presentation/bloc/carts_event.dart';
import 'package:arafah/features/product_details/data/models/product_details_model.dart';
import 'package:arafah/features/product_details/presentation/bloc/product_details_bloc.dart';
import 'package:arafah/features/product_details/presentation/bloc/product_details_event.dart';
import 'package:arafah/features/product_details/presentation/widgets/product_price_stock_widget.dart';
import 'package:arafah/features/product_details/presentation/widgets/selector/product_color_selector.dart';
import 'package:arafah/features/product_details/presentation/widgets/selector/product_size_selector.dart';
import 'package:arafah/widgets/buttons/primary_button.dart';
import 'package:arafah/widgets/circle_loading.dart';
import 'package:arafah/widgets/empty_widget.dart';
import 'package:arafah/widgets/network_image_widget.dart';
import 'package:arafah/widgets/quantity_selector.dart';
import 'package:arafah/widgets/ratings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:collection/collection.dart';

class AddToCartDialogWidget extends HookWidget {
  final String productId;

  const AddToCartDialogWidget({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {

    final selectedQuantity = useState<int>(1);
    final selectedProductSize = useState<Variant?>(null);
    final perItemRegularPrice = useState<double?>(null);
    final totalItemRegularPrice = useState<double?>(null);
    final perItemDiscountPrice = useState<double?>(null);
    final totalItemDiscountPrice = useState<double?>(null);
    final selectedItemStock = useState<int?>(null);
    final selectedColor = useState<Color?>(null);

    final cartsBloc = context.read<CartsBloc>();

    void getProductDetails() {
      context.read<ProductDetailsBloc>().add(
        GetProductDetails(productId: productId),
      );
    }

    void addToCart(){
      bool authenticate = context.read<AuthBloc>().state.authEntity != null;
      if(!authenticate){
        context.push(SignInPage.path);
        return;
      }

      if(selectedProductSize.value == null || selectedColor.value == null){
        ToastNotifications.showErrorToast(
            title: "Select Product Variants",
            message: "Please choose size, color, or variant before adding to cart."
        );
        return;
      }

      bool alreadyHave = (cartsBloc.state.carts ?? []).any((cart){
        return cart.product?.id == productId &&
            cart.selectedSize == selectedProductSize.value?.size &&
            cart.selectedColor == selectedColor.value?.colorName;
      });

      if(alreadyHave){
        ToastNotifications.showErrorToast(
            title: "Already added this variants",
            message: "Please choose another size, color, or variant before adding to cart."
        );
        return;
      }

      Map<String, dynamic> body = {
        "productId": productId,
        "selectedSize": selectedProductSize.value?.size,
        "selectedColor": selectedColor.value?.colorName,
        "quantity": selectedQuantity.value
      };
      cartsBloc.add(AddToCart(body: body));
    }

    useEffect(() {
      Future.microtask(() => getProductDetails());
      return null;
    }, []);

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: radius20),
      insetPadding: EdgeInsets.all(16.w),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 450.h,
          maxHeight: 600.h,
        ),
        child: Padding(
          padding: padding16,
          child: Column(
            children: [

              Row(
                children: [
                  gap48,

                  const Spacer(),

                  Text(
                    "Add To Cart",
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Spacer(),

                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: CircleAvatar(
                        radius: 15.r,
                        backgroundColor: AppColors.greyLight,
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),
                ],
              ),

              const Divider(),

              gap12,

              Expanded(
                child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
                  builder: (context, state) {

                    ProductDetails? productDetails = state.productDetailsEntity?.productDetails;

                    if(state.status.isLoading){
                      return CircleLoadingWidget();
                    }else if(state.status.isSuccess && productDetails != null){
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            children: [
                              NetworkImageWidget(
                                width: 80.w,
                                height: 80.w,
                                borderRadius: radius6,
                                imageUrl: ApiUrls.imageBaseURL + (productDetails.images.isNotNullAndNotEmpty ? productDetails.images!.first : ""),
                              ),

                              gap12,

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: crossStart,
                                  children: [
                                    Text(
                                      productDetails.name ?? "N/A",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.primary.copyWith(
                                        fontSize: 15.sp,
                                      ),
                                    ),

                                    RatingWidget(
                                        rating: productDetails.averageRating ?? 0.0,
                                        totalReviews: productDetails.numReviews ?? 0
                                    ),

                                    ProductPriceStockWidget(
                                      totalDiscountPrice: totalItemDiscountPrice.value ?? productDetails.minPrice,
                                      totalProductRegularPrice: totalItemRegularPrice.value ?? productDetails.baseMinPrice,
                                      discount: productDetails.discount,
                                      totalStock: selectedItemStock.value ?? productDetails.totalStock,
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),

                          gap12,

                          const Divider(),

                          // --- Color Selection ---
                          ProductSizeSelector(
                              variants: productDetails.variants ?? [],
                              onSelected: (value){
                                selectedProductSize.value = value;
                              }
                          ),

                          if(selectedProductSize.value != null)
                            Column(
                              crossAxisAlignment: crossStart,
                              children: [
                                gap12,
                                const Divider(),
                                ProductColorSelector(
                                    colorCodes: (selectedProductSize.value?.colors ?? []).map((color) => color.colorCode ?? "")
                                        .toList(),
                                    onSelected: (value){
                                      selectedColor.value = (selectedProductSize.value?.colors ?? []).singleWhereOrNull(
                                              (item) => item.colorCode == value);
                                      selectedItemStock.value = selectedColor.value?.stock ?? productDetails.totalStock ?? 0;
                                      perItemRegularPrice.value = selectedColor.value?.price ?? productDetails.baseMinPrice ?? 0;
                                      totalItemRegularPrice.value = (perItemRegularPrice.value ?? productDetails.baseMinPrice ?? 0) * selectedQuantity.value;

                                      perItemDiscountPrice.value = Helpers.calculateDiscountedPrice(perItemRegularPrice.value ?? 0, productDetails.discount ?? 0);
                                      totalItemDiscountPrice.value = (perItemDiscountPrice.value ?? productDetails.minPrice ?? 0) * selectedQuantity.value;
                                    }
                                ),
                              ],
                            ),
                          gap12,

                          // --- Quantity Selector ---
                          Text(
                            "Quantity",
                            style: AppTextStyles.titleMedium.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          gap12,

                          QuantitySelector(
                            stock: selectedItemStock.value ?? productDetails.totalStock ?? 0,
                              onChanged: (quantity){
                                selectedQuantity.value = quantity;

                                perItemRegularPrice.value = selectedColor.value?.price ?? productDetails.baseMinPrice ?? 0;
                                totalItemRegularPrice.value = (perItemRegularPrice.value ?? productDetails.baseMinPrice ?? 0) * selectedQuantity.value;

                                perItemDiscountPrice.value = Helpers.calculateDiscountedPrice(perItemRegularPrice.value ?? 0, productDetails.discount ?? 0);
                                totalItemDiscountPrice.value = (perItemDiscountPrice.value ?? productDetails.minPrice ?? 0) * selectedQuantity.value;
                              }
                          ),

                          const Spacer(),

                          // --- Action Buttons ---
                          Row(
                            children: [
                              Expanded(
                                child: PrimaryButton(
                                  onPressed: () => context.pop(),
                                  text: "Cancel",
                                  background: Colors.transparent,
                                  textColor: AppColors.textPrimary,
                                  strokeColor: AppColors.grey,
                                  gradientColor: false,
                                ),
                              ),

                              gap12,

                              Expanded(
                                child: BlocConsumer<CartsBloc, CartsState>(
                                  listenWhen: (previous, current) =>
                                      previous.addStatus.isLoading && current.addStatus.isSuccess,
                                    listener: (context, state){
                                      ToastNotifications.showSuccessToast(
                                          "Item added! Check your cart to review your selection."
                                      );
                                      context.pop();
                                    },
                                    builder: (context, state){
                                      return PrimaryButton(
                                        isLoading: state.addStatus.isLoading,
                                        onPressed: addToCart,
                                        text: "Add To Cart",
                                        background: Colors.green,
                                        gradientColor: false,
                                      );
                                    },
                                ),
                              ),
                            ],
                          ),

                          gap12,
                        ],
                      );
                    }else{
                      return EmptyWidget(
                        title: "Product Unavailable",
                        description: "Sorry, this product can’t be added to your cart right now. Please try again later or choose another product.",
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
