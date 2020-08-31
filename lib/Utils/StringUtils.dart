import 'package:askcommercials/Utils/utils_importer.dart';
import 'package:flutter/material.dart';

class StringUtils {
  String HKGrotesk = 'HKGrotesk';
  String Pacifico = 'Pacifico';
  String Girassol = 'Girassol';

  //FAB
  static String MESSAGE = 'Hi';
  static String FB_URL = 'https://www.facebook.com/askcommercials/';
  static String JD_URL = 'https://www.justdial.com/Delhi/Ask-Commercial-Solutions-Adarsh-Nagar/011PXX11-XX11-100802153040-Q7P4_BZDET';
  static String MAP_URL = "https://www.google.com/maps/search/?api=1&query=ASK+Commercial+Solutions";
  static String LINKEDIN_URL = 'https://www.linkedin.com/company/askcommercials';

  //URL
  static String ITR_URL_NON_EXIST ="https://docs.google.com/forms/d/e/1FAIpQLSdcUdYquVZPBWoX5Uk-NDm2KJy3UtR6tskkOXaLh_umvHjQ1g/viewform";
  static String ITR_URL_EXIST = 'https://docs.google.com/forms/d/e/1FAIpQLSf6QZT_3GtUuy0qtAx0su2YVL_yfTyjeZZP6T80BjYT-gEcUw/viewform';

  static String GST_URL = 'https://docs.google.com/forms/d/e/1FAIpQLSct6lTk9bJ1R7DQIGUyeGw38sfYbHnSqwkqp0P3dMN0yqg_rQ/viewform';
  static String FORMS_URL = 'https://www.askcommercials.com/downloads';
  static String PAYMENT_URL = 'https://www.askcommercials.com/contact-us';
  static String CONTACT_URL = 'https://www.askcommercials.com/contact-us';
  static String PAYTM_CODE_URL= 'https://static.wixstatic.com/media/ab103d_c23b36cd58444702a5379a2af89918de~mv2.png/v1/fill/w_669,h_625,al_c,q_90,usm_0.66_1.00_0.01/payment.webp';
  static String GPAY_CODE_URL ='https://static.wixstatic.com/media/ab103d_c23b36cd58444702a5379a2af89918de~mv2.png/v1/fill/w_669,h_625,al_c,q_90,usm_0.66_1.00_0.01/payment.webp';


  //DETAILS
  static String EMAIL = "info.askcommercials@gmail.com";
  static String PHONENO = "+919654559985";
  static String LANDLINE_NO = "01127671326";
  static String APP_URL =
      'https://drive.google.com/drive/folders/1mTDo5FDprVy78UMM62q1LSAu_l8HnSVA?usp=sharing';

  //images
  static String LOGO = 'assets/logo.webp';
  static String PAYTM = 'assets/paytm.jpg';
  static String GPAY = 'assets/googlePay.jpg';

  //ACC DETAILS
  static String ACC_NAME = "Ask Commercial Solutions";
  static String IFSC = "ICIC0006640";
  static String ACC_NO = "664005601076";
  static String BRANCH = "ICICI Bank, Adarsh Nagar";

  static List<String> ServicesName = [
    'Business Setup MSME',
    'Tax Consultancy',
    'GST Services',
    'Accounting Services',
    'Company/LLP Management',
    'Auditing Services',
    'Digital Signature',
    'Secreterial',
    'Law & Regulatory',
    'Financial Management',
    'Business Function Outsourcing',
    'Trademark Registration',
    'Investment Planning',
    'Firm/Societies/NGOs Management',
    'IEC Code/ISO/ISI Registration',
    'Shop/Factory/Business License'
  ];

  static List<String> Services_URLS = [
    'https://www.askcommercials.com/business-setup',
    'https://www.askcommercials.com/tax-consultancy',
    'https://www.ask4gst.com',
    'https://www.askcommercials.com/accounting-services',
    'https://www.askcommercials.com/company-llp',
    'https://www.askcommercials.com/auditing-services',
    'https://www.askcommercials.com/dsc-services',
    'https://www.askcommercials.com/corporate-services',
    'https://www.askcommercials.com/law-services',
    'https://www.askcommercials.com/financial-services',
    'https://www.askcommercials.com/business-outsourcing',
    'https://www.askcommercials.com/trademark-services',
    'https://www.askcommercials.com/investment',
    'https://www.askcommercials.com/firm-society-mgmt',
    'https://www.askcommercials.com/iec-iso-isi',
    'https://www.askcommercials.com/shop-factory-reg',
  ];
}

TextStyle ts = TextStyle(
    fontFamily: UtilsImporter().stringUtils.HKGrotesk,
    fontWeight: FontWeight.bold);
