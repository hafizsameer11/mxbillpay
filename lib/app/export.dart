/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

export 'package:colorful_safe_area/colorful_safe_area.dart';
export 'package:device_info_plus/device_info_plus.dart';
/*================================================== application binding =====================================*/

export 'package:EarlybazeWallet/app/bindings/initial_binding.dart';
export 'package:EarlybazeWallet/app/bindings/local_source_bindings.dart';
export 'package:EarlybazeWallet/app/bindings/repository_bindings.dart';
/*=============================================== base exports =============================================*/

export 'package:EarlybazeWallet/app/core/base/page_state.dart';
export 'package:EarlybazeWallet/app/core/translations/local_keys.dart';
export 'package:EarlybazeWallet/app/core/utils/image_picker.dart';
export 'package:EarlybazeWallet/app/core/values/app_assets.dart';
export 'package:EarlybazeWallet/app/core/values/app_colors.dart';
export 'package:EarlybazeWallet/app/core/values/app_constants.dart';
export 'package:EarlybazeWallet/app/core/values/app_global_values.dart';
export 'package:EarlybazeWallet/app/core/values/app_strings.dart';
export 'package:EarlybazeWallet/app/core/values/app_theme.dart';
/* ================================================app constants ===========================================*/

export 'package:EarlybazeWallet/app/core/values/app_values.dart';
export 'package:EarlybazeWallet/app/core/values/route_arguments.dart';
export 'package:EarlybazeWallet/app/core/values/text_styles.dart';
export 'package:EarlybazeWallet/app/core/widget/annotated_region_widget.dart';
export 'package:EarlybazeWallet/app/core/widget/asset_image.dart';
export 'package:EarlybazeWallet/app/core/widget/button_widget.dart';
export 'package:EarlybazeWallet/app/core/widget/custom_appbar.dart';
export 'package:EarlybazeWallet/app/core/widget/custom_flashbar.dart';
export 'package:EarlybazeWallet/app/core/widget/custom_inkwell.dart';
export 'package:EarlybazeWallet/app/core/widget/custom_loader.dart';
export 'package:EarlybazeWallet/app/core/widget/double_back_press.dart';


/*=================================================== widgets =============================================*/

export 'package:EarlybazeWallet/app/core/widget/edit_text_widget.dart';
export 'package:EarlybazeWallet/app/core/widget/logout_dialog.dart';
export 'package:EarlybazeWallet/app/core/widget/network_image.dart';
export 'package:EarlybazeWallet/app/core/widget/no_glow_scroll_view.dart';
export 'package:EarlybazeWallet/app/core/widget/screen_heading.dart';
export 'package:EarlybazeWallet/app/core/widget/text_view.dart';
export 'package:EarlybazeWallet/app/core/widget/time_formatter.dart';
export 'package:EarlybazeWallet/app/core/widget/validator.dart';


/*==================================================== local services =====================================*/

export 'package:EarlybazeWallet/app/data/local/prefrences/preference.dart';
export 'package:EarlybazeWallet/app/data/models/response_model/login_response_model.dart';
export 'package:EarlybazeWallet/app/data/models/response_model/message_response_model.dart';
/*================================================== dio client ======================================*/

export 'package:EarlybazeWallet/app/data/repository/api_repository.dart';
/* =========================================== request model=====================================================*/

export 'package:EarlybazeWallet/app/data/repository/auth_request_model.dart';
export 'package:EarlybazeWallet/app/data/repository/dio_client.dart';
export 'package:EarlybazeWallet/app/data/repository/endpoint.dart';
export 'package:EarlybazeWallet/app/data/repository/network_exceptions.dart';
export 'package:EarlybazeWallet/app/logger/logger_utils.dart';
export 'package:EarlybazeWallet/app/modules/authentication/bindings/autentication_binding.dart';
/* =========================================== response model=====================================================*/

export 'package:EarlybazeWallet/app/modules/authentication/controllers/login_controller.dart';
/* ==================================================app routes ===========================================*/

export 'package:EarlybazeWallet/app/routes/app_pages.dart';
export 'package:EarlybazeWallet/app/routes/app_routes.dart';
export 'package:EarlybazeWallet/main.dart';
/*============================================== application screens =====================================*/
export 'package:EarlybazeWallet/my_app.dart';
/*============================================ third parties libraries ====================================*/

export 'package:dio/dio.dart';
export 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
export 'package:file_picker/file_picker.dart';
export 'package:flutter/cupertino.dart' hide RefreshCallback;
/* =============================================dart, flutter and getx =====================================*/

export 'package:flutter/gestures.dart';
export 'package:flutter/services.dart';
export 'package:flutter_easyloading/flutter_easyloading.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:get/get.dart'
    hide Response, HeaderValue, MultipartFile, FormData;
export 'package:get/instance_manager.dart';
export 'package:get_storage/get_storage.dart';
export 'package:image_cropper/image_cropper.dart';
export 'package:image_picker/image_picker.dart';
export 'package:intl/intl.dart' hide TextDirection;
export 'package:package_info_plus/package_info_plus.dart';

