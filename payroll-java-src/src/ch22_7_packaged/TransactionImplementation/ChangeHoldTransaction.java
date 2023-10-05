package TransactionImplementation;

import AbstractTransacions.ChangeMethodTransaction;
import PayrollDomain.PaymentMethod;
import PayrollFactory.PayrollFactory;

public class ChangeHoldTransaction extends ChangeMethodTransaction {
	private PayrollFactory itsPayrollFactory;

	public ChangeHoldTransaction(int empId, PayrollFactory payrollFactory) {
		super(empId);
		itsPayrollFactory = payrollFactory;
	}

	public PaymentMethod GetMethod() {
		return itsPayrollFactory.makeHoldMethod();
	}
}
