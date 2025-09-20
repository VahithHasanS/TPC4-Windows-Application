// ignore_for_file: avoid_print, camel_case_types, non_constant_identifier_names, unused_import, file_names, unused_element, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables

import 'package:intl/intl.dart';
import 'package:meta_blaster/mongoDB/connect_&_constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Db_Supporter_4 {
  static Future<void> Delete_Head(code) async {
    try {
      await ConnectConstant.db
          .collection('headOffice_data')
          .deleteOne({'_id': code});
      print('$code has been deleted from data collection.');
    } catch (e) {
      print("Error : $e");
      print('Someting went wrong on delete customer');
    }
  }

  static Future<dynamic> Fetch_Total_Party_Bunker_SearchTab(
      code, Fdate, Tdate, name, book, status) async {
    try {
      var query1, query2, query3, query4, query5;
      // query1 is balance and excess.
      //query2 is cash document, and cash amount.
      //query3 is credit document, and credit amount.
      //query4 is hot cash document and hot cash amount.
      //query5 is upi document and upi amount.

      var status_var, book_var, name_var;

      status == 'All' ? status_var = false : status_var = true;

      book == 'All' ? book_var = false : book_var = true;

      name == 'All' ? name_var = false : name_var = true;

      if (!Fdate) {
        if (!status_var && !book_var && !name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else if (status_var && !book_var && !name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else if (status_var && book_var && !name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Booked_By': book},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Booked_By': book},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Booked_By': book},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Booked_By': book},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Booked_By': book},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else if (status_var && book_var && name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else if (!status_var && !book_var && name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else if (!status_var && book_var && name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else if (!status_var && book_var && !name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Booked_By': book},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Booked_By': book},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Booked_By': book},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Booked_By': book},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Booked_By': book},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else if (status_var && !book_var && name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          print(
              'The Last Un Existed value are: $status_var, $book_var, $name_var ...');
        }
      } else {
        if (!status_var && !book_var && !name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else if (status_var && !book_var && !name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else if (status_var && book_var && !name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Booked_By': book},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Booked_By': book},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Booked_By': book},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Booked_By': book},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Booked_By': book},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else if (status_var && book_var && name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else if (!status_var && !book_var && name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else if (!status_var && book_var && name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else if (!status_var && book_var && !name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Booked_By': book},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Booked_By': book},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Booked_By': book},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Booked_By': book},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Booked_By': book},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else if (status_var && !book_var && name_var) {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];
        } else {
          query1 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
                'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
              }
            }
          ];

          query2 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
                'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query3 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Credit'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
                'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query4 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'Hot Cash'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
                'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          query5 = [
            {
              '\$match': {
                '\$and': [
                  {'User_Code': code},
                  {'Is_Paid': status},
                  {'Customer_Name': name},
                  {'Booked_By': book},
                  {'Account_Type': 'UPI'},
                  {
                    'Booking_Date': {'\$gte' + Fdate}
                  },
                  {
                    'Booking_Date': {'\$lge' + Tdate}
                  }
                ]
              }
            },
            {
              '\$group': {
                '_id': null,
                'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
                'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
              }
            }
          ];

          print(
              'The Last Un Existed value are: $status_var, $book_var, $name_var ...');
        }
      }

      var data1 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(query1)
          .toList();

      var data2 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(query2)
          .toList();

      var data3 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(query3)
          .toList();

      var data4 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(query4)
          .toList();

      var data5 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(query5)
          .toList();

      dynamic data_1,
          data_2,
          data_3,
          data_4,
          data_5,
          data_6,
          data_7,
          data_8,
          data_9,
          data_10,
          data_11;

      try {
        data_1 = data2[0]['totalValue_of_Cash_Document'];
        data_2 = data2[0]['totalValue_of_Cash_Amount'];
      } catch (e) {
        data_1 = 0.0;
        data_2 = 0.0;
      }

      try {
        data_3 = data3[0]['totalValue_of_Credit_Document'];
        data_4 = data3[0]['totalValue_of_Credit_Amount'];
      } catch (e) {
        data_3 = 0.0;
        data_4 = 0.0;
      }

      try {
        data_5 = data4[0]['totalValue_of_HotCash_Document'];
        data_6 = data4[0]['totalValue_of_HotCash_Amount'];
      } catch (e) {
        data_5 = 0.0;
        data_6 = [0];
      }

      try {
        data_7 = data5[0]['totalValue_of_UPI_Document'];
        data_8 = data5[0]['totalValue_of_UPI_Amount'];
      } catch (e) {
        data_7 = 0.0;
        data_8 = 0.0;
      }

      try {
        data_9 = data5[0]['totalValue_of_Balance'];
        data_10 = data5[0]['totalValue_of_Excess'];
      } catch (e) {
        data_9 = 0.0;
        data_10 = 0.0;
      }

      try {
        data_11 = (data2[0]['totalValue_of_Cash_Document']) -
            (data5[0]['totalValue_of_Balance']);
      } catch (e) {
        data_11 = 0.0;
      }

      List<dynamic> lastVal = [
        data_1,
        data_2,
        data_3,
        data_4,
        data_5,
        data_6,
        data_7,
        data_8,
        data_9,
        data_10,
        data_11
      ];
    } catch (e) {
      print(e.toString());
      print('Error No: 9');
      return [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    }
  }
}
