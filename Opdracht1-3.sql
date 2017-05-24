/* 1. */
/*
SELECT Client.ClientNumber, Client.FirstName, Client.MiddleName, Client.FamilyName
FROM Client, Address, Loan
WHERE Client.AddressID = Address.ID
AND Loan.ClientID = Client.ID
AND LEFT(ZipCode, 4) >= 3000
AND LEFT(ZipCode, 4) <= 4000
AND Amount > 2500;
*/

/* 2 */
/*
SELECT Payment.Amount, Payment.Description, Payment.Date, Loan.ExpirationDate, 
Client.ClientNumber, Client.FirstName, Client.MiddleName, Client.FamilyName
FROM Payment, Loan, Client
WHERE Loan.ID = Payment.LoanID
AND Loan.ClientID = Client.ID
AND ExpirationDate >= GETDATE();
*/

/* 3 */
/*
DECLARE @balance int;
DECLARE @sum_credit int;
DECLARE @sum_debet int;

SELECT @balance = Balance FROM Account, Client
WHERE FamilyName = 'Van-Brabandt'
AND Account.Type = 'C'
AND Client.ID = Account.ClientID;

SELECT @sum_credit = SUM(Amount) FROM AccountTransaction, Account, Client
WHERE FamilyName = 'Van-Brabandt'
AND AccountTransaction.Type = 'C'
AND Account.Type = 'C'
AND Client.ID = Account.ClientID
AND AccountTransaction.AccountID = Account.ID;

SELECT @sum_debet = SUM(Amount) FROM AccountTransaction, Account, Client
WHERE FamilyName = 'Van-Brabandt'
AND AccountTransaction.Type = 'D'
AND Account.Type = 'C'
AND Client.ID = Account.ClientID
AND AccountTransaction.AccountID = Account.ID;

PRINT 'sum credit: ' + CONVERT(varchar(20), @sum_credit);
PRINT 'sum debet: ' + CONVERT(varchar(20), @sum_debet);
PRINT 'balance: ' + CONVERT(varchar(20), @balance);
PRINT @sum_credit - @sum_debet - @balance;
*/

/* 4 */

SELECT SUM(Payment.Amount), Client.FirstName, Client.MiddleName, Client.FamilyName 
FROM Payment, Loan, Client
WHERE Loan.ID = Payment.LoanID
AND Loan.ClientID = Client.ID
GROUP BY Client.FirstName, Client.MiddleName, Client.FamilyName;

