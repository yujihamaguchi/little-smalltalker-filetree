package TransactionImplementation;

import AbstractTransacions.ChangeMethodTransaction;
import PayrollDomain.PaymentMethod;
import PayrollFactory.PayrollFactory;

public class ChangeDirectTransaction extends ChangeMethodTransaction {
	private String itsBank;
	private String itsAccount;
	private PayrollFactory itsPayrollFactory;

	public ChangeDirectTransaction(int empId, String bank, String account,
			PayrollFactory payrollFactory) {
		super(empId);
		itsBank = bank;
		itsAccount = account;
		itsPayrollFactory = payrollFactory;
	}

	public PaymentMethod GetMethod() {
		return itsPayrollFactory.makeDirectMethod(itsBank, itsAccount);
	}
}