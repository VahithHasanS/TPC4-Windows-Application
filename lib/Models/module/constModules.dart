// ignore_for_file: non_constant_identifier_names, file_names, camel_case_types

class MyDataSolidParty {
  final String Customer_Name;
  final DateTime Booking_Date;
  final int Document;
  final double Valid_Amount;
  final double Paid_Amount;
  final String Account_Type;
  final String Payment_Type;
  final double Balance_Amount;
  final double Excess_Amount;
  final String Booked_By;
  final String Is_Paid;
  final String Remarks;
  final Object mainID;

  MyDataSolidParty(
      this.Customer_Name,
      this.Booking_Date,
      this.Document,
      this.Valid_Amount,
      this.Paid_Amount,
      this.Account_Type,
      this.Payment_Type,
      this.Balance_Amount,
      this.Excess_Amount,
      this.Booked_By,
      this.Is_Paid,
      this.Remarks,
      this.mainID);
}

class MyDataSolidParty_Head {
  final DateTime Submited_Date;
  final int Document;
  final int Valid_Amount;
  final int Paid_Amount;
  final String Payment_Type;
  final int Balance_Amount;
  final int Excess_Amount;
  final String Entryed_By;
  final String Is_Paid;
  final String Remarks;
  final Object mainID;

  MyDataSolidParty_Head(
      this.Submited_Date,
      this.Document,
      this.Valid_Amount,
      this.Paid_Amount,
      this.Payment_Type,
      this.Balance_Amount,
      this.Excess_Amount,
      this.Entryed_By,
      this.Is_Paid,
      this.Remarks,
      this.mainID);
}

class MyExpense_Model {
  final DateTime Expense_Date;
  final String Expense_By;
  final int Get_Amount;
  final int Expensed_Amount;
  final int Balance_Amount;
  final int Excess_Amount;
  final String Get_From;
  final String For_Use;
  final String Remark;
  final Object mainID;

  MyExpense_Model(
      this.Expense_Date,
      this.Expense_By,
      this.Get_Amount,
      this.Expensed_Amount,
      this.Balance_Amount,
      this.Excess_Amount,
      this.Get_From,
      this.For_Use,
      this.Remark,
      this.mainID);
}

class List001 {
  final String Name;
  final String status;
  final Object Id;

  List001(this.Name, this.status, this.Id);
}
