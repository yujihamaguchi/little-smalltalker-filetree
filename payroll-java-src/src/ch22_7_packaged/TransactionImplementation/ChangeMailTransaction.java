package TransactionImplementation;

import AbstractTransacions.ChangeMethodTransaction;
import PayrollDomain.PaymentMethod;
import PayrollFactory.PayrollFactory;

public class ChangeMailTransaction extends ChangeMethodTransaction {
	private String itsAddress;
	private PayrollFactory itsPayrollFactory;

	public ChangeMailTransaction(int empId, String address, PayrollFactory payrollFactory) {
		super(empId);
		itsAddress = address;
		itsPayrollFactory = payrollFactory;
	}

	public PaymentMethod GetMethod() {
		return itsPayrollFactory.makeMailMethod(itsAddress);
	}
}
