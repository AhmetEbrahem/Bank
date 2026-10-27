class Basic_account {
  var _id;
  var _balance;
  Client? owner;

  withdraw(int wd) {
    if (_balance >= wd) {
      _balance -= wd;
      print("withdraw success");
      return _balance;
    }
    else{
       print("insufficient funds");
    }
  }

  deposit(number) {
    _balance += number;
    return _balance;
  }
  display(){
    print("Account ID :${_id},Balance : ${_balance}L.E");
  }


  Basic_account(this._balance, this._id);

  Basic_account.empty(){
    _id = "Unknown";
    _balance = 0.0;
  }

  get id => _id;

  set id(value) => _id = value;


  get balance => _balance;

  set balance(value) => _balance = value;
}

class saving_account extends Basic_account{
 var Min_Balance;

 saving_account(id ,balance,{this.Min_Balance=1000.0}):super(balance,id){
   if(balance<Min_Balance){
     print("Error Balance can't be less than 1000");
   }

 }



  @override
  withdraw(int wd) {
    if((balance-wd)>=Min_Balance){
    // TODO: implement withdraw
    return super.withdraw(wd);
  }
    else{
      print("insufficient funds");
    }
  }
  @override
  deposit(number) {
    if(number>=100){
    // TODO: implement deposit
    return super.deposit(number);
  }
  else{
    print("invalid value");
    }
  }

}

class Client{
  var name;
  var address;
  var phonenumber;
  Basic_account? account;
  Client(name,address,phonenumber){
    this.name=name;
    this.address=address;
    this.phonenumber=phonenumber;

  }

}


void main(){
  Client client1 = Client("John Doe", "Cairo, Egypt", "0123456789");

  // Create a savings account for the client
  saving_account acc1 = saving_account("ACC-001", 1500.0);
  client1.account = acc1;
  acc1.owner = client1;

  print("--- Testing Savings Account ---");
  acc1.display();

  // Test invalid deposit (< 100)
  acc1.deposit(50);

  // Test valid deposit (>= 100)
  acc1.deposit(200);

  // Test valid withdrawal
  acc1.withdraw(300);

  // Test invalid withdrawal (would drop below 1000)
  acc1.withdraw(500);






}

