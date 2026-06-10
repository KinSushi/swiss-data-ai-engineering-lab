data transactions;
  input transaction_id $ amount currency $;
  datalines;
tx_001 125.50 CHF
tx_002 -25.00 CHF
tx_003 900.00 EUR
;
run;

proc means data=transactions mean min max;
  var amount;
run;