export 'package:EarlybazeWallet/app/export.dart';
export 'package:EarlybazeWallet/app/modules/home/controller/home_controller.dart';

export 'package:EarlybazeWallet/components/custom_image.dart';

export 'package:EarlybazeWallet/app/modules/home/widget/ad_view.dart';
export 'package:EarlybazeWallet/model/products_response_model.dart';
export 'package:EarlybazeWallet/model/item_data_model.dart';

export '../../../../model/products_dummy.dart';
export 'package:flutter/material.dart';



export 'package:shimmer/shimmer.dart';
export 'package:action_slider/action_slider.dart';
export 'dart:async';
export 'package:EarlybazeWallet/app/data/models/error_response_model.dart';


/* =============================================================== routes/app pages =====================================*/

export 'package:EarlybazeWallet/app/modules/authentication/bindings/forget_password_binding.dart';
export 'package:EarlybazeWallet/app/modules/authentication/bindings/login_bindings.dart';
export 'package:EarlybazeWallet/app/modules/authentication/bindings/reset_password_bindings.dart';
export 'package:EarlybazeWallet/app/modules/authentication/bindings/sign_up_bindings.dart';
export 'package:EarlybazeWallet/app/modules/authentication/views/login_page.dart';
export 'package:EarlybazeWallet/app/modules/authentication/views/reset_password_v.dart';

export 'package:EarlybazeWallet/app/modules/home/bindings/home_screen_bindings.dart';
export 'package:EarlybazeWallet/app/modules/home/view/home_screen.dart';

export 'package:EarlybazeWallet/app/modules/main_screen/views/main_screen_view.dart';
export 'package:EarlybazeWallet/app/modules/on_boarding/bindings/on_boarding_bindings.dart';
export 'package:EarlybazeWallet/app/modules/on_boarding/views/on_boarding_screen.dart';
export 'package:EarlybazeWallet/app/modules/profile/bindings/profile_bindings.dart';
export 'package:EarlybazeWallet/app/modules/profile/view/change_password_screen.dart';


export 'package:EarlybazeWallet/app/modules/authentication/views/signup_screen.dart';


export 'package:EarlybazeWallet/app/modules/profile/view/edit_profile_screen.dart';
//export 'package:EarlybazeWallet/app/modules/profile/view/notification_list_screen.dart';
export 'package:EarlybazeWallet/app/modules/profile/view/profile_screen.dart';



/* =============================================================== profile section =====================================*/

//export 'package:EarlybazeWallet/app/modules/profile/controller/notification_list_controller.dart';
export 'package:EarlybazeWallet/app/modules/profile/controller/edit_profile_controller.dart';
export 'package:EarlybazeWallet/app/modules/profile/controller/change_password_controller.dart';
export 'package:EarlybazeWallet/app/modules/profile/controller/profile_controller.dart';

/* =============================================================== product Varient section =====================================*/


export 'package:carousel_slider/carousel_slider.dart';

export 'package:EarlybazeWallet/model/recomendation_product_list_model.dart';





/* =============================================================== On Boarding section =====================================*/


export 'package:EarlybazeWallet/app/modules/on_boarding/controllers/onboarding_controller.dart';
export 'package:EarlybazeWallet/app/core/utils/helper_utility.dart';


/* =============================================================== Main screen section =====================================*/



export 'package:EarlybazeWallet/app/modules/main_screen/controllers/main_screen_controller.dart';

export 'package:EarlybazeWallet/app/modules/main_screen/model/bottom_main_nav_model.dart';




/* ===============================================================Home section =====================================*/



export 'package:EarlybazeWallet/app/modules/home/widget/circular_category_home_view.dart';
export 'package:EarlybazeWallet/app/modules/home/widget/product_shimmer_view.dart';
export 'package:EarlybazeWallet/app/modules/home/widget/product_view_home.dart';







/* ===============================================================Authentication section =====================================*/


export  'package:EarlybazeWallet/app/modules/authentication/controllers/sign_up_controller.dart';
export  'package:EarlybazeWallet/app/modules/authentication/controllers/reset_password_controller.dart';
export 'package:EarlybazeWallet/app/core/utils/validator.dart';
export 'dart:io';
export 'package:EarlybazeWallet/app/modules/authentication/controllers/forget_password_controller.dart';


/* ===============================================================Splash section =====================================*/


export 'package:EarlybazeWallet/app/modules/splash/controller/splash_controller.dart';
export 'package:EarlybazeWallet/constants/font_family.dart';
export 'package:EarlybazeWallet/app/data/models/data_model/login_data_model.dart';

export 'package:EarlybazeWallet/app/modules/authentication/views/forget_password.dart';
export 'package:EarlybazeWallet/app/modules/splash/bindings/splash_bindings.dart';
export 'package:EarlybazeWallet/app/modules/splash/views/splash_view.dart';










