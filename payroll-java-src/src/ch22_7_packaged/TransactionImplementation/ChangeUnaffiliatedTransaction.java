package TransactionImplementation;

import AbstractTransacions.ChangeAffiliationTransaction;
import PayrollDatabase.GlobalDatabase;
import PayrollDomain.Affiliation;
import PayrollDomain.Employee;
import PayrollFactory.PayrollFactory;
import PayrollImplementation.UnionAffiliation;

public class ChangeUnaffiliatedTransaction extends ChangeAffiliationTransaction {
	private PayrollFactory itsPayrollFactory;

	public ChangeUnaffiliatedTransaction(int empId, PayrollFactory payrollFactory) {
		super(empId);
		itsPayrollFactory = payrollFactory;
	}

	public Affiliation GetAffiliation() {
		return itsPayrollFactory.makeNoAffiliation();
	}

	public void RecordMembership(Employee e) {
		Affiliation af = e.GetAffiliation();
		if (af instanceof UnionAffiliation) {
			UnionAffiliation uf = (UnionAffiliation) af;
			int memberId = uf.GetMemberId();
			GlobalDatabase.payrollDB.RemoveUnionMember(memberId);
		}
	}
}
