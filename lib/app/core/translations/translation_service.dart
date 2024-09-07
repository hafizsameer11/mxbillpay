/*
 *
 *  * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *  * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 *  * All Rights Reserved.
 *  * Proprietary and confidential :  All information contained herein is, and remains
 *  * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 *  * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import '../../export.dart';
import 'languages/en_Us.dart';
import 'languages/fr_FR.dart';
import 'languages/fr_PF.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;

  static final fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'fr_FR': fr_FR,
        'fr_PF': fr_PF,
      };
}
