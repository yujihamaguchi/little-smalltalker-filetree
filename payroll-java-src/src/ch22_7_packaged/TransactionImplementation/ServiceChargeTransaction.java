package TransactionImplementation;

import java.util.Calendar;

import PayrollDatabase.GlobalDatabase;
import PayrollDomain.Affiliation;
import PayrollDomain.Employee;
import PayrollImplementation.UnionAffiliation;
import TransactionApplication.Transaction;

public class ServiceChargeTransaction implements Transaction {
	private int memberId;
	private Calendar date;
	private double amount;

	public ServiceChargeTransaction(int memberId, Calendar date, double amount) {
		this.memberId = memberId;
		this.date = date;
		this.amount = amount;
	}

	public void Execute() {
		Employee e = GlobalDatabase.payrollDB.GetUnionMember(memberId);
		Affiliation af = e.GetAffiliation();
		if (af instanceof UnionAffiliation) {
			UnionAffiliation uaf = (UnionAffiliation) af;
			uaf.AddServiceCahrge(date, amount);
		}
	}
}
