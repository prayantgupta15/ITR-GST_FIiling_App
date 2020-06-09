import 'package:askcommercials/Utils/utils_importer.dart';
import 'package:flutter/material.dart';

class StringUtils {
  String HKGrotesk = 'HKGrotesk';
  String Pacifico = 'Pacifico';
  String Girassol = 'Girassol';
  static String ITR_URL = 'https://www.askcommercials.com/itr-form';
  static String GST_URL = 'https://www.ask4gst.com/contact';
  static String FORMS_URL = 'https://www.askcommercials.com/downloads';
  static String PAYMENT_URL = 'https://www.askcommercials.com/contact-us';

  static String CONTACT_URL = 'https://www.askcommercials.com/contact-us';
  static String EMAIL = "askcommercials@gmail.com";
  static String PHONENO = "9654559985";
  static String LANDLINE_NO = "01127671326";
  static String APP_URL =
      'https://drive.google.com/drive/folders/1mTDo5FDprVy78UMM62q1LSAu_l8HnSVA?usp=sharing';

  //images
  static String LOGO = 'assets/logo.webp';
  static String GPAY = 'assets/gpay.jpg';
  static String PAYTM = 'assets/paytm.jpg';

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
